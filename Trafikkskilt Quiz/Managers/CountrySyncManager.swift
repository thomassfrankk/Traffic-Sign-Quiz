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
//            print("⚠️ supportedCountries field not found in Firestore.")
            return []
        }
        
//        print("🌍 Supported countries from Firestore:", list)
        
        let countries = list.compactMap { Country(rawValue: $0) }
        
        let encoded = try JSONEncoder().encode(list)
        UserDefaults.standard.set(encoded, forKey: "supportedCountries")
        supportedCountriesData = encoded
        
        return countries
    }
    
    @discardableResult
    func syncUserCountryIfNeeded(_ country: Country) async -> Bool {
        do {
//            print("🔍 Checking \(country.rawValue) for updates...")
//            print("   📍 Firestore ID: \(country.firestoreID)")
            
            guard let context else {
                print("❌ No ModelContext provided.")
                return false
            }
            
//            print("📡 Fetching remote lastUpdated date...")
            let remoteDate = try await fetchCountryLastUpdated(for: country)
//            print("✅ Remote lastUpdated: \(remoteDate)")
//            
//            print("🔎 Searching local database for \(country.rawValue)...")
            let local = try? context.fetch(
                FetchDescriptor<CountryDataEntity>(
                    predicate: #Predicate { $0.country == country.rawValue }
                )
            ).first
            
            if let local {
//                print("📦 Found local data for \(country.rawValue)")
//                print("   Local lastUpdated: \(local.lastUpdated)")
//                print("   Remote lastUpdated: \(remoteDate)")
                
                let calendar = Calendar.current
                if calendar.isDate(remoteDate, inSameDayAs: local.lastUpdated) {
//                    print("✅ \(country.rawValue) is already up to date — skipping sync.")
                    
                    await MainActor.run {
                        self.isDownloading = false
                        self.progress = 1.0
                        self.currentCountry = nil
                    }
                    
                    return false
                } else {
//                    print("⚠️ \(country.rawValue) data is outdated — removing old data before sync.")
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
//            print("🔄 Set UI state to downloading")
            
//            print("⬇️ Downloading \(country.rawValue) data from Firebase...")
            let remoteData = try await fetchCountryData(for: country)
//            print("✅ Successfully fetched remote data")
//            print("   Country: \(remoteData.country.rawValue)")
//            print("   Sections: \(remoteData.sections.count)")
            
//            print("💾 Syncing to SwiftData...")
            try await syncCountryToSwiftData(remoteData)
//            print("🎉 \(country.rawValue) synced successfully.")
            
            await MainActor.run {
                self.isDownloading = false
                self.progress = 1.0
                self.currentCountry = nil
            }
//            print("✅ Final UI state updated")
            
            return true
        } catch {
//            print("❌ Sync failed for \(country.rawValue)")
//            print("   Error: \(error)")
//            print("   LocalizedDescription: \(error.localizedDescription)")
            
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
//                print("🗑️ Deleting old SwiftData entry for \(country.rawValue)")
                context.delete(existing)
                try context.save()
            }
            let fileManager = FileManager.default
            let baseDir = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
            let countryDir = baseDir.appendingPathComponent("TrafficSigns/\(country.rawValue)", isDirectory: true)
            if fileManager.fileExists(atPath: countryDir.path) {
//                print("🗑️ Deleting cached images for \(country.rawValue)")
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
        
//        print("✅ Found country data: \(countryData.keys)")
        
        // Try to get as Timestamp first, then as String
        if let timestamp = countryData["lastUpdated"] as? Timestamp {
//            print("✅ Found Timestamp: \(timestamp)")
            return timestamp.dateValue()
        } else if let dateString = countryData["lastUpdated"] as? String {
//            print("✅ Found String: \(dateString)")
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
//            print("✅ Successfully decoded CountryData for \(country.rawValue)")
            return decoded
        } catch {
            print("❌ Decoding error for \(country.rawValue): \(error)")
            throw error
        }
    }
    
    private func syncCountryToSwiftData(_ countryData: CountryData) async throws {
        guard let context else { return }
        
        // Calculate total images to download
        let totalImages = countryData.sections.reduce(0) { sectionTotal, section in
            let sectionImages = section.signs.reduce(0) { $0 + $1.images.count }
            let subsectionImages = section.subsections?.reduce(0) { subTotal, subsection in
                subTotal + subsection.signs.reduce(0) { $0 + $1.images.count }
            } ?? 0
            return sectionTotal + sectionImages + subsectionImages
        }
        
        let totalSigns = countryData.sections.reduce(0) { total, section in
            let subSigns = section.subsections?.reduce(0) { $0 + $1.signs.count } ?? 0
            return total + section.signs.count + subSigns
        }
        
//        print("📊 Total images to download: \(totalImages)")
//        print("📊 Total signs to process: \(totalSigns)")
        
        // Simple progress tracking
        let downloadWeight = 0.7
        let processWeight = 0.3
        var downloadedCount = 0
        var processedCount = 0
        
        func updateProgress() async {
            let downloadProgress = totalImages > 0 ? (Double(downloadedCount) / Double(totalImages)) * downloadWeight : 0
            let processProgress = totalSigns > 0 ? (Double(processedCount) / Double(totalSigns)) * processWeight : 0
            let total = downloadProgress + processProgress
            
            await MainActor.run {
                self.progress = total
            }
        }
        
        // MARK: - Async image downloader (fully parallel)
        func downloadImageData(from urls: [String?]) async -> [Data] {
            guard !urls.isEmpty else { return [] }
            
            return await withTaskGroup(of: (index: Int, data: Data?).self) { group in
                // Launch ALL downloads in parallel immediately
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
                            let (data, response) = try await URLSession.shared.data(from: url)
                            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                                print("🚫 HTTP error for:", url.absoluteString)
                                return (index, nil)
                            }
                            return (index, data)
                        } catch {
                            print("❌ Failed to download \(url.absoluteString): \(error.localizedDescription)")
                            return (index, nil)
                        }
                    }
                }
                
                var indexedResults: [(index: Int, data: Data?)] = []
                var lastUpdateCount = 0
                
                // Collect results as they complete
                for await result in group {
                    indexedResults.append(result)
                    downloadedCount += 1
                    
                    // Update UI every 5 downloads (adjust this number for more/less frequent updates)
                    if downloadedCount - lastUpdateCount >= 5 || downloadedCount == urls.count {
                        await updateProgress()
                        lastUpdateCount = downloadedCount
                    }
                }
                
                // Sort by original index to maintain order
                return indexedResults
                    .sorted { $0.index < $1.index }
                    .compactMap { $0.data }
            }
        }
        
        // MARK: - Collect all image URLs
        func collectAllImageUrls(from section: TrafficSection) -> [String?] {
            var urls: [String?] = []
            urls.append(contentsOf: section.signs.flatMap { $0.images.map { $0.url } })
            
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
            
            // Download ALL images for this section in parallel
            let allImageUrls = collectAllImageUrls(from: section)
            let allDownloadedImages = await downloadImageData(from: allImageUrls)
            
            var imageIndex = 0
            
            // Convert section language dictionary
            var sectionLanguage: [String: SectionLanguageContent] = [:]
            for (langCode, langData) in section.language {
                sectionLanguage[langCode] = SectionLanguageContent(
                    name: langData.name,
                    details: langData.details
                )
            }
            
            // Process subsections
            var subSectionEntities: [TrafficSubSectionEntity] = []
            
            if let subSections = section.subsections, !subSections.isEmpty {
                for sub in subSections {
                    var subLanguage: [String: SubsectionLanguageContent] = [:]
                    for (langCode, langData) in sub.language {
                        subLanguage[langCode] = SubsectionLanguageContent(
                            name: langData.name,
                            details: langData.details
                        )
                    }
                    
                    var subSignEntities: [TrafficSignEntity] = []
                    for sign in sub.signs {
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
                        
                        let signImageCount = sign.images.count
                        let startIndex = imageIndex
                        let endIndex = min(imageIndex + signImageCount, allDownloadedImages.count)
                        let signImages = startIndex < endIndex ? Array(allDownloadedImages[startIndex..<endIndex]) : []
                        imageIndex = endIndex
                        
                        let signEntity = TrafficSignEntity(
                            id: UUID().uuidString,
                            index: sign.index,
                            difficulty: sign.difficulty,
                            imageData: signImages,
                            language: signLanguage
                        )
                        
                        processedCount += 1
                        await updateProgress()
                        
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
            
            // Process section signs
            var signEntities: [TrafficSignEntity] = []
            for sign in section.signs {
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
                
                let signImageCount = sign.images.count
                let endIndex = min(imageIndex + signImageCount, allDownloadedImages.count)
                let signImages = imageIndex < endIndex ? Array(allDownloadedImages[imageIndex..<endIndex]) : []
                imageIndex = endIndex
                
                let signEntity = TrafficSignEntity(
                    id: UUID().uuidString,
                    index: sign.index,
                    difficulty: sign.difficulty,
                    imageData: signImages,
                    language: signLanguage
                )
                
                processedCount += 1
                await updateProgress()
                
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
        
        // MARK: - Save to database
        try await MainActor.run {
            var countryLanguage: [String: CountryLanguageContent] = [:]
            for (langCode, langData) in countryData.language {
                countryLanguage[langCode] = CountryLanguageContent(
                    generalInformation: langData.generalInformation,
                    drivingRules: langData.drivingRules
                )
            }
            
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
            
            for section in entity.sections {
                section.country = entity
                
                for sign in section.signs {
                    sign.section = section
                    sign.subSection = nil
                }
                
                if let subSections = section.subSections {
                    for subSection in subSections {
                        subSection.section = section
                        
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
            
            self.progress = 1.0
            self.isDownloading = false
            self.currentCountry = nil
        }
    }
    
//    private func syncCountryToSwiftData(_ countryData: CountryData) async throws {
//        guard let context else { return }
//        
////        print("🔄 Processing \(countryData.sections.count) sections for \(countryData.country.rawValue)...")
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
////                            print("📥 Downloaded image")
//                            return (index, data)
//                        } catch {
//                            print("❌ Failed to download \(url.absoluteString): \(error.localizedDescription)")
//                            return (index, nil)
//                        }
//                    }
//                }
//                
//                var indexedResults: [(index: Int, data: Data?)] = []
//                for await result in group {
//                    indexedResults.append(result)
//                }
//                
//                return indexedResults
//                    .sorted { $0.index < $1.index }
//                    .compactMap { $0.data }
//            }
//        }
//        
//        // MARK: - Collect all image URLs for entire section (batch download)
//        func collectAllImageUrls(from section: TrafficSection) -> [String?] {
//            var urls: [String?] = []
//            
//            // Collect from section signs
//            urls.append(contentsOf: section.signs.flatMap { $0.images.map { $0.url } })
//            
//            // Collect from subsection signs
//            if let subSections = section.subsections {
//                for subSection in subSections {
//                    urls.append(contentsOf: subSection.signs.flatMap { $0.images.map { $0.url } })
//                }
//            }
//            
//            return urls
//        }
//        
//        // MARK: - Download all images and build entities
//        var sectionEntities: [TrafficSectionEntity] = []
//        
//        for section in countryData.sections {
//            print("⬇️ Batch downloading all images for section \(section.index)...")
//            
//            // MARK: - Download ALL images for this section upfront
//            let allImageUrls = collectAllImageUrls(from: section)
//            let allDownloadedImages = await downloadImageData(from: allImageUrls)
//            var imageIndex = 0
//            
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
//                        // Get images for this sign from pre-downloaded batch
//                        let signImageCount = sign.images.count
//                        let startIndex = imageIndex
//                        let endIndex = min(imageIndex + signImageCount, allDownloadedImages.count)
//                        let signImages = startIndex < endIndex ? Array(allDownloadedImages[startIndex..<endIndex]) : []
//                        imageIndex = endIndex
//                        
//                        print("📥 Sign \(sign.index): expected \(signImageCount) images, got \(signImages.count)")
//                        
//                        let signEntity = TrafficSignEntity(
//                            id: UUID().uuidString,
//                            index: sign.index,
//                            difficulty: sign.difficulty,
//                            imageData: signImages,
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
//                // Get images for this sign from pre-downloaded batch
//                let signImageCount = sign.images.count
//                let signImages = Array(allDownloadedImages[imageIndex..<min(imageIndex + signImageCount, allDownloadedImages.count)])
//                imageIndex += signImageCount
//                
//                let signEntity = TrafficSignEntity(
//                    id: UUID().uuidString,
//                    index: sign.index,
//                    difficulty: sign.difficulty,
//                    imageData: signImages,
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
