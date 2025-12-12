//
//  GameSettings.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftData
import StoreKit

@Model
class GameSettings {
    
    var selectedCountry: String
    var userLanguage: String
    var soundEnabled: Bool
    var hapticsEnabled: Bool
    var displayMode: Int   // 0 = system, 1 = light, 2 = dark
    var notificationsEnabled: Bool
    
    // Scores per country
    @Relationship(inverse: \CountryScores.settings) var countries: [CountryScores]
    
    // Global (non-country-specific) high scores
    var globalHighScores: [String: Int] = [:] // e.g. ["Grand Recall": 42]
    
    init(
        selectedCountry: String = Country.usa.rawValue,
        userLanguage: String = "",
        soundEnabled: Bool = true,
        hapticsEnabled: Bool = true,
        displayMode: Int = 0,
        notificationsEnabled: Bool = true,
        countries: [CountryScores] = []
    ) {
        self.selectedCountry = selectedCountry
        self.userLanguage = userLanguage
        self.soundEnabled = soundEnabled
        self.hapticsEnabled = hapticsEnabled
        self.displayMode = displayMode
        self.notificationsEnabled = notificationsEnabled
        self.countries = countries
        for c in self.countries { c.settings = self }
    }
    
    // Find or create scores for a specific country
    func scores(for country: String) -> CountryScores {
        if let existing = countries.first(where: { $0.country == country }) {
            return existing
        }
        let new = CountryScores(country: country)
        new.settings = self
        countries.append(new)
        return new
    }
    
    // MARK: - Global scores (non-country-specific)
    func bestGlobalScore(for mode: QuizMode) -> Int {
        globalHighScores[mode.rawValue] ?? 0
    }
    
    func updateGlobalScore(for mode: QuizMode, newScore: Int) {
        globalHighScores[mode.rawValue] = max(globalHighScores[mode.rawValue] ?? 0, newScore)
    }
}

//@Model
//class CountryScores {
//    var country: String
//    @Relationship var settings: GameSettings?
//    
//    // New: Store high scores per QuizMode
//    var quizModeHighScores: [String: Int]    // e.g. ["Grand Tour": 25, "Grand Prix": 30, "Grand Recall": 18]
//    
//    // Section and subsection high scores
//    var sectionHighScores: [String: Int]     // e.g. ["Vikeplikt": 15, "Forbudsskilt": 10]
//    
//    // Store nested dictionary as JSON data
//    var subSectionHighScoresData: Data?      // Encoded storage
//    
//    // Computed property for in-memory access
//    var subSectionHighScores: [String: [String: Int]] {
//        get {
//            guard let data = subSectionHighScoresData else { return [:] }
//            return (try? JSONDecoder().decode([String: [String: Int]].self, from: data)) ?? [:]
//        }
//        set {
//            subSectionHighScoresData = try? JSONEncoder().encode(newValue)
//        }
//    }
//    
//    // MARK: - Init
//    
//    init(
//        country: String,
//        quizModeHighScores: [String: Int] = [:],
//        sectionHighScores: [String: Int] = [:],
//        subSectionHighScores: [String: [String: Int]] = [:]
//    ) {
//        self.country = country
//        self.quizModeHighScores = quizModeHighScores
//        self.sectionHighScores = sectionHighScores
//        self.subSectionHighScoresData = try? JSONEncoder().encode(subSectionHighScores)
//    }
//    
//    // MARK: - Update helpers
//    
//    func updateQuizModeScore(for mode: QuizMode, newScore: Int) {
//        let key = mode.rawValue
//        quizModeHighScores[key] = max(quizModeHighScores[key] ?? 0, newScore)
//    }
//    
//    func updateSectionScore(for section: String, newScore: Int) {
//        sectionHighScores[section] = max(sectionHighScores[section] ?? 0, newScore)
//    }
//    
//    func updateSubSectionScore(for section: String, subSection: String, newScore: Int) {
//        var subScores = subSectionHighScores[section] ?? [:]
//        subScores[subSection] = max(subScores[subSection] ?? 0, newScore)
//        subSectionHighScores[section] = subScores
//    }
//    
//    // MARK: - Retrieval
//    
//    func bestScore(for mode: QuizMode) -> Int {
//        quizModeHighScores[mode.rawValue] ?? 0
//    }
//    
//    func bestScore(for section: String) -> Int {
//        sectionHighScores[section] ?? 0
//    }
//    
//    func bestScore(for section: String, subSection: String) -> Int {
//        subSectionHighScores[section]?[subSection] ?? 0
//    }
//    
//    func allSubSectionScores(for section: String) -> [Int] {
//        Array(subSectionHighScores[section]?.values.map { $0 } ?? [])
//    }
//}

@Model
class CountryScores {
    var country: String
    @Relationship var settings: GameSettings?
    
    var isGrandTourCompleted: Bool = false
    var isGrandTourEliteCompleted: Bool = false
    
    // New: Store high scores per QuizMode
    var quizModeHighScores: [String: Int]
    
    var sectionHighScores: [String: Int]
    
    var subSectionHighScoresData: Data?
    
    var subSectionHighScores: [String: [String: Int]] {
        get {
            guard let data = subSectionHighScoresData else { return [:] }
            return (try? JSONDecoder().decode([String: [String: Int]].self, from: data)) ?? [:]
        }
        set {
            subSectionHighScoresData = try? JSONEncoder().encode(newValue)
        }
    }
    
    // MARK: - Init
    init(
        country: String,
        quizModeHighScores: [String: Int] = [:],
        sectionHighScores: [String: Int] = [:],
        subSectionHighScores: [String: [String: Int]] = [:],
        isGrandTourCompleted: Bool = false,
        isGrandTourEliteCompleted: Bool = false
    ) {
        self.country = country
        self.quizModeHighScores = quizModeHighScores
        self.sectionHighScores = sectionHighScores
        self.subSectionHighScoresData = try? JSONEncoder().encode(subSectionHighScores)
        self.isGrandTourCompleted = isGrandTourCompleted
        self.isGrandTourEliteCompleted = isGrandTourEliteCompleted
    }
    
    // MARK: - Update helpers
    func updateQuizModeScore(for mode: QuizMode, newScore: Int) {
        let key = mode.rawValue
        quizModeHighScores[key] = max(quizModeHighScores[key] ?? 0, newScore)
    }
    
    func updateSectionScore(for section: String, newScore: Int) {
        sectionHighScores[section] = max(sectionHighScores[section] ?? 0, newScore)
    }
    
    func updateSubSectionScore(for section: String, subSection: String, newScore: Int) {
        var subScores = subSectionHighScores[section] ?? [:]
        subScores[subSection] = max(subScores[subSection] ?? 0, newScore)
        subSectionHighScores[section] = subScores
    }
    
    // MARK: - Retrieval
    func bestScore(for mode: QuizMode) -> Int {
        quizModeHighScores[mode.rawValue] ?? 0
    }
    
    func bestScore(for section: String) -> Int {
        sectionHighScores[section] ?? 0
    }
    
    func bestScore(for section: String, subSection: String) -> Int {
        subSectionHighScores[section]?[subSection] ?? 0
    }
    
    func allSubSectionScores(for section: String) -> [Int] {
        Array(subSectionHighScores[section]?.values.map { $0 } ?? [])
    }

}

extension GameSettings {
    @MainActor
    static func ensureDefault(in context: ModelContext) async {
        let fetchDescriptor = FetchDescriptor<GameSettings>()
        if let existing = try? context.fetch(fetchDescriptor), existing.isEmpty {
            print("⚙️ No existing GameSettings found. Creating default...")
            
            var selectedCountry: String? = nil  // start unset
            
            // 1️⃣ Try Storefront first
            if let storefront = await Storefront.current {
                let code = storefront.countryCode
                if let country = Country.allCases.first(where: { $0.alpha3Code == code }) {
                    selectedCountry = country.rawValue
                    print("✅ Storefront match: \(country.rawValue)")
                } else {
                    print("⚠️ Storefront code \(code) did not match any Country")
                }
            }
            
            // 2️⃣ Fallback: only if Storefront did not set it
            if selectedCountry == nil {
                let code = Locale.current.region?.identifier ?? "US"
                if let country = Country.allCases.first(where: { $0.countryCode == code }) {
                    selectedCountry = country.rawValue
                    print("✅ Device locale match: \(country.rawValue)")
                } else {
                    // Final fallback
                    selectedCountry = Country.usa.rawValue
                    print("⚠️ No match found. Using default USA")
                }
            }
            
            let country = Country(rawValue: selectedCountry ?? Country.usa.rawValue)
            
            // Determine default language from preferred languages
            var selectedLanguage: String? = nil
            
            // Build the allowed languages list: fully supported + country's supported
            let allowedLanguages = (
                Language.allCases.filter { !$0.isLimitedSupport } +
                (country?.supportedLanguages ?? [])
            ).uniqued()  // remove duplicates
            
            // Pick the first preferred language that exists in allowedLanguages
            for preferred in Locale.preferredLanguages {
                let locale = Locale(identifier: preferred)
                let code = locale.language.languageCode?.identifier ?? ""
                let region = locale.region?.identifier ?? ""
                
                if code == "en" {
                    selectedLanguage = (region == "US") ? Language.englishUS.rawValue : Language.englishGB.rawValue
                    break
                }
                
                if let match = Language.allCases.first(where: { $0.languageCode == code }) {
                    selectedLanguage = match.rawValue
                    break
                }
            }
            
            // Fallback if completely unmatched
            if selectedLanguage == nil {
                selectedLanguage = Language.englishGB.rawValue
            }
            
            // Fallback if no preferred language matches
            if selectedLanguage == nil {
                    switch country {
                    case .usa:
                        selectedLanguage = Language.englishUS.rawValue
                    case .uk, .australia, .canada:
                        selectedLanguage = Language.englishGB.rawValue
                    case .france, .belgium:
                        selectedLanguage = Language.french.rawValue
                    case .germany:
                        selectedLanguage = Language.german.rawValue
                    case .spain:
                        selectedLanguage = Language.spanish.rawValue
                    default:
                        selectedLanguage = Language.englishGB.rawValue
                    }
                }
            
            // Insert GameSettings with both country and language
            let defaultSettings = GameSettings(
                selectedCountry: selectedCountry ?? Country.usa.rawValue,
                userLanguage: selectedLanguage ?? Language.englishUS.rawValue
            )
            context.insert(defaultSettings)
            try? context.save()
            print("✅ Saved GameSettings with country: \(selectedCountry ?? ""), language: \(selectedLanguage ?? "")")
        } else {
            print("⚙️ GameSettings already exists, skipping creation.")
        }
    }

}

