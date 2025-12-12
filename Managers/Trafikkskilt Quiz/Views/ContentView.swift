//
//  ContentView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftUI
import SwiftData
import Combine
import Translation

struct ContentView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    @EnvironmentObject var syncManager: CountrySyncManager
    @EnvironmentObject var router: NavigationRouter
    
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var showOnboarding: Bool = false
    
    @AppStorage("supportedCountries") private var supportedCountriesData: Data = Data()
    
    private var supportedCountries: [Country] {
        // Decode stored list of country codes from AppStorage
        (try? JSONDecoder().decode([String].self, from: supportedCountriesData))?
            .compactMap { Country(rawValue: $0) } ?? []
    }
    
    @Environment(\.modelContext) private var context
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    @State private var showingSettings = false
    @State private var showCountryInfo = false
    
    @Environment(\.modelContext) private var modelContext
    @State private var syncMessage: String? = nil
    
    @Namespace private var quizNamespace
    @Namespace private var settingsNamespace
    @Namespace private var countryInfoNamespace
    
    @State private var showSyncErrorAlert = false
    @State private var showlanguageNotSupportedAlert = false
    
    @State private var showTranslationAlert = false
    @State private var translationSession: TranslationSession? = nil
    
    @State private var notSupportedCountry: String? = nil
    @State private var syncErrorMessage = ""
    @State private var failedCountry: Country?
    
    @State private var displayCountry: String? = nil
    
    @State private var languageDownloaded: Bool = true
    @State private var languageDownloadedTapped: Bool = false
    
    @State private var isTranslating: Bool = false
    @State private var translationProgress: Double = 0.0
    
    @Query private var settings: [GameSettings]
    @Query private var countries: [CountryDataEntity]

    private let languageAvailability = LanguageAvailability()
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    // Enum-safe fallback
    private var country: Country {
        if let raw = settings.first?.selectedCountry,
           let parsed = Country(rawValue: raw) {
            return parsed
        }
        return .usa
    }
    
    private var countryEntity: CountryDataEntity? {
        guard let entity = countries.first(where: { $0.country == country.rawValue }) else { return nil }
        // Ensure sections are sorted by index
        entity.sections.sort { $0.index < $1.index }
        return entity
    }
    
    private var userLanguage: Language {
        Language.allCases.first { $0.rawValue == settings.first?.userLanguage ?? "" } ?? .englishGB
    }
    
    private var supportedLanguage: Language {
        // If the user's language is in the country's supportedLanguages, use it
        if country.supportedLanguages.contains(userLanguage) {
            return userLanguage
        }
        // Otherwise, fall back to the first supported language
        return country.supportedLanguages.first { $0.isFullySupported } ?? .englishGB
    }
    
    private var configuration: TranslationSession.Configuration {
        TranslationSession.Configuration(
            source: Locale.Language(identifier: supportedLanguage.rawValue),
            target: Locale.Language(identifier: userLanguage.rawValue)
        )
    }
    
    private func hasCompleteTranslation() -> Bool {
        guard let countryLanguage = countryEntity?.language[userLanguage.rawValue] else {
            print("❌ Language not found. Looking for: \(userLanguage.rawValue)")
            if let entity = countryEntity {
                print("📍 Available languages: \(Array(entity.language.keys))")
            }
            return false
        }
        
        print("✅ Found language: \(userLanguage.rawValue)")
        print("📍 generalInformation: \(countryLanguage.generalInformation)")
        
        return !countryLanguage.generalInformation.isEmpty
    }

    private func updateDisplayMessage() {
        if syncManager.isDownloading {
            let percentage = Int(syncManager.progress * 100)
            let updatingText = languageManager.localizedString(for: "Updating")
            syncMessage = "\(updatingText): \(percentage)%"
        } else {
            withAnimation {
                syncMessage = nil
            }
        }
    }
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack(spacing: 0) {
                Text(userLanguage != supportedLanguage ? displayCountry ?? "" : userLanguage.rawValue.hasPrefix("en") ? country.rawValue : country.localizedName)
                    .font(.custom("SairaStencilOne-Regular", size: isSmall ? 24 : 28))
                    .tracking(1)
                    .foregroundStyle(.white.opacity(0.7))
                    .padding(.bottom, (isSmall || isLandscape) ? 16 : 32)
                    .padding(.top, (isSmall || isLandscape) ? 0 : 16)
                    .frame(height: isSmall ? 80 : 100)
                    .translationTask(configuration) { session in
                        if userLanguage.rawValue.prefix(2) != supportedLanguage.rawValue.prefix(2), showingSettings == false, showOnboarding == false {
                            do {
                                print("has completed translation: \(hasCompleteTranslation())")
                                
                                if !hasCompleteTranslation() {
                                    await MainActor.run {
                                        self.translationSession = session
                                    }
//
                                    
                                }
                                
                                let result = try await session.translate(country.rawValue)
                                await MainActor.run {
                                    print("Country Translation: \(result.targetText)")
                                    withAnimation {
                                        displayCountry = result.targetText
                                    }
                                    languageDownloaded = true
                                }
                                
                            } catch {
                                print("Translation failed for \(country.rawValue): \(error)")
                            }
                        }
                        else if userLanguage.rawValue.hasPrefix("en") {
                            await MainActor.run {
                                withAnimation {
                                    displayCountry = country.rawValue
                                }
                            }
                        }
                    }
                    .id("\(country.rawValue), \(languageDownloadedTapped), \(showingSettings), \(showOnboarding)")
                    .transition(.opacity)
                    .animation(.default, value: country)
                
                Image(userLanguage.logoName)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 32 )
                    .padding(.horizontal, isSmall ? 48 : isLandscape ? 64 : 32)
                    .frame(maxWidth: 500)
                    .id(userLanguage.logoName)
                    .transition(.push(from: .trailing).combined(with: .opacity))
                
                Spacer()
                
                HStack(spacing: 0) {
                    Spacer()
                    Image(systemName: "car.rear.hazardsign")
                    Spacer()
                    Image(systemName: "figure.walk.diamond")
                    Spacer()
                    Image(systemName: "bicycle.circle")
                    Spacer()
                }
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .accent)
                .colorMultiply(Color(red: 1, green: 1, blue: 1))
                .font(.system(size: isSmall ? 54 : isLandscape ? 60 : isPad ? 100 : 60).weight(.semibold))
                .shadow(radius: 16)
                
                Spacer()
                Spacer()
                
                    VStack(spacing: isSmall ? 16 : 20) {
                        Button {
                            if languageDownloaded {
                                router.goToGameSelection(country: country)
                            } else {
                                languageDownloadedTapped.toggle()
                            }
                        } label: {
                            Text(languageDownloaded
                                 ? languageManager.localizedString(for: "Let's Play")
                                 : languageManager.localizedString(for: "Download Language"))
                            .primaryButtonLabel(isSmall: isSmall, isPad: isPad)
                        }
                        .primaryButtonContainer()
                        .disabled(syncManager.isDownloading || (isTranslating && languageDownloaded))
                        
                        Button {
                            router.goToTrainingZone(country: country)
                        } label: {
                            Text(languageManager.localizedString(for: "Training Zone"))
                                .secondaryButtonLabel(isSmall: isSmall, isPad: isPad)
                        }
                        .secondaryButtonContainer()
                        .disabled(syncManager.isDownloading || !languageDownloaded || isTranslating)
                    }
                    .padding(.bottom, (isSmall || isPad) ? 16 : 0)
            }
            .animation(.default, value: userLanguage.logoName)
            .animation(.default, value: userLanguage)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .subtitle) {
                    if let syncMessage = syncMessage {
                        Text(syncMessage)
                            .font(.subheadline.bold())
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .id(syncMessage)
                            .transition(.opacity)
                            .padding(.leading, isSmall ? 4 : 12)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        ForEach(supportedCountries, id: \.self) { countryOption in
                            Button {
                                if let setting = settings.first {
                                    if userLanguage.isLimitedSupport {
                                        showlanguageNotSupportedAlert = true
                                        notSupportedCountry = countryOption.rawValue
                                    } else {
                                        setting.selectedCountry = countryOption.rawValue
//                                        try? setting.modelContext?.save()
                                        Task {
                                            await isTranslationAvailable()
                                        }
                                    }
                                }
                            } label: {
                                Text("\(countryOption.flag) \(languageManager.localizedString(for: countryOption.rawValue))")
                            }
                            .disabled(syncManager.isDownloading || !languageDownloaded || isTranslating)
                        }
                    } label: {
                        Text(country.flag)
                            .font(.title)
                    }
                    .disabled(syncManager.isDownloading || !languageDownloaded || isTranslating)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showCountryInfo = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                    }
                    .disabled(syncManager.isDownloading || !languageDownloaded || isTranslating)
                }
            }
            .fullScreenCover(isPresented: $showingSettings) {
                if let gameSettings = settings.first {
                    NavigationStack {  CustomSettingsView(gameSettings: gameSettings) }
                }
            }
            .fullScreenCover(isPresented: $showCountryInfo) {
                NavigationStack {
                    if let selectedCountry = settings.first?.selectedCountry {
                        CountryInfoView(
                            country: Country(
                                rawValue: selectedCountry
                            ) ?? .usa,
                            languageManager: languageManager,
                            userLanguage: userLanguage
                        )
                            .toolbar {
                                ToolbarItem(placement: .topBarLeading) {
                                    Button {
                                        showCountryInfo = false
                                    } label: {
                                        Image(systemName: "xmark")
                                    }
                                    .accessibilityLabel("Close")
                                }
                            }
                    }
                }
            }
            .fullScreenCover(isPresented: $showOnboarding) {
//            .fullScreenCover(isPresented: .constant(true)) {
                OnboardingView()
            }
            .navigationDestination(for: QuizDestination.self) { destination in
                switch destination {
                case .selection(let country):
                    QuizModeSelectionView(country: country)
                case .quiz(let mode, let country, let sectionID, let subSectionID, let sectionTitle, let subsectionTitle, let initialLives):
                    QuizGameView(
                        quizMode: mode,
                        country: country,
                        selectedSectionID: sectionID,
                        selectedSubSectionID: subSectionID,
                        initialLives: initialLives
                    )
                case .quizComplete(let result):
                    QuizCompleteView(result: result)
                case .trainingZone(let country):
                    TrainingZoneView(country: country)
                case .learnSigns(section: let section, let title):
                    LearnSignsView(section: section, title: title, languageManager: languageManager)
                case .intro(let mode, let country, let sectionID, let subSectionID, let sectionTitle, let subsectionTitle):
                    QuizIntroScreen(
                        quizMode: mode,
                        country: country,
                        sectionID: sectionID,
                        subSectionID: subSectionID,
                        sectionTitle: sectionTitle,
                        subsectionTitle: subsectionTitle
                    )
                case .flipAndFlop(let country):
                    FlipAndFlopView(country: country)
                }
            }
            .background(Color("GameBackground").gradient)
        }
        .onChange(of: settings.first?.selectedCountry) { _, newCountry in
            if let newCountry, let updatedCountry = Country(rawValue: newCountry) {
                Task {
                    await updateUserCountry(country: updatedCountry)
                }
            }
        }
        .onChange(of: syncManager.isDownloading) {
            updateDisplayMessage()
        }
        .onChange(of: syncManager.progress) {
            updateDisplayMessage()
        }
        .onAppear {
            if !purchaseManager.adFreeUnlocked {
            AdManager.shared.loadNativeAd()
            }
            
            if hasCompletedOnboarding == false {
                showOnboarding = true
            }
            print("Supported countries: \(supportedCountries)")
        }
        .task {
            guard hasCompletedOnboarding else { return }
            do {
                try await syncManager.fetchSupportedCountries()
            } catch {
                print("Error fetching countries:", error)
            }
            await isTranslationAvailable()
        }
        .onChange(of: syncManager.contextSet) { _, contextSet in
            if contextSet == true, let countryRaw = settings.first?.selectedCountry,
               let country = Country(rawValue: countryRaw) {
                print("starting sync user country")
                Task {
                    await updateUserCountry(country: country)
                }
            } else {
                print("⚠️ Invalid or missing country, skipping sync.")
            }
        }
        .onChange(of: settings.first?.userLanguage) {
            print("⚠️ userLanguage changed")
            displayCountry = nil
            Task {
               await isTranslationAvailable()
            }
        }
        // NOT YET IMPLEMENTED. ADD TRANSLATIONS IF YOU DO ADD IT:
        
//        .alert("Sync Failed", isPresented: $showSyncErrorAlert) {
//            Button("Try Again") {
//                if let country = failedCountry {
//                    Task {
//                        await updateUserCountry(country: country)
//                    }
//                }
//            }
//            Button("Cancel", role: .cancel) {
//                failedCountry = nil
//            }
//        } message: {
//            Text(syncErrorMessage)
//        }
        .alert(languageManager.localizedString(for: "Language not supported"), isPresented: $showlanguageNotSupportedAlert) {
            
            Button(languageManager.localizedString(for: "Use English"), role: .confirm) {
                if let currentSettings = settings.first,
                   let notSupportedCountry = notSupportedCountry {
                    
                    // Pick correct English variant (GB default, US if system prefers it)
                    currentSettings.userLanguage = defaultEnglish().rawValue
                    currentSettings.selectedCountry = notSupportedCountry
                    
                    Task {
                        await isTranslationAvailable()
                    }
                }
            }
            Button(languageManager.localizedString(for: "Cancel"), role: .cancel) {
                showlanguageNotSupportedAlert = false
            }
        } message: {
            if let country = notSupportedCountry {
                let template = languageManager.localizedString(for: "language_not_supported_for_country")
                let localeLanguage = languageManager.localizedString(for: userLanguage.displayName)
                let loaleCountry = languageManager.localizedString(for: country)
                let message = String(format: template, localeLanguage, loaleCountry)
                Text(message)
            }
        }
        .onChange(of: translationSession != nil) { _, isNotNil in
            showTranslationAlert = isNotNil
        }
        .alert(languageManager.localizedString(for: "Translation required"), isPresented: $showTranslationAlert) {
            let supportedLanguage = country.supportedLanguages.first ?? Language.englishGB
            Button(languageManager.localizedString(for: "Translate"), role: .confirm) {
                if let translationSession = translationSession {
                    Task {
                        await translateCountryEntity(using: translationSession)
                        self.translationSession = nil
                    }
                }
            }
            Button(String(format: languageManager.localizedString(for: "use_country"), languageManager.localizedString(for: supportedLanguage.displayName)), role: .cancel) {
                if let currentSettings = settings.first{
                    currentSettings.userLanguage = supportedLanguage.rawValue
                }
                showTranslationAlert = false
                translationSession = nil
            }
        } message: {
            let template = languageManager.localizedString(for: "view_content_in_language")
            let language = languageManager.localizedString(for: userLanguage.displayName)
            let message = String(format: template, language)
            Text(message)
        }
//        .statusBarHidden()
    }
    
    func defaultEnglish(for systemLanguages: [String] = Locale.preferredLanguages) -> Language {
        // Find the first English language in the list
        if let firstEnglish = systemLanguages.first(where: { $0.starts(with: "en") }) {
            return firstEnglish == "en-US" ? .englishUS : .englishGB
        }
        
        // No English in system list → default to GB
        return .englishGB
    }
    
//    @State private var isUploading = false
//    @State private var uploadMessage = ""
//    
//    private func uploadData() {
//        isUploading = true
//        
//        Task {
//            do {
////                try await CountryDataService().uploadSpainWithImages()
//                try await CountryDataService().uploadUSAWithImages()
//                uploadMessage = "✅ Upload complete!"
//                isUploading = false
//            } catch {
//                uploadMessage = "❌ Error: \(error.localizedDescription)"
//                isUploading = false
//                print("Upload error: \(error)")
//            }
//        }
//    }
    
    private func updateUserCountry(country: Country) async {
        guard !syncManager.isDownloading, hasCompletedOnboarding else { return }
        let wasUpdated = await syncManager.syncUserCountryIfNeeded(country)
        if wasUpdated {
            withAnimation {
                syncMessage = languageManager.localizedString(for: "Update complete")
            }
            try? await Task.sleep(for: .seconds(3))
            
            withAnimation {
                syncMessage = nil
            }
        }
    }
    
    private func isTranslationAvailable() async {
        
        guard userLanguage.rawValue.prefix(2) != supportedLanguage.rawValue.prefix(2) else {
            await MainActor.run { languageDownloaded = true }
            print("userLanguage matches targetLang, no need to check translation status.")
            return
        }
        
        // Create a LanguageAvailability instance
        let availability = LanguageAvailability()
        
        // Check translation status from user language to target language
        let status = await availability.status(
            from: Locale.Language(identifier: userLanguage.rawValue),
            to: Locale.Language(identifier: supportedLanguage.rawValue)
        )
        
        switch status {
        case .installed:
            print("Translation downloaded for \(userLanguage.rawValue) -> \(supportedLanguage.rawValue)")
            await MainActor.run { languageDownloaded = true }
        case .supported:
            print("Translation supported but not downloaded for \(userLanguage.rawValue) -> \(supportedLanguage.rawValue)")
            await MainActor.run { languageDownloaded = false }
        case .unsupported:
            print("Translation unsupported for \(userLanguage.rawValue) -> \(supportedLanguage.rawValue).")
            await MainActor.run { languageDownloaded = false }
        @unknown default:
            print("Unknown translation status for \(userLanguage.rawValue) -> \(supportedLanguage.rawValue)")
            await MainActor.run { languageDownloaded = false }
        }
    }
    
    func translateCountryEntity(using session: TranslationSession) async {
        guard let entity = countryEntity else { return }
        
        Task { @MainActor in
            self.isTranslating = true
            var requests: [TranslationSession.Request] = []
            var pathMap: [String: (type: String, sectionIndex: Int?, ruleIndex: Int?, subsectionIndex: Int?, signIndex: Int?, wrongAnswerIndex: Int?)] = [:]
            var requestCounter = 0
            
            let sourceLanguageCode = supportedLanguage.rawValue
            let targetLanguageCode = userLanguage.rawValue
            
            print("🌐 Translating: \(sourceLanguageCode) → \(targetLanguageCode)")
            
            // MARK: - Build requests for country-level content
            let countryItems = entity.getTranslatableContent(from: sourceLanguageCode)
            for item in countryItems {
                let clientId = "req-\(requestCounter)"
                requests.append(.init(sourceText: item.text, clientIdentifier: clientId))
                pathMap[clientId] = (type: item.type, sectionIndex: nil, ruleIndex: item.ruleIndex, subsectionIndex: nil, signIndex: nil, wrongAnswerIndex: nil)
                requestCounter += 1
            }
            print("📍 Country items: \(countryItems.count)")
            
            // MARK: - Build requests for sections, subsections and their signs
            for section in entity.sections.sorted(by: { $0.index < $1.index }) {
                let sectionIndex = section.index
                
                let sectionItems = section.getTranslatableContent(from: sourceLanguageCode, sectionIndex: sectionIndex)
                for item in sectionItems {
                    let clientId = "req-\(requestCounter)"
                    requests.append(.init(sourceText: item.text, clientIdentifier: clientId))
                    pathMap[clientId] = (type: item.type, sectionIndex: sectionIndex, ruleIndex: nil, subsectionIndex: nil, signIndex: nil, wrongAnswerIndex: nil)
                    requestCounter += 1
                }
                print("📍 Section \(sectionIndex) items: \(sectionItems.count)")
                
                // Section-level signs
                for (signIndex, sign) in section.signs.enumerated() {
                    let signItems = sign.getTranslatableContent(from: sourceLanguageCode, sectionIndex: sectionIndex, subsectionIndex: nil, signIndex: signIndex)
                    for item in signItems {
                        let clientId = "req-\(requestCounter)"
                        requests.append(.init(sourceText: item.text, clientIdentifier: clientId))
                        pathMap[clientId] = (type: item.type, sectionIndex: sectionIndex, ruleIndex: nil, subsectionIndex: nil, signIndex: signIndex, wrongAnswerIndex: item.wrongAnswerIndex)
                        requestCounter += 1
                    }
                }
                
                // Subsections and their signs
                for subsection in (section.subSections ?? []).sorted(by: { $0.index < $1.index }) {
                    let subsectionIndex = subsection.index
                    
                    let subsectionItems = subsection.getTranslatableContent(from: sourceLanguageCode, sectionIndex: sectionIndex, subsectionIndex: subsectionIndex)
                    for item in subsectionItems {
                        let clientId = "req-\(requestCounter)"
                        requests.append(.init(sourceText: item.text, clientIdentifier: clientId))
                        pathMap[clientId] = (type: item.type, sectionIndex: sectionIndex, ruleIndex: nil, subsectionIndex: subsectionIndex, signIndex: nil, wrongAnswerIndex: nil)
                        requestCounter += 1
                    }
                    print("📍 Section \(sectionIndex) SubSection \(subsectionIndex) items: \(subsectionItems.count)")
                    
                    // Subsection-level signs
                    for (signIndex, sign) in subsection.signs.enumerated() {
                        let signItems = sign.getTranslatableContent(from: sourceLanguageCode, sectionIndex: sectionIndex, subsectionIndex: subsectionIndex, signIndex: signIndex)
                        for item in signItems {
                            let clientId = "req-\(requestCounter)"
                            requests.append(.init(sourceText: item.text, clientIdentifier: clientId))
                            pathMap[clientId] = (type: item.type, sectionIndex: sectionIndex, ruleIndex: nil, subsectionIndex: subsectionIndex, signIndex: signIndex, wrongAnswerIndex: item.wrongAnswerIndex)
                            requestCounter += 1
                        }
                    }
                }
            }
            
            guard !requests.isEmpty else {
                print("⚠️ No content to translate")
                return
            }
            
            let totalRequests = requests.count
            var processedRequests = 0
            
            print("📊 \(requests.count) items to translate")
            
            do {
                for try await response in session.translate(batch: requests) {
                    guard let clientId = response.clientIdentifier,
                          let path = pathMap[clientId] else { continue }
                    
                    let langCode = targetLanguageCode
                    
                    switch path.type {
                    case "country-general-info":
                        if entity.language[langCode] == nil {
                            entity.language[langCode] = CountryLanguageContent(generalInformation: response.targetText, drivingRules: nil)
                        } else {
                            entity.language[langCode]?.generalInformation = response.targetText
                        }
                        
                    case "country-driving-rule":
                        guard let ruleIndex = path.ruleIndex else { continue }
                        if entity.language[langCode] == nil {
                            entity.language[langCode] = CountryLanguageContent(generalInformation: "", drivingRules: [])
                        }
                        var drivingRules = entity.language[langCode]?.drivingRules ?? []
                        while drivingRules.count <= ruleIndex {
                            drivingRules.append("")
                        }
                        drivingRules[ruleIndex] = response.targetText
                        entity.language[langCode]?.drivingRules = drivingRules
                        
                    case "section-name":
                        guard let sectionIndex = path.sectionIndex else { continue }
                        if entity.sections.first(where: { $0.index == sectionIndex }) != nil {
                            if entity.sections.first(where: { $0.index == sectionIndex })?.language[langCode] == nil {
                                entity.sections.first(where: { $0.index == sectionIndex })?.language[langCode] = SectionLanguageContent(name: response.targetText, details: nil)
                            } else {
                                entity.sections.first(where: { $0.index == sectionIndex })?.language[langCode]?.name = response.targetText
                            }
                        }
                        
                    case "section-details":
                        guard let sectionIndex = path.sectionIndex else { continue }
                        if entity.sections.first(where: { $0.index == sectionIndex }) != nil {
                            if entity.sections.first(where: { $0.index == sectionIndex })?.language[langCode] == nil {
                                entity.sections.first(where: { $0.index == sectionIndex })?.language[langCode] = SectionLanguageContent(name: "", details: response.targetText)
                            } else {
                                entity.sections.first(where: { $0.index == sectionIndex })?.language[langCode]?.details = response.targetText
                            }
                        }
                        
                    case "subsection-name":
                        guard let sectionIndex = path.sectionIndex,
                              let subsectionIndex = path.subsectionIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              let subsection = section.subSections?.first(where: { $0.index == subsectionIndex }) else { continue }
                        if subsection.language[langCode] == nil {
                            subsection.language[langCode] = SubsectionLanguageContent(name: response.targetText, details: nil)
                        } else {
                            subsection.language[langCode]?.name = response.targetText
                        }
                        
                    case "subsection-details":
                        guard let sectionIndex = path.sectionIndex,
                              let subsectionIndex = path.subsectionIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              let subsection = section.subSections?.first(where: { $0.index == subsectionIndex }) else { continue }
                        if subsection.language[langCode] == nil {
                            subsection.language[langCode] = SubsectionLanguageContent(name: "", details: response.targetText)
                        } else {
                            subsection.language[langCode]?.details = response.targetText
                        }
                        
                    case "section-sign-title":
                        guard let sectionIndex = path.sectionIndex,
                              let signIndex = path.signIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              signIndex < section.signs.count else { continue }
                        if section.signs[signIndex].language[langCode] == nil {
                            section.signs[signIndex].language[langCode] = SignLanguageContent(title: response.targetText, details: "", wrongAnswers: [], sectionName: "", subSectionName: nil)
                        } else {
                            section.signs[signIndex].language[langCode]?.title = response.targetText
                        }
                        
                    case "section-sign-details":
                        guard let sectionIndex = path.sectionIndex,
                              let signIndex = path.signIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              signIndex < section.signs.count else { continue }
                        if section.signs[signIndex].language[langCode] == nil {
                            section.signs[signIndex].language[langCode] = SignLanguageContent(title: "", details: response.targetText, wrongAnswers: [], sectionName: "", subSectionName: nil)
                        } else {
                            section.signs[signIndex].language[langCode]?.details = response.targetText
                        }
                        
                    case "section-sign-wrong":
                        guard let sectionIndex = path.sectionIndex,
                              let signIndex = path.signIndex,
                              let wrongIndex = path.wrongAnswerIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              signIndex < section.signs.count else { continue }
                        if section.signs[signIndex].language[langCode] == nil {
                            var wrongAnswers = [String]()
                            while wrongAnswers.count <= wrongIndex {
                                wrongAnswers.append("")
                            }
                            wrongAnswers[wrongIndex] = response.targetText
                            section.signs[signIndex].language[langCode] = SignLanguageContent(title: "", details: "", wrongAnswers: wrongAnswers, sectionName: "", subSectionName: nil)
                        } else {
                            var wrongAnswers = section.signs[signIndex].language[langCode]?.wrongAnswers ?? []
                            while wrongAnswers.count <= wrongIndex {
                                wrongAnswers.append("")
                            }
                            wrongAnswers[wrongIndex] = response.targetText
                            section.signs[signIndex].language[langCode]?.wrongAnswers = wrongAnswers
                        }
                        
                    case "subsection-sign-title":
                        guard let sectionIndex = path.sectionIndex,
                              let subsectionIndex = path.subsectionIndex,
                              let signIndex = path.signIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              let subsection = section.subSections?.first(where: { $0.index == subsectionIndex }),
                              signIndex < subsection.signs.count else { continue }
                        if subsection.signs[signIndex].language[langCode] == nil {
                            subsection.signs[signIndex].language[langCode] = SignLanguageContent(title: response.targetText, details: "", wrongAnswers: [], sectionName: "", subSectionName: nil)
                        } else {
                            subsection.signs[signIndex].language[langCode]?.title = response.targetText
                        }
                        
                    case "subsection-sign-details":
                        guard let sectionIndex = path.sectionIndex,
                              let subsectionIndex = path.subsectionIndex,
                              let signIndex = path.signIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              let subsection = section.subSections?.first(where: { $0.index == subsectionIndex }),
                              signIndex < subsection.signs.count else { continue }
                        if subsection.signs[signIndex].language[langCode] == nil {
                            subsection.signs[signIndex].language[langCode] = SignLanguageContent(title: "", details: response.targetText, wrongAnswers: [], sectionName: "", subSectionName: nil)
                        } else {
                            subsection.signs[signIndex].language[langCode]?.details = response.targetText
                        }
                        
                    case "subsection-sign-wrong":
                        guard let sectionIndex = path.sectionIndex,
                              let subsectionIndex = path.subsectionIndex,
                              let signIndex = path.signIndex,
                              let wrongIndex = path.wrongAnswerIndex,
                              let section = entity.sections.first(where: { $0.index == sectionIndex }),
                              let subsection = section.subSections?.first(where: { $0.index == subsectionIndex }),
                              signIndex < subsection.signs.count else { continue }
                        if subsection.signs[signIndex].language[langCode] == nil {
                            var wrongAnswers = [String]()
                            while wrongAnswers.count <= wrongIndex {
                                wrongAnswers.append("")
                            }
                            wrongAnswers[wrongIndex] = response.targetText
                            subsection.signs[signIndex].language[langCode] = SignLanguageContent(title: "", details: "", wrongAnswers: wrongAnswers, sectionName: "", subSectionName: nil)
                        } else {
                            var wrongAnswers = subsection.signs[signIndex].language[langCode]?.wrongAnswers ?? []
                            while wrongAnswers.count <= wrongIndex {
                                wrongAnswers.append("")
                            }
                            wrongAnswers[wrongIndex] = response.targetText
                            subsection.signs[signIndex].language[langCode]?.wrongAnswers = wrongAnswers
                        }
                        
                    default:
                        break
                    }
                    
                    processedRequests += 1
                    self.translationProgress = Double(processedRequests) / Double(totalRequests)
                    let localeTranslating =  languageManager.localizedString(for: "Translating")
                    self.syncMessage = "\(localeTranslating): \(Int(self.translationProgress * 100))%"
                }
                
                print("✅ Translation complete!")
                print("📊 Processed: \(processedRequests)/\(totalRequests)")
                
                self.isTranslating = false
                
                entity.sections.sort { $0.index < $1.index }
                for section in entity.sections {
                    section.subSections?.sort { $0.index < $1.index }
                }
                
                do {
                    try modelContext.save()
                    print("✅ Saved to SwiftData")
                } catch {
                    print("❌ Save error:", error.localizedDescription)
                }
                
                withAnimation {
                    self.syncMessage = languageManager.localizedString(for: "Translation complete")
                }
                
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                withAnimation {
                    self.syncMessage = nil
                }
                
            } catch {
                print("❌ Translation error:", error.localizedDescription)
                let message = languageManager.localizedString(for: "Translation failed")
                withAnimation {
                    self.syncMessage = "\(message): \(error.localizedDescription)"
                }
            }
        }
    }
}


enum QuizMode: String, CaseIterable, Identifiable {
    case grandTour = "Grand Tour"
    case grandPrix = "Mixed Quiz"
    case beatTheClock = "Beat the Clock"
    case flipAndMatch = "Flip & Match"
    case sectionSigns = "Section Signs"
    
    var id: String { rawValue }
    
    var title: String {
        rawValue
    }
    
    var introHeading: String {
        switch self {
        case .grandTour:
            return "Up Next"
        case .grandPrix:
            return "Traffic Manual"
        case .beatTheClock:
            return "Traffic Manual"
        case .flipAndMatch:
            return "Traffic Manual"
        case .sectionSigns:
            return "Traffic Manual"
        }
    }
    
    var introManual: [String] {
        switch self {
        case .grandTour:
            return ["Up Next"]
        case .grandPrix:
            return ["Random Signs", "Decreasing Time Limit", "3 Lives"]
        case .beatTheClock:
            return ["Watch the Timer", "Keep Moving", "Earn or Lose Seconds"]
        case .flipAndMatch:
            return ["Flip the Cards", "Match the Pairs", "Test Your Memory"]
        case .sectionSigns:
            return ["All Signs", "Answer Every Questions", "Get Your Score"]
        }
    }
    
    var ruleDescription: [String] {
        switch self {
        case .grandTour:
            return [
                "Identify each sign as it appears and move on to the next.",
                "The goal is to progress through as many as you can without hesitation."
            ]
            
        case .grandPrix:
            return [
                "You will get signs in random order and you have three lives.",
                "A wrong answer removes one life and a correct answer keeps you in the race.",
                "The time allowed for each question becomes shorter the longer you survive."
            ]
            
        case .beatTheClock:
            return [
                "You start with 60 seconds and the timer never stops.",
                "Correct answers give you more time and mistakes take time away.",
                "Keep answering before the clock hits zero to stay alive."
            ]
            
        case .flipAndMatch:
            return [
                "Flip two cards to reveal the signs underneath.",
                "Find matching pairs using memory and pattern recognition.",
                "Fewer flips means a better score and cleaner victory."
            ]
            
        case .sectionSigns:
            return [
                "Go through every sign in the selected section one by one.",
                "Your final score reflects accuracy across the full set."
            ]
        }
    }
    
    var subtitle: String {
        switch self {
        case .grandTour:
            return ""
        case .grandPrix:
            return "3 Lives"
        case .beatTheClock:
            return "60 Seconds"
        case .flipAndMatch:
            return "5 Lives"
        case .sectionSigns:
            return "Master the Signs"
        }
    }
    
    func localizedTitle(languageManager: LanguageManager) -> String {
        switch self {
        case .grandTour:
            return languageManager.localizedString(for: "Grand Tour")
        case .grandPrix:
            return languageManager.localizedString(for: "Grand Prix")
        case .beatTheClock:
            return languageManager.localizedString(for: "Beat The Clock")
        case .flipAndMatch:
            return languageManager.localizedString(for: "Flip & Match")
        case .sectionSigns:
            return languageManager.localizedString(for: "Section Signs")
        }
    }
}


#Preview {
    ContentView()
}

//
//
//enum CarDirection {
//    case left, right
//}
//
//struct DashedDivider: View {
//    var segmentWidth: CGFloat = 14
//    var height: CGFloat = 3
//    var gap: CGFloat = 7
//    var color: Color = Color.white
//    
//    var body: some View {
//        GeometryReader { geo in
//            let total = geo.size.width
//            let unit = segmentWidth + gap
//            let count = max(1, Int((total + gap) / unit))
//            
//            HStack(spacing: gap) {
//                ForEach(0..<count, id: \.self) { _ in
//                    Rectangle()
//                        .fill(color)
//                        .frame(width: segmentWidth, height: height)
//                }
//            }
//            // center the row inside the full width
//            .frame(width: total, height: height, alignment: .center)
//            .position(x: total / 2, y: height / 2.5) // keep it vertically centered in the GeometryReader
//        }
//        .frame(height: height) // outer fixed height so it doesn't expand
//    }
//}
//
//struct TwoLaneRoadView: View {
//    var body: some View {
//        VStack(spacing: 0) { // adjust spacing for lane separation
//            // Top lane: cars going right
//            MovingCarsView(direction: .right)
//                .frame(height: 40)
//            // Dashed divider line
//            DashedDivider()
//            
//            // Bottom lane: cars going left
//            MovingCarsView(direction: .left)
//                .frame(height: 40)
//        }
//    }
//}
//
///// Immutable model representing a spawned car and its motion parameters.
//struct CarItem: Identifiable, Equatable {
//    let id: UUID
//    let startX: CGFloat
//    let endX: CGFloat
//    let duration: Double
//    let yOffset: CGFloat
//}
//
//struct MovingCarsView: View {
//    let direction: CarDirection
//    @State private var cars: [CarItem] = []
//    
//    var body: some View {
//        ZStack {
//            ForEach(cars) { car in
//                MovingCar(item: car, direction: direction)
//                    .transition(.opacity)
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .allowsHitTesting(false)
//        .onAppear(perform: startDispatchingCars)
//    }
//    
//    private func startDispatchingCars() {
//        Task {
//            // spawn the very first car instantly
//            spawnCar()
//            
//            while true {
//                // wait between spawns
//                try? await Task.sleep(for: .seconds(Double.random(in: 8...12)))
//                spawnCar()
//            }
//        }
//    }
//    
//    private func spawnCar() {
//        // determine screen width and offsets at spawn time
//        let screenWidth = UIScreen.main.bounds.width
//        let carVisualWidth: CGFloat = 60 // visual width to push fully offscreen; tune per size
//        let startX: CGFloat
//        let endX: CGFloat
//        
//        switch direction {
//        case .right:
//            startX = -carVisualWidth
//            endX = screenWidth + carVisualWidth
//        case .left:
//            startX = screenWidth + carVisualWidth
//            endX = -carVisualWidth
//        }
//        
//        // duration can be randomized slightly so cars don't move in perfect lockstep
//        let duration = Double.random(in: 36...46) // seconds to traverse full screen
//        
//        // optional slight vertical jitter (so cars don't perfectly overlap)
//        let laneYOffset: CGFloat = direction == .right ? -8 : 8
//        let jitter = CGFloat.random(in: -6...6)
//        let yOffset = laneYOffset + jitter
//        
//        let item = CarItem(id: UUID(), startX: startX, endX: endX, duration: duration, yOffset: yOffset)
//        
//        // add immediately (so the view is created with the correct startX)
//        withAnimation(.easeInOut(duration: 0.12)) {
//            cars.append(item)
//        }
//        
//        // schedule removal precisely after the duration (+ small buffer)
//        let buffer: Double = 0.5
//        DispatchQueue.main.asyncAfter(deadline: .now() + duration + buffer) {
//            withAnimation {
//                cars.removeAll { $0.id == item.id }
//            }
//        }
//    }
//}
//
//struct MovingCar: View {
//    let item: CarItem
//    let direction: CarDirection
//    
//    // internal offset state driven from the model's startX
//    @State private var xOffset: CGFloat = 0
//    
//    var body: some View {
//        Image(systemName: "car.top.radiowaves.front.fill")
//            .font(.system(size: 25))
//            .foregroundStyle(.white.opacity(0.85))
//            .symbolRenderingMode(.monochrome)
//            .symbolEffect(.variableColor, options: .repeat(.continuous))
//            .rotationEffect(.degrees(direction == .right ? 90 : -90))
//            .offset(x: xOffset, y: item.yOffset)
//            .onAppear {
//                // set initial offset synchronously so view never renders at 0
//                xOffset = item.startX
//                
//                // animate to end position using the duration supplied
//                withAnimation(.linear(duration: item.duration)) {
//                    xOffset = item.endX
//                }
//            }
//            .accessibilityHidden(true)
//    }
//}
//
