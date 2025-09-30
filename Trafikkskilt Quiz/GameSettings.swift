//
//  GameSettings.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftData

@Model
class GameSettings {
    // Preferences
    var selectedCountry: String
    var soundEnabled: Bool
    var hapticsEnabled: Bool
    var displayMode: Int   // 0 = system, 1 = light, 2 = dark
    var isAdFree: Bool     // true if user purchased ad-free
    
    // Metadata
    var appVersion: String
    
    // Scores per country
    @Relationship(inverse: \CountryScores.settings) var countries: [CountryScores]
    
    init(
        selectedCountry: String = "Norway",
        soundEnabled: Bool = true,
        hapticsEnabled: Bool = true,
        displayMode: Int = 0,
        isAdFree: Bool = false,
        appVersion: String = "1.0",
        countries: [CountryScores] = []
    ) {
        self.selectedCountry = selectedCountry
        self.soundEnabled = soundEnabled
        self.hapticsEnabled = hapticsEnabled
        self.displayMode = displayMode
        self.isAdFree = isAdFree
        self.appVersion = appVersion
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
}

@Model
class CountryScores {
    var country: String
    @Relationship var settings: GameSettings?
    var bestTimeAttackScores: [String: Int]   // e.g. ["1min": 12, "2min": 20, "3min": 35]
    var sectionHighScores: [String: Int]      // e.g. ["Vikeplikt": 15, "Forbudsskilt": 10]
    
    init(
        country: String,
        bestTimeAttackScores: [String: Int] = [:],
        sectionHighScores: [String: Int] = [:]
    ) {
        self.country = country
        self.bestTimeAttackScores = bestTimeAttackScores
        self.sectionHighScores = sectionHighScores
    }
    
    // Update helpers
    func updateTimeAttackScore(for minutes: Int, newScore: Int) {
        let key = "\(minutes)min"
        bestTimeAttackScores[key] = max(bestTimeAttackScores[key] ?? 0, newScore)
    }
    
    func updateSectionScore(for section: String, newScore: Int) {
        sectionHighScores[section] = max(sectionHighScores[section] ?? 0, newScore)
    }
    
    func bestScore(for minutes: Int) -> Int {
        bestTimeAttackScores["\(minutes)min"] ?? 0
    }
    
    func bestScore(for section: String) -> Int {
        sectionHighScores[section] ?? 0
    }
}

