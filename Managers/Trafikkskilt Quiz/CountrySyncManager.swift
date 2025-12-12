//
//  CountrySyncManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 13/10/25.
//

import Foundation
import FirebaseFirestore
import SwiftData
import SwiftUI
import Combine

@MainActor
final class CountrySyncManager: ObservableObject {
    @Published var isDownloading = false
    @Published var progress: Double = 0.0
    @Published var currentCountry: Country? = nil
    @Published var contextSet = false
    
    static let shared = CountrySyncManager(context: nil)
    private var context: ModelContext?
    private let db = Firestore.firestore()
    
    @AppStorage("supportedCountriesData") private var supportedCountriesData: Data = Data()
    private var supportedCountries: [Country] {
        guard
            let stored = try? JSONDecoder().decode([String].self, from: supportedCountriesData)
        else { return [] }
        return stored.compactMap { Country(rawValue: $0) }
    }
    
    init(context: ModelContext?) {
        self.context = context
    }
    
    @MainActor
    func setContext(_ context: ModelContext) {
        self.context = context
        contextSet = true
    }
    
    @MainActor
    @discardableResult
    func fetchSupportedCountries() async throws -> [Country] {
        let snapshot = try await Firestore.firestore()
            .collection("config")
            .document("app_settings")
            .getDocument()
        
        guard let data = snapshot.data(),
              let list = data["supportedCountries"] as? [String] else {
            print("⚠️ supportedCountries field not found in Firestore.")
            return []
        }
        
        print("🌍 Supported countries from Firestore:", list)
        
        let countries = list.compactMap { Country(rawValue: $0) }
        
        let encoded = try JSONEncoder().encode(list)
        UserDefaults.standard.set(encoded, forKey: "supportedCountries")
        supportedCountriesData = encoded
        
        return countries
    }
    
    @discardableResult
    func syncUserCountryIfNeeded(_ country: Country) async -> Bool {
        do {
            print("🔍 Checking \(country.rawValue) for updates...")
            print("   📍 Firestore ID: \(country.firestoreID)")
            
            guard let context else {
                print("❌ No ModelContext provided.")
                return false
            }
            
            print("📡 Fetching remote lastUpdated date...")
            let remoteDate = try await fetchCountryLastUpdated(for: country)
            print("✅ Remote lastUpdated: \(remoteDate)")
            
            print("🔎 Searching local database for \(country.rawValue)...")
            let local = try? context.fetch(
                FetchDescriptor<CountryDataEntity>(
                    predicate: #Predicate { $0.country == country.rawValue }
                )
            ).first
            
            if let local {
                print("📦 Found local data for \(country.rawValue)")
                print("   Local lastUpdated: \(local.lastUpdated)")
                print("   Remote lastUpdated: \(remoteDate)")
                
                let calendar = Calendar.current
                if calendar.isDate(remoteDate, inSameDayAs: local.lastUpdated) {
                    print("✅ \(country.rawValue) is already up to date — skipping sync.")
                    
                    await MainActor.run {
                        self.isDownloading = false
                        self.progress = 1.0
                        self.currentCountry = nil
                    }
                    
                    return false
                } else {
                    print("⚠️ \(country.rawValue) data is outdated — removing old data before sync.")
                    deleteLocalCountryData(for: country)
                }
            } else {
                print("ℹ️ No local data found for \(country.rawValue), downloading fresh.")
            }
            
            await MainActor.run {
                self.isDownloading = true
                self.progress = 0.0
                self.currentCountry = country
            }
            print("🔄 Set UI state to downloading")
            
            print("⬇️ Downloading \(country.rawValue) data from Firebase...")
            let remoteData = try await fetchCountryData(for: country)
            print("✅ Successfully fetched remote data")
            print("   Country: \(remoteData.country.rawValue)")
            print("   Sections: \(remoteData.sections.count)")
            
            print("💾 Syncing to SwiftData...")
            try await syncCountryToSwiftData(remoteData)
            print("🎉 \(country.rawValue) synced successfully.")
            
            await MainActor.run {
                self.isDownloading = false
                self.progress = 1.0
                self.currentCountry = nil
            }
            print("✅ Final UI state updated")
            
            return true
        } catch {
            print("❌ Sync failed for \(country.rawValue)")
            print("   Error: \(error)")
            print("   LocalizedDescription: \(error.localizedDescription)")
            
            if let firestoreError = error as NSError? {
                print("   Domain: \(firestoreError.domain)")
                print("   Code: \(firestoreError.code)")
                print("   UserInfo: \(firestoreError.userInfo)")
            }
            
            await MainActor.run {
                self.isDownloading = false
                self.progress = 0.0
                self.currentCountry = nil
            }
            return false
        }
    }
    
    private func deleteLocalCountryData(for country: Country) {
        guard let context else { return }
        do {
            if let existing = try context.fetch(
                FetchDescriptor<CountryDataEntity>(
                    predicate: #Predicate { $0.country == country.rawValue }
                )
            ).first {
                print("🗑️ Deleting old SwiftData entry for \(country.rawValue)")
                context.delete(existing)
                try context.save()
            }
            let fileManager = FileManager.default
            let baseDir = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
            let countryDir = baseDir.appendingPathComponent("TrafficSigns/\(country.rawValue)", isDirectory: true)
            if fileManager.fileExists(atPath: countryDir.path) {
                print("🗑️ Deleting cached images for \(country.rawValue)")
                try fileManager.removeItem(at: countryDir)
            }
        } catch {
            print("⚠️ Failed to delete old data for \(country.rawValue): \(error.localizedDescription)")
        }
    }
    
    private func fetchCountryLastUpdated(for country: Country) async throws -> Date {
        let docRef = db.collection("countries").document(country.firestoreID)
        let snapshot = try await docRef.getDocument()
        
        guard snapshot.exists else {
            throw NSError(domain: "Firestore", code: 404,
                          userInfo: [NSLocalizedDescriptionKey: "Document not found for \(country.firestoreID)"])
        }
        
        // Get the nested data under the country key
        guard let countryData = snapshot.data()?[country.firestoreID] as? [String: Any] else {
            print("❌ Could not find data under key: \(country.firestoreID)")
            throw NSError(domain: "Firestore", code: 404,
                          userInfo: [NSLocalizedDescriptionKey: "Missing country data for \(country.firestoreID)"])
        }
        
        print("✅ Found country data: \(countryData.keys)")
        
        // Try to get as Timestamp first, then as String
        if let timestamp = countryData["lastUpdated"] as? Timestamp {
            print("✅ Found Timestamp: \(timestamp)")
            return timestamp.dateValue()
        } else if let dateString = countryData["lastUpdated"] as? String {
            print("✅ Found String: \(dateString)")
            let formatter = ISO8601DateFormatter()
            if let date = formatter.date(from: dateString) {
                return date
            }
        } else {
            print("❌ lastUpdated value: \(countryData["lastUpdated"] ?? "nil")")
        }
        
        throw NSError(domain: "Firestore", code: 404,
                      userInfo: [NSLocalizedDescriptionKey: "Missing lastUpdated for \(country.firestoreID)"])
    }
    
    private func fetchCountryData(for country: Country) async throws -> CountryData {
        let docRef = db.collection("countries").document(country.firestoreID)
        let snapshot = try await docRef.getDocument()
        
        guard snapshot.exists else {
            throw NSError(domain: "Firestore", code: 404,
                          userInfo: [NSLocalizedDescriptionKey: "No Firestore document for \(country.firestoreID)"])
        }
        
        // Get the nested data under the country key
        guard var countryData = snapshot.data()?[country.firestoreID] as? [String: Any] else {
            throw NSError(domain: "Firestore", code: 404,
                          userInfo: [NSLocalizedDescriptionKey: "Empty Firestore data for \(country.firestoreID)"])
        }
        
        // Replace the ISO code with the Country enum raw value
        countryData["country"] = country.rawValue
        
        if let alcoholUnit = countryData["alcoholUnit"] as? String {
            if alcoholUnit.lowercased() == "permille" {
                countryData["alcoholUnit"] = "‰"
            } else if alcoholUnit.lowercased() == "percent" || alcoholUnit.lowercased() == "percentage" {
                countryData["alcoholUnit"] = "%"
            }
        }
        
        let cleanData = countryData.mapValues { value -> Any in
            if let timestamp = value as? Timestamp {
                return timestamp.dateValue().ISO8601Format()
            }
            return value
        }
        
        let jsonData = try JSONSerialization.data(withJSONObject: cleanData)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let decoded = try decoder.decode(CountryData.self, from: jsonData)
            print("✅ Successfully decoded CountryData for \(country.rawValue)")
            return decoded
        } catch {
            print("❌ Decoding error for \(country.rawValue): \(error)")
            throw error
        }
    }
    
    private func syncCountryToSwiftData(_ countryData: CountryData) async throws {
        guard let context else { return }
        
        print("🔄 Processing \(countryData.sections.count) sections for \(countryData.country.rawValue)...")
        
        let totalSigns = countryData.sections.reduce(0) { total, section in
            let subSigns = section.subsections?.reduce(0) { $0 + $1.signs.count } ?? 0
            return total + section.signs.count + subSigns
        }
        var processedSigns = 0.0
        
        // MARK: - Async image downloader (runs in parallel but preserves order)
        func downloadImageData(from urls: [String?]) async -> [Data] {
            guard !urls.isEmpty else { return [] }
            
            return await withTaskGroup(of: (index: Int, data: Data?).self) { group in
                for (index, urlString) in urls.enumerated() {
                    group.addTask {
                        guard let urlString = urlString else {
                            return (index, nil)
                        }
                        
                        guard let url = URL(string: urlString),
                              url.scheme?.hasPrefix("http") == true else {
                            print("⚠️ Invalid URL:", urlString)
                            return (index, nil)
                        }
                        
                        do {
                            print("🌐 Downloading:", url.absoluteString)
                            let (data, response) = try await URLSession.shared.data(from: url)
                            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                                print("🚫 HTTP error for:", url.absoluteString)
                                return (index, nil)
                            }
                            print("📥 Downloaded image")
                            return (index, data)
                        } catch {
                            print("❌ Failed to download \(url.absoluteString): \(error.localizedDescription)")
                            return (index, nil)
                        }
                    }
                }
                
                var indexedResults: [(index: Int, data: Data?)] = []
                for await result in group {
                    indexedResults.append(result)
                }
                
                return indexedResults
                    .sorted { $0.index < $1.index }
                    .compactMap { $0.data }
            }
        }
        
        // MARK: - Collect all image URLs for entire section (batch download)
        func collectAllImageUrls(from section: TrafficSection) -> [String?] {
            var urls: [String?] = []
            
            // Collect from section signs
            urls.append(contentsOf: section.signs.flatMap { $0.images.map { $0.url } })
            
            // Collect from subsection signs
            if let subSections = section.subsections {
                for subSection in subSections {
                    urls.append(contentsOf: subSection.signs.flatMap { $0.images.map { $0.url } })
                }
            }
            
            return urls
        }
        
        // MARK: - Download all images and build entities
        var sectionEntities: [TrafficSectionEntity] = []
        
        for section in countryData.sections {
            print("⬇️ Batch downloading all images for section \(section.index)...")
            
            // MARK: - Download ALL images for this section upfront
            let allImageUrls = collectAllImageUrls(from: section)
            let allDownloadedImages = await downloadImageData(from: allImageUrls)
            var imageIndex = 0
            
            // MARK: - Convert section language dictionary
            var sectionLanguage: [String: SectionLanguageContent] = [:]
            for (langCode, langData) in section.language {
                sectionLanguage[langCode] = SectionLanguageContent(
                    name: langData.name,
                    details: langData.details
                )
            }
            
            // MARK: - Process subsections if they exist
            var subSectionEntities: [TrafficSubSectionEntity] = []
            
            if let subSections = section.subsections, !subSections.isEmpty {
                for sub in subSections {
                    // Convert subsection language dictionary
                    var subLanguage: [String: SubsectionLanguageContent] = [:]
                    for (langCode, langData) in sub.language {
                        subLanguage[langCode] = SubsectionLanguageContent(
                            name: langData.name,
                            details: langData.details
                        )
                    }
                    
                    // Process signs in subsection
                    var subSignEntities: [TrafficSignEntity] = []
                    for sign in sub.signs {
                        // Convert sign language dictionary
                        var signLanguage: [String: SignLanguageContent] = [:]
                        for (langCode, langData) in sign.language {
                            signLanguage[langCode] = SignLanguageContent(
                                title: langData.title,
                                details: langData.description,
                                wrongAnswers: langData.wrongAnswers,
                                sectionName: langData.sectionName,
                                subSectionName: langData.subSectionName
                            )
                        }
                        
                        // Get images for this sign from pre-downloaded batch
                        let signImageCount = sign.images.count
                        let startIndex = imageIndex
                        let endIndex = min(imageIndex + signImageCount, allDownloadedImages.count)
                        let signImages = startIndex < endIndex ? Array(allDownloadedImages[startIndex..<endIndex]) : []
                        imageIndex = endIndex
                        
                        print("📥 Sign \(sign.index): expected \(signImageCount) images, got \(signImages.count)")
                        
                        let signEntity = TrafficSignEntity(
                            id: UUID().uuidString,
                            index: sign.index,
                            difficulty: sign.difficulty,
                            imageData: signImages,
                            language: signLanguage
                        )
                        
                        await MainActor.run {
                            processedSigns += 1
                            self.progress = processedSigns / Double(totalSigns)
                        }
                        
                        subSignEntities.append(signEntity)
                    }
                    
                    subSectionEntities.append(
                        TrafficSubSectionEntity(
                            id: UUID().uuidString,
                            index: sub.index,
                            language: subLanguage,
                            signs: subSignEntities
                        )
                    )
                }
            }
            
            // MARK: - Process section signs
            var signEntities: [TrafficSignEntity] = []
            for sign in section.signs {
                // Convert sign language dictionary
                var signLanguage: [String: SignLanguageContent] = [:]
                for (langCode, langData) in sign.language {
                    signLanguage[langCode] = SignLanguageContent(
                        title: langData.title,
                        details: langData.description,
                        wrongAnswers: langData.wrongAnswers,
                        sectionName: langData.sectionName,
                        subSectionName: langData.subSectionName
                    )
                }
                
                // Get images for this sign from pre-downloaded batch
                let signImageCount = sign.images.count
                let signImages = Array(allDownloadedImages[imageIndex..<min(imageIndex + signImageCount, allDownloadedImages.count)])
                imageIndex += signImageCount
                
                let signEntity = TrafficSignEntity(
                    id: UUID().uuidString,
                    index: sign.index,
                    difficulty: sign.difficulty,
                    imageData: signImages,
                    language: signLanguage
                )
                
                await MainActor.run {
                    processedSigns += 1
                    self.progress = processedSigns / Double(totalSigns)
                }
                
                signEntities.append(signEntity)
            }
            
            sectionEntities.append(
                TrafficSectionEntity(
                    id: UUID().uuidString,
                    index: section.index,
                    language: sectionLanguage,
                    subSections: subSectionEntities.isEmpty ? nil : subSectionEntities,
                    signs: signEntities
                )
            )
        }
        
        // MARK: - Save to database on MainActor
        try await MainActor.run {
            // MARK: - Convert country language dictionary
            var countryLanguage: [String: CountryLanguageContent] = [:]
            for (langCode, langData) in countryData.language {
                countryLanguage[langCode] = CountryLanguageContent(
                    generalInformation: langData.generalInformation,
                    drivingRules: langData.drivingRules
                )
            }
            
            // MARK: - Create and save country entity
            let speedLimits = SpeedLimits(
                urban: countryData.speedLimits.urban,
                rural: countryData.speedLimits.rural,
                motorway: countryData.speedLimits.motorway
            )
            
            let entity = CountryDataEntity(
                id: countryData.id,
                country: countryData.country.rawValue,
                drivingSide: countryData.drivingSide.rawValue,
                alcoholLimit: countryData.alcoholLimit,
                alcoholUnit: countryData.alcoholUnit.rawValue,
                emergencyNumber: countryData.emergencyNumber,
                currency: countryData.currency,
                speedUnit: countryData.speedUnit,
                speedLimits: speedLimits,
                lastUpdated: countryData.lastUpdated,
                language: countryLanguage,
                sections: sectionEntities
            )
            
            print("✅ Setting relationships...")
            
            // Set country reference on all sections
            for section in entity.sections {
                section.country = entity
                
                // Set section reference on all section signs
                for sign in section.signs {
                    sign.section = section
                    sign.subSection = nil
                }
                
                // Set section reference on subsections and their signs
                if let subSections = section.subSections {
                    for subSection in subSections {
                        subSection.section = section
                        
                        // Set subsection reference on subsection signs
                        for sign in subSection.signs {
                            sign.subSection = subSection
                            sign.section = nil
                        }
                    }
                }
            }
            
            print("✅ Inserting entity...")
            context.insert(entity)
            print("✅ Saving context...")
            try context.save()
            print("✅ Context saved!")
            
            print("💾 Finished saving \(countryData.country.rawValue)")
            print("   Sections: \(sectionEntities.count)")
            let totalSignsSaved = sectionEntities.flatMap { $0.signs }.count +
            sectionEntities.flatMap { $0.subSections ?? [] }.flatMap { $0.signs }.count
            print("   Total signs saved: \(totalSignsSaved)")
            
            self.progress = 1.0
            self.isDownloading = false
            self.currentCountry = nil
        }
    }
    
//    private func syncCountryToSwiftData(_ countryData: CountryData) async throws {
//        guard let context else { return }
//        
//        print("🔄 Processing \(countryData.sections.count) sections for \(countryData.country.rawValue)...")
//        
//        let totalSigns = countryData.sections.reduce(0) { total, section in
//            let subSigns = section.subsections?.reduce(0) { $0 + $1.signs.count } ?? 0
//            return total + section.signs.count + subSigns
//        }
//        var processedSigns = 0.0
//        
//        // MARK: - Async image downloader (runs in parallel but preserves order)
//        func downloadImageData(from urls: [String?]) async -> [Data] {
//            guard !urls.isEmpty else { return [] }
//            
//            // Create indexed tasks to preserve order
//            return await withTaskGroup(of: (index: Int, data: Data?).self) { group in
//                for (index, urlString) in urls.enumerated() {
//                    group.addTask {
//                        guard let urlString = urlString else {
//                            return (index, nil)
//                        }
//                        
//                        guard let url = URL(string: urlString),
//                              url.scheme?.hasPrefix("http") == true else {
//                            print("⚠️ Invalid URL:", urlString)
//                            return (index, nil)
//                        }
//                        
//                        do {
//                            print("🌐 Downloading:", url.absoluteString)
//                            let (data, response) = try await URLSession.shared.data(from: url)
//                            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//                                print("🚫 HTTP error for:", url.absoluteString)
//                                return (index, nil)
//                            }
//                            print("📥 Downloaded image")
//                            return (index, data)
//                        } catch {
//                            print("❌ Failed to download \(url.absoluteString): \(error.localizedDescription)")
//                            return (index, nil)
//                        }
//                    }
//                }
//                
//                // Collect results with their indices
//                var indexedResults: [(index: Int, data: Data?)] = []
//                for await result in group {
//                    indexedResults.append(result)
//                }
//                
//                // Sort by original index to restore order, then extract data
//                return indexedResults
//                    .sorted { $0.index < $1.index }
//                    .compactMap { $0.data }
//            }
//        }
//        
//        // MARK: - Download all images and build entities
//        var sectionEntities: [TrafficSectionEntity] = []
//        
//        for section in countryData.sections {
//            // MARK: - Convert section language dictionary
//            var sectionLanguage: [String: SectionLanguageContent] = [:]
//            for (langCode, langData) in section.language {
//                sectionLanguage[langCode] = SectionLanguageContent(
//                    name: langData.name,
//                    details: langData.details
//                )
//            }
//            
//            // MARK: - Process subsections if they exist
//            var subSectionEntities: [TrafficSubSectionEntity] = []
//            
//            if let subSections = section.subsections, !subSections.isEmpty {
//                for sub in subSections {
//                    // Convert subsection language dictionary
//                    var subLanguage: [String: SubsectionLanguageContent] = [:]
//                    for (langCode, langData) in sub.language {
//                        subLanguage[langCode] = SubsectionLanguageContent(
//                            name: langData.name,
//                            details: langData.details
//                        )
//                    }
//                    
//                    // Process signs in subsection
//                    var subSignEntities: [TrafficSignEntity] = []
//                    for sign in sub.signs {
//                        // Convert sign language dictionary
//                        var signLanguage: [String: SignLanguageContent] = [:]
//                        for (langCode, langData) in sign.language {
//                            signLanguage[langCode] = SignLanguageContent(
//                                title: langData.title,
//                                details: langData.description,
//                                wrongAnswers: langData.wrongAnswers,
//                                sectionName: langData.sectionName,
//                                subSectionName: langData.subSectionName
//                            )
//                        }
//                        
//                        // Download images in parallel
//                        let imageUrls = sign.images.map { $0.url }
//                        let downloadedImages = await downloadImageData(from: imageUrls)
//                        
//                        let signEntity = TrafficSignEntity(
//                            id: UUID().uuidString,
//                            index: sign.index,
//                            difficulty: sign.difficulty,
//                            imageData: downloadedImages,
//                            language: signLanguage
//                        )
//                        
//                        await MainActor.run {
//                            processedSigns += 1
//                            self.progress = processedSigns / Double(totalSigns)
//                        }
//                        
//                        subSignEntities.append(signEntity)
//                    }
//                    
//                    subSectionEntities.append(
//                        TrafficSubSectionEntity(
//                            id: UUID().uuidString,
//                            index: sub.index,
//                            language: subLanguage,
//                            signs: subSignEntities
//                        )
//                    )
//                }
//            }
//            
//            // MARK: - Process section signs
//            var signEntities: [TrafficSignEntity] = []
//            for sign in section.signs {
//                // Convert sign language dictionary
//                var signLanguage: [String: SignLanguageContent] = [:]
//                for (langCode, langData) in sign.language {
//                    signLanguage[langCode] = SignLanguageContent(
//                        title: langData.title,
//                        details: langData.description,
//                        wrongAnswers: langData.wrongAnswers,
//                        sectionName: langData.sectionName,
//                        subSectionName: langData.subSectionName
//                    )
//                }
//                
//                // Download images in parallel
//                let imageUrls = sign.images.map { $0.url }
//                let downloadedImages = await downloadImageData(from: imageUrls)
//                
//                let signEntity = TrafficSignEntity(
//                    id: UUID().uuidString,
//                    index: sign.index,
//                    difficulty: sign.difficulty,
//                    imageData: downloadedImages,
//                    language: signLanguage
//                )
//                
//                await MainActor.run {
//                    processedSigns += 1
//                    self.progress = processedSigns / Double(totalSigns)
//                }
//                
//                signEntities.append(signEntity)
//            }
//            
//            sectionEntities.append(
//                TrafficSectionEntity(
//                    id: UUID().uuidString,
//                    index: section.index,
//                    language: sectionLanguage,
//                    subSections: subSectionEntities.isEmpty ? nil : subSectionEntities,
//                    signs: signEntities
//                )
//            )
//        }
//        
//        // MARK: - Save to database on MainActor
//        try await MainActor.run {
//            // MARK: - Convert country language dictionary
//            var countryLanguage: [String: CountryLanguageContent] = [:]
//            for (langCode, langData) in countryData.language {
//                countryLanguage[langCode] = CountryLanguageContent(
//                    generalInformation: langData.generalInformation,
//                    drivingRules: langData.drivingRules
//                )
//            }
//            
//            // MARK: - Create and save country entity
//            let speedLimits = SpeedLimits(
//                urban: countryData.speedLimits.urban,
//                rural: countryData.speedLimits.rural,
//                motorway: countryData.speedLimits.motorway
//            )
//            
//            let entity = CountryDataEntity(
//                id: countryData.id,
//                country: countryData.country.rawValue,
//                drivingSide: countryData.drivingSide.rawValue,
//                alcoholLimit: countryData.alcoholLimit,
//                alcoholUnit: countryData.alcoholUnit.rawValue,
//                emergencyNumber: countryData.emergencyNumber,
//                currency: countryData.currency,
//                speedUnit: countryData.speedUnit,
//                speedLimits: speedLimits,
//                lastUpdated: countryData.lastUpdated,
//                language: countryLanguage,
//                sections: sectionEntities
//            )
//            
//            print("✅ Setting relationships...")
//            
//            // Set country reference on all sections
//            for section in entity.sections {
//                section.country = entity
//                
//                // Set section reference on all section signs
//                for sign in section.signs {
//                    sign.section = section
//                    sign.subSection = nil
//                }
//                
//                // Set section reference on subsections and their signs
//                if let subSections = section.subSections {
//                    for subSection in subSections {
//                        subSection.section = section
//                        
//                        // Set subsection reference on subsection signs
//                        for sign in subSection.signs {
//                            sign.subSection = subSection
//                            sign.section = nil
//                        }
//                    }
//                }
//            }
//            
//            print("✅ Inserting entity...")
//            context.insert(entity)
//            print("✅ Saving context...")
//            try context.save()
//            print("✅ Context saved!")
//            
//            print("💾 Finished saving \(countryData.country.rawValue)")
//            print("   Sections: \(sectionEntities.count)")
//            let totalSignsSaved = sectionEntities.flatMap { $0.signs }.count +
//            sectionEntities.flatMap { $0.subSections ?? [] }.flatMap { $0.signs }.count
//            print("   Total signs saved: \(totalSignsSaved)")
//            
//            self.progress = 1.0
//            self.isDownloading = false
//            self.currentCountry = nil
//        }
//    }
}

extension Country {
    var firestoreID: String {
        rawValue.lowercased().replacingOccurrences(of: " ", with: "_")
    }
}

//import Foundation
//import FirebaseFirestore
//import SwiftData
//import SwiftUI
//import Combine
//
//@MainActor
//final class CountrySyncManager: ObservableObject {
//    // MARK: - Published properties for progress/UI binding
//    @Published var isDownloading = false
//    @Published var progress: Double = 0.0
//    @Published var currentCountry: Country? = nil
//    @Published var contextSet = false
//    
//    // MARK: - Singleton instance
//    static let shared = CountrySyncManager(context: /* Provide a ModelContext instance here, e.g. nil or context from app environment */ nil)
//    private var context: ModelContext?
//    private let db = Firestore.firestore()
//    
//    @AppStorage("supportedCountriesData") private var supportedCountriesData: Data = Data()
//    private var supportedCountries: [Country] {
//        guard
//            let stored = try? JSONDecoder().decode([String].self, from: supportedCountriesData)
//        else { return [] }
//        return stored.compactMap { Country(rawValue: $0) }
//    }
//    
//    init(context: ModelContext?) {
//        self.context = context
//    }
//    
//    @MainActor
//    func setContext(_ context: ModelContext) {
//        self.context = context
//        contextSet = true
//    }
//    
//    // MARK: - Public API
//    
//    @MainActor
//    @discardableResult
//    func fetchSupportedCountries() async throws -> [Country] {
//        let snapshot = try await Firestore.firestore()
//            .collection("config")
//            .document("app_settings")
//            .getDocument()
//        
//        guard let data = snapshot.data(),
//              let list = data["supportedCountries"] as? [String] else {
//            print("⚠️ supportedCountries field not found in Firestore.")
//            return []
//        }
//        
//        print("🌍 Supported countries from Firestore:", list)
//        
//        // Decode into Country enum array (skip invalid ones)
//        let countries = list.compactMap { Country(rawValue: $0) }
//        
//        // ✅ Store in AppStorage for caching
//        let encoded = try JSONEncoder().encode(list)
//        UserDefaults.standard.set(encoded, forKey: "supportedCountries")
//        supportedCountriesData = encoded
//        
//        return countries
//    }
//    
//    @discardableResult
//    func syncUserCountryIfNeeded(_ country: Country) async -> Bool {
//        do {
//            print("🔍 Checking \(country.rawValue) for updates...")
//            guard let context else { print("❌ No ModelContext provided."); return false }
//            let remoteDate = try await fetchCountryLastUpdated(for: country)
//            let local = try? context.fetch(
//                FetchDescriptor<CountryDataEntity>(
//                    predicate: #Predicate { $0.country == country.rawValue }
//                )
//            ).first
//            if let local {
//                print("📦 Found local data for \(country.rawValue)")
//                print("   Local lastUpdated: \(local.lastUpdated)")
//                print("   Remote lastUpdated: \(remoteDate)")
//                let calendar = Calendar.current
//                if !calendar.isDate(remoteDate, inSameDayAs: local.lastUpdated) {
//                    print("⚠️ \(country.rawValue) data is outdated — removing old data before sync.")
//                    deleteLocalCountryData(for: country)
//                } else {
//                    print("✅ \(country.rawValue) is already up to date — skipping sync.")
//                    
//                    await MainActor.run {
//                        self.isDownloading = false
//                        self.progress = 1.0
//                        self.currentCountry = nil
//                    }
//                    
//                    return false // No update needed
//                }
//            } else {
//                print("ℹ️ No local data found for \(country.rawValue), downloading fresh.")
//            }
//            
//            await MainActor.run {
//                self.isDownloading = true
//                self.progress = 0.0
//                self.currentCountry = country
//            }
//            
//            print("⬇️ Downloading \(country.rawValue) data from Firebase...")
//            let remoteData = try await fetchCountryData(for: country)
//            try await syncCountryToSwiftData(remoteData)
//            print("🎉 \(country.rawValue) synced successfully.")
//            
//            await MainActor.run {
//                self.isDownloading = false
//                self.progress = 1.0
//                self.currentCountry = nil
//            }
//            
//            return true // Update happened
//        } catch {
//            print("❌ Sync failed for \(country.rawValue): \(error.localizedDescription)")
//            await MainActor.run {
//                self.isDownloading = false
//                self.progress = 0.0
//                self.currentCountry = nil
//            }
//            return false // Update failed
//        }
//    }
//    
//    // MARK: - Private helpers
//    
//    private func deleteLocalCountryData(for country: Country) {
//        guard let context else { return }
//        do {
//            // Delete SwiftData entity
//            if let existing = try context.fetch(
//                FetchDescriptor<CountryDataEntity>(
//                    predicate: #Predicate { $0.country == country.rawValue }
//                )
//            ).first {
//                print("🗑️ Deleting old SwiftData entry for \(country.rawValue)")
//                context.delete(existing)
//                try context.save()
//            }
//            // Delete cached images
//            let fileManager = FileManager.default
//            let baseDir = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
//            let countryDir = baseDir.appendingPathComponent("TrafficSigns/\(country.rawValue)", isDirectory: true)
//            if fileManager.fileExists(atPath: countryDir.path) {
//                print("🗑️ Deleting cached images for \(country.rawValue)")
//                try fileManager.removeItem(at: countryDir)
//            }
//        } catch {
//            print("⚠️ Failed to delete old data for \(country.rawValue): \(error.localizedDescription)")
//        }
//    }
//    
//    private func fetchCountryLastUpdated(for country: Country) async throws -> Date {
//        let docRef = db.collection("countries").document(country.firestoreID)
//        let snapshot = try await docRef.getDocument()
//        
//        guard snapshot.exists else {
//            throw NSError(domain: "Firestore", code: 404,
//                          userInfo: [NSLocalizedDescriptionKey: "Document not found for \(country.firestoreID)"])
//        }
//        guard let timestamp = snapshot.get("lastUpdated") as? Timestamp else {
//            throw NSError(domain: "Firestore", code: 404,
//                          userInfo: [NSLocalizedDescriptionKey: "Missing lastUpdated for \(country.firestoreID)"])
//        }
//        return timestamp.dateValue()
//    }
//    
//    private func fetchCountryData(for country: Country) async throws -> CountryData {
//        let docRef = db.collection("countries").document(country.firestoreID)
//        let snapshot = try await docRef.getDocument()
//        
//        guard snapshot.exists else {
//            throw NSError(domain: "Firestore", code: 404,
//                          userInfo: [NSLocalizedDescriptionKey: "No Firestore document for \(country.firestoreID)"])
//        }
//        guard let data = snapshot.data() else {
//            throw NSError(domain: "Firestore", code: 404,
//                          userInfo: [NSLocalizedDescriptionKey: "Empty Firestore data for \(country.firestoreID)"])
//        }
//        
//        // Convert Firestore timestamps to ISO8601 strings for decoding
//        let cleanData = data.mapValues { value -> Any in
//            if let timestamp = value as? Timestamp {
//                return timestamp.dateValue().ISO8601Format()
//            }
//            return value
//        }
//        
//        // 🔍 DEBUG: Print raw and cleaned Firestore data
//        //        print("🧩 Raw Firestore data keys:", Array(data.keys))
//        if let jsonString = try? JSONSerialization.data(withJSONObject: cleanData, options: .prettyPrinted),
//           let formattedString = String(data: jsonString, encoding: .utf8) {
//            //            print("📜 Cleaned Firestore JSON:\n\(formattedString)")
//        }
//        
//        let jsonData = try JSONSerialization.data(withJSONObject: cleanData)
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        
//        do {
//            let decoded = try decoder.decode(CountryData.self, from: jsonData)
//            print("✅ Successfully decoded CountryData for \(country.rawValue)")
//            return decoded
//        } catch {
//            print("❌ Decoding error for \(country.rawValue): \(error)")
//            if let decodingError = error as? DecodingError {
//                switch decodingError {
//                case .keyNotFound(let key, let context):
//                    print("🚫 Missing key:", key)
//                    print("   Context:", context.debugDescription)
//                    print("   CodingPath:", context.codingPath)
//                case .typeMismatch(let type, let context):
//                    print("🚫 Type mismatch:", type)
//                    print("   Context:", context.debugDescription)
//                    print("   CodingPath:", context.codingPath)
//                case .valueNotFound(let type, let context):
//                    print("🚫 Value not found:", type)
//                    print("   Context:", context.debugDescription)
//                    print("   CodingPath:", context.codingPath)
//                case .dataCorrupted(let context):
//                    print("🚫 Data corrupted:", context.debugDescription)
//                    print("   CodingPath:", context.codingPath)
//                @unknown default:
//                    print("⚠️ Unknown decode error:", decodingError)
//                }
//            }
//            throw error
//        }
//    }
//    
//    // MARK: - Save to SwiftData (no deletion logic here)
//    
//    private func syncCountryToSwiftData(_ countryData: CountryData) async throws {
//        guard let context else { return }
//        
//        // MARK: - Async image downloader
//        func downloadImageData(from urls: [String]) async -> [(Data, String)] {
//            guard !urls.isEmpty else { return [] }
//            
//            return await withTaskGroup(of: (Int, Data, String)?.self) { group in
//                for (index, urlString) in urls.enumerated() {
//                    group.addTask {
//                        guard let url = URL(string: urlString),
//                              url.scheme?.hasPrefix("http") == true else {
//                            print("⚠️ Invalid URL:", urlString)
//                            return nil
//                        }
//                        do {
//                            print("🌐 Downloading:", url.absoluteString)
//                            let (data, response) = try await URLSession.shared.data(from: url)
//                            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//                                print("🚫 HTTP error for:", url.absoluteString)
//                                return nil
//                            }
//                            let ext = url.pathExtension.isEmpty ? "png" : url.pathExtension
//                            print("📥 Downloaded image \(index + 1)")
//                            return (index, data, ext)
//                        } catch {
//                            print("❌ Failed to download \(url.absoluteString): \(error.localizedDescription)")
//                            return nil
//                        }
//                    }
//                }
//                
//                var results: [(Int, Data, String)] = []
//                for await result in group {
//                    if let result { results.append(result) }
//                }
//                
//                // ✅ Sort by the original index before returning
//                return results.sorted { $0.0 < $1.0 }.map { ($0.1, $0.2) }
//            }
//        }
//        
//        // MARK: - Build data structure with progress updates
//        // MARK: - Parallel Download Using Sendable DTOs
//        // Define Sendable DTOs for parallel work
//        struct DLSign: Sendable {
//            let id: String
//            let index: Int
//            let title: String
//            let details: String
//            let wrongAnswers: [String]
//            let sectionName: String?
//            let subSectionName: String?
//            let imageData: [Data]
//            let imageTypes: [String]
//        }
//        struct DLSubSection: Sendable {
//            let id: String
//            let index: Int
//            let name: String
//            let details: String
//            let signs: [DLSign]
//        }
//        struct DLSection: Sendable {
//            let id: String
//            let index: Int
//            let name: String
//            let details: String
//            let subSections: [DLSubSection]
//            let signs: [DLSign]
//        }
//        
//        print("🔄 Processing \(countryData.sections.count) sections for \(countryData.country.rawValue)...")
//        
//        // Calculate total sign count (sections + subsections)
//        let totalSigns = countryData.sections.reduce(0) { total, section in
//            let subSigns = section.subSections?.reduce(0) { $0 + $1.signs.count } ?? 0
//            return total + section.signs.count + subSigns
//        }
//        var processedSigns = 0.0
//        var dlSections: [DLSection] = []
//        
//        await withTaskGroup(of: DLSection.self) { group in
//            for (sectionIndex, section) in countryData.sections.enumerated() {
//                group.addTask {
//                    print("📂 [\(sectionIndex + 1)/\(countryData.sections.count)] Section: \(section.name)")
//                    
//                    // Download images for signs in this section
//                    func downloadDLSign(for sign: TrafficSign) async -> DLSign {
//                        let downloaded = await downloadImageData(from: sign.images)
//                        let imageData = downloaded.map(\.0)
//                        let imageTypes = downloaded.map(\.1)
//                        
//                        // Progress update after each sign download
//                        await MainActor.run {
//                            processedSigns += 1
//                            self.progress = processedSigns / Double(totalSigns)
//                        }
//                        
//                        return DLSign(
//                            id: sign.id,
//                            index: sign.index,
//                            title: sign.title,
//                            details: sign.description,
//                            wrongAnswers: sign.wrongAnswers,
//                            sectionName: sign.sectionName,
//                            subSectionName: sign.subSectionName,
//                            imageData: imageData,
//                            imageTypes: imageTypes
//                        )
//                    }
//                    
//                    var subSectionDTOs: [DLSubSection] = []
//                    
//                    // ✅ FIXED: Download subsection signs properly
//                    if let subSections = section.subSections, !subSections.isEmpty {
//                        await withTaskGroup(of: DLSubSection.self) { subGroup in
//                            for sub in subSections {
//                                subGroup.addTask {
//                                    var subSigns: [DLSign] = []
//                                    
//                                    // Option 1: Unlimited concurrency (simpler, faster)
//                                    await withTaskGroup(of: DLSign.self) { signGroup in
//                                        for sign in sub.signs {
//                                            signGroup.addTask {
//                                                await downloadDLSign(for: sign)
//                                            }
//                                        }
//                                        // Collect all results
//                                        for await dlSign in signGroup {
//                                            subSigns.append(dlSign)
//                                        }
//                                    }
//                                    
//                                    /* Option 2: Limited concurrency (better for memory)
//                                     await withTaskGroup(of: DLSign.self) { signGroup in
//                                     var pendingSigns = sub.signs[...]
//                                     
//                                     // Start initial batch of 8
//                                     for _ in 0..<min(8, pendingSigns.count) {
//                                     let sign = pendingSigns.removeFirst()
//                                     signGroup.addTask {
//                                     await downloadDLSign(for: sign)
//                                     }
//                                     }
//                                     
//                                     // As tasks complete, start new ones
//                                     for await dlSign in signGroup {
//                                     subSigns.append(dlSign)
//                                     
//                                     if !pendingSigns.isEmpty {
//                                     let sign = pendingSigns.removeFirst()
//                                     signGroup.addTask {
//                                     await downloadDLSign(for: sign)
//                                     }
//                                     }
//                                     }
//                                     }
//                                     */
//                                    
//                                    return DLSubSection(
//                                        id: sub.id,
//                                        index: sub.index,
//                                        name: sub.name,
//                                        details: sub.description ?? "",
//                                        signs: subSigns
//                                    )
//                                }
//                            }
//                            for await sub in subGroup {
//                                subSectionDTOs.append(sub)
//                            }
//                        }
//                    }
//                    
//                    // ✅ FIXED: Download section signs properly
//                    var signDTOs: [DLSign] = []
//                    await withTaskGroup(of: DLSign.self) { signGroup in
//                        for sign in section.signs {
//                            signGroup.addTask {
//                                await downloadDLSign(for: sign)
//                            }
//                        }
//                        // Collect all results
//                        for await dlSign in signGroup {
//                            signDTOs.append(dlSign)
//                        }
//                    }
//                    
//                    return DLSection(
//                        id: section.id,
//                        index: section.index,
//                        name: section.name,
//                        details: section.description ?? "",
//                        subSections: subSectionDTOs,
//                        signs: signDTOs
//                    )
//                }
//            }
//            for await dlSection in group {
//                dlSections.append(dlSection)
//            }
//        }
//        
//        // MARK: - Convert DTOs to SwiftData entities and save on MainActor to avoid Sendable issues
//        try await MainActor.run {
//            var processedSignsLocal = processedSigns
//            var sectionEntities: [TrafficSectionEntity] = []
//            
//            for section in dlSections {
//                var signEntities: [TrafficSignEntity] = []
//                for sign in section.signs {
//                    let entity = TrafficSignEntity(
//                        id: sign.id,
//                        index: sign.index,
//                        title: sign.title,
//                        details: sign.details,
//                        wrongAnswers: sign.wrongAnswers,
//                        sectionName: sign.sectionName ?? "",
//                        subSectionName: sign.subSectionName,
//                        imageData: sign.imageData,
//                        imageTypes: sign.imageTypes
//                    )
//                    processedSignsLocal += 1
//                    self.progress = processedSignsLocal / Double(totalSigns)
//                    signEntities.append(entity)
//                }
//                
//                var subSectionEntities: [TrafficSubSectionEntity] = []
//                for sub in section.subSections {
//                    var subSignEntities: [TrafficSignEntity] = []
//                    for sign in sub.signs {
//                        let entity = TrafficSignEntity(
//                            id: sign.id,
//                            index: sign.index,
//                            title: sign.title,
//                            details: sign.details,
//                            wrongAnswers: sign.wrongAnswers,
//                            sectionName: sign.sectionName ?? "",
//                            subSectionName: sign.subSectionName,
//                            imageData: sign.imageData,
//                            imageTypes: sign.imageTypes
//                        )
//                        processedSignsLocal += 1
//                        self.progress = processedSignsLocal / Double(totalSigns)
//                        subSignEntities.append(entity)
//                    }
//                    subSectionEntities.append(
//                        TrafficSubSectionEntity(
//                            id: sub.id,
//                            index: sub.index,
//                            name: sub.name,
//                            details: sub.details,
//                            signs: subSignEntities
//                        )
//                    )
//                }
//                
//                sectionEntities.append(
//                    TrafficSectionEntity(
//                        id: section.id,
//                        index: section.index,
//                        name: section.name,
//                        details: section.details,
//                        subSections: subSectionEntities,
//                        signs: signEntities
//                    )
//                )
//            }
//            
//            let entity = CountryDataEntity(
//                id: countryData.id,
//                country: countryData.country.rawValue,
//                generalInformation: countryData.generalInformation,
//                drivingSide: countryData.drivingSide.rawValue,
//                alcoholLimit: countryData.alcoholLimit,
//                alcoholUnit: countryData.alcoholUnit.rawValue,
//                emergencyNumber: countryData.emergencyNumber,
//                commonRules: countryData.commonRules,
//                specialRegulations: countryData.specialRegulations,
//                lastUpdated: countryData.lastUpdated,
//                sections: sectionEntities
//            )
//            
//            context.insert(entity)
//            try context.save()
//            
//            print("💾 Finished saving \(countryData.country.rawValue)")
//            print("   Sections: \(sectionEntities.count)")
//            let totalSignsSaved = sectionEntities.flatMap { $0.signs }.count +
//            sectionEntities.flatMap { $0.subSections ?? [] }.flatMap { $0.signs }.count
//            print("   Total signs saved: \(totalSignsSaved)")
//            
//            // Ensure progress is complete
//            self.progress = 1.0
//            self.isDownloading = false
//            self.currentCountry = nil
//        }
//    }
//}
//
//// MARK: - Firestore ID helper
//extension Country {
//    var firestoreID: String {
//        rawValue.prefix(1).uppercased() + rawValue.dropFirst()
//    }
//}
