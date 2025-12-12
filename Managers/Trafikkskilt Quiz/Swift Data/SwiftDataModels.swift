//
//  SwiftDataModels.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 13/10/25.
//

import Foundation
import SwiftData

// MARK: - Language Content Structs (Codable for JSON encoding/decoding)

struct CountryLanguageContent: Codable {
    var generalInformation: String
    var drivingRules: [String]?
}

struct SectionLanguageContent: Codable {
    var name: String
    var details: String?
}

struct SubsectionLanguageContent: Codable {
    var name: String
    var details: String?
}

struct SignLanguageContent: Codable {
    var title: String
    var details: String
    var wrongAnswers: [String]
    var sectionName: String
    var subSectionName: String?
}

// MARK: - Country Data Entity

@Model
final class CountryDataEntity {
    @Attribute(.unique) var id: String
    var country: String // ISO code (e.g., "NO")
    var drivingSide: String // "right" / "left"
    var alcoholLimit: Double
    var alcoholUnit: String // "permille" or "percent"
    var emergencyNumber: String
    var currency: String // ISO code (e.g., "NOK")
    var speedUnit: String // "km/h" or "mph"
    var speedLimits: SpeedLimits
    var lastUpdated: Date
    
    // Store language as JSON-encoded string for SwiftData compatibility
    private var languageJSON: String = "{}"
    var language: [String: CountryLanguageContent] {
        get {
            guard let data = languageJSON.data(using: .utf8),
                  let decoded = try? JSONDecoder().decode([String: CountryLanguageContent].self, from: data) else {
                return [:]
            }
            return decoded
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue),
               let jsonString = String(data: encoded, encoding: .utf8) {
                languageJSON = jsonString
            }
        }
    }
    
    // Relationships
    @Relationship(deleteRule: .cascade, inverse: \TrafficSectionEntity.country) var sections: [TrafficSectionEntity]
    
    // Helper methods for easy access
    func generalInformation(for languageCode: String) -> String {
        return language[languageCode]?.generalInformation ?? language["en-GB"]?.generalInformation ?? language["en-US"]?.generalInformation ?? ""
    }
    
    func trafficRules(for languageCode: String) -> [String] {
        return language[languageCode]?.drivingRules ?? language["en-GB"]?.drivingRules ?? language["en-US"]?.drivingRules ?? []
    }
    
    func getTranslatableContent(from sourceLanguage: String) -> [(text: String, type: String, ruleIndex: Int?)] {
        var items: [(text: String, type: String, ruleIndex: Int?)] = []
        
        guard let countryLanguage = language[sourceLanguage] else { return items }
        
        // General information
        if !countryLanguage.generalInformation.isEmpty {
            items.append((text: countryLanguage.generalInformation, type: "country-general-info", ruleIndex: nil))
        }
        
        // Driving rules
        if let drivingRules = countryLanguage.drivingRules {
            for (index, rule) in drivingRules.enumerated() {
                if !rule.isEmpty {
                    items.append((text: rule, type: "country-driving-rule", ruleIndex: index))
                }
            }
        }
        
        return items
    }
    
    init(
        id: String,
        country: String,
        drivingSide: String,
        alcoholLimit: Double,
        alcoholUnit: String,
        emergencyNumber: String,
        currency: String,
        speedUnit: String,
        speedLimits: SpeedLimits,
        lastUpdated: Date,
        language: [String: CountryLanguageContent] = [:],
        sections: [TrafficSectionEntity] = []
    ) {
        self.id = id
        self.country = country
        self.drivingSide = drivingSide
        self.alcoholLimit = alcoholLimit
        self.alcoholUnit = alcoholUnit
        self.emergencyNumber = emergencyNumber
        self.currency = currency
        self.speedUnit = speedUnit
        self.speedLimits = speedLimits
        self.lastUpdated = lastUpdated
        self.sections = sections
        
        // Encode language to JSON string
        if let encoded = try? JSONEncoder().encode(language),
           let jsonString = String(data: encoded, encoding: .utf8) {
            self.languageJSON = jsonString
        }
    }
}

// MARK: - Traffic Section Entity

@Model
final class TrafficSectionEntity {
    
    @Attribute(.unique) var id: String
    var index: Int
    
    // Store language as JSON-encoded string for SwiftData compatibility
    private var languageJSON: String = "{}"
    var language: [String: SectionLanguageContent] {
        get {
            guard let data = languageJSON.data(using: .utf8),
                  let decoded = try? JSONDecoder().decode([String: SectionLanguageContent].self, from: data) else {
                return [:]
            }
            return decoded
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue),
               let jsonString = String(data: encoded, encoding: .utf8) {
                languageJSON = jsonString
            }
        }
    }
    
    @Relationship(deleteRule: .cascade, inverse: \TrafficSubSectionEntity.section) var subSections: [TrafficSubSectionEntity]?
    @Relationship(deleteRule: .cascade, inverse: \TrafficSignEntity.section) var signs: [TrafficSignEntity]
    
    var country: CountryDataEntity?
    
    enum CodingKeys: String, CodingKey {
        case id
        case index
        case languageJSON = "language"
        case subSections = "subsections"
        case signs
    }
    
    // Helper methods
    func name(for languageCode: String) -> String {
        print(languageCode)
        return language[languageCode]?.name ?? language["en-GB"]?.name ?? language["en-US"]?.name ?? "Unknown"
    }
    
    func details(for languageCode: String) -> String? {
        return language[languageCode]?.details ?? language["en-GB"]?.details ?? language["en-US"]?.details
    }
    
    func getTranslatableContent(from sourceLanguage: String, sectionIndex: Int) -> [(text: String, type: String, subsectionIndex: Int?, signIndex: Int?, wrongAnswerIndex: Int?)] {
        var items: [(text: String, type: String, subsectionIndex: Int?, signIndex: Int?, wrongAnswerIndex: Int?)] = []
        
        guard let sectionLanguage = language[sourceLanguage] else { return items }
        
        // Section name
        if !sectionLanguage.name.isEmpty {
            items.append((text: sectionLanguage.name, type: "section-name", subsectionIndex: nil, signIndex: nil, wrongAnswerIndex: nil))
        }
        
        // Section details
        if let details = sectionLanguage.details, !details.isEmpty {
            items.append((text: details, type: "section-details", subsectionIndex: nil, signIndex: nil, wrongAnswerIndex: nil))
        }
        
        return items
    }
    
    init(
        id: String,
        index: Int,
        language: [String: SectionLanguageContent] = [:],
        subSections: [TrafficSubSectionEntity]? = nil,
        signs: [TrafficSignEntity] = []
    ) {
        self.id = id
        self.index = index
        self.subSections = subSections
        self.signs = signs
        
        // Encode language to JSON string
        if let encoded = try? JSONEncoder().encode(language),
           let jsonString = String(data: encoded, encoding: .utf8) {
            self.languageJSON = jsonString
        }
    }
}

// MARK: - Traffic SubSection Entity

@Model
final class TrafficSubSectionEntity {
    @Attribute(.unique) var id: String
    var index: Int
    
    // Store language as JSON-encoded string for SwiftData compatibility
    private var languageJSON: String = "{}"
    var language: [String: SubsectionLanguageContent] {
        get {
            guard let data = languageJSON.data(using: .utf8),
                  let decoded = try? JSONDecoder().decode([String: SubsectionLanguageContent].self, from: data) else {
                return [:]
            }
            return decoded
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue),
               let jsonString = String(data: encoded, encoding: .utf8) {
                languageJSON = jsonString
            }
        }
    }
    
    @Relationship(deleteRule: .cascade, inverse: \TrafficSignEntity.subSection) var signs: [TrafficSignEntity]
    
    var section: TrafficSectionEntity?
    
    // Helper methods
    func name(for languageCode: String) -> String {
        return language[languageCode]?.name ?? language["en-GB"]?.name ?? language["en-US"]?.name ?? "Unknown"
    }
    
    func details(for languageCode: String) -> String? {
        return language[languageCode]?.details ?? language["en-GB"]?.details ?? language["en-US"]?.details
    }
    
    func getTranslatableContent(from sourceLanguage: String, sectionIndex: Int, subsectionIndex: Int) -> [(text: String, type: String, subsectionIndex: Int, signIndex: Int?, wrongAnswerIndex: Int?)] {
        var items: [(text: String, type: String, subsectionIndex: Int, signIndex: Int?, wrongAnswerIndex: Int?)] = []
        
        guard let subLanguage = language[sourceLanguage] else { return items }
        
        // Subsection name
        if !subLanguage.name.isEmpty {
            items.append((text: subLanguage.name, type: "subsection-name", subsectionIndex: subsectionIndex, signIndex: nil, wrongAnswerIndex: nil))
        }
        
        // Subsection details
        if let details = subLanguage.details, !details.isEmpty {
            items.append((text: details, type: "subsection-details", subsectionIndex: subsectionIndex, signIndex: nil, wrongAnswerIndex: nil))
        }
        
        return items
    }
    
    
    
    init(
        id: String,
        index: Int,
        language: [String: SubsectionLanguageContent] = [:],
        signs: [TrafficSignEntity] = []
    ) {
        self.id = id
        self.index = index
        self.signs = signs
        
        // Encode language to JSON string
        if let encoded = try? JSONEncoder().encode(language),
           let jsonString = String(data: encoded, encoding: .utf8) {
            self.languageJSON = jsonString
        }
    }
}

// MARK: - Traffic Sign Entity

@Model
final class TrafficSignEntity {
    @Attribute(.unique) var id: String // UUID for uniqueness
    var index: Int // Sortable numeric index
    var difficulty: Int // 0 = easy, 1 = medium, 2 = hard
    var imageData: [Data] // url from JSON images array (nullable)
    
    // Store language as JSON-encoded string for SwiftData compatibility
    private var languageJSON: String = "{}"
    var language: [String: SignLanguageContent] {
        get {
            guard let data = languageJSON.data(using: .utf8),
                  let decoded = try? JSONDecoder().decode([String: SignLanguageContent].self, from: data) else {
                return [:]
            }
            return decoded
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue),
               let jsonString = String(data: encoded, encoding: .utf8) {
                languageJSON = jsonString
            }
        }
    }
    
    var section: TrafficSectionEntity?
    var subSection: TrafficSubSectionEntity?
    
    // Helper methods
    func title(for languageCode: String) -> String {
        return language[languageCode]?.title ?? language["en-GB"]?.title ?? language["en-US"]?.title ?? "Unknown"
    }
    
    func description(for languageCode: String) -> String {
        return language[languageCode]?.details ?? language["en-GB"]?.details ?? language["en-US"]?.details ?? ""
    }
    
    func wrongAnswers(for languageCode: String) -> [String] {
        return language[languageCode]?.wrongAnswers ?? language["en-GB"]?.wrongAnswers ?? language["en-US"]?.wrongAnswers ?? []
    }
    
    func sectionName(for languageCode: String) -> String {
        return language[languageCode]?.sectionName ?? language["en-GB"]?.sectionName ?? language["en-US"]?.sectionName ?? ""
    }
    
    func subSectionName(for languageCode: String) -> String? {
        return language[languageCode]?.subSectionName ?? language["en-GB"]?.subSectionName ?? language["en-US"]?.subSectionName
    }
    
    func getTranslatableContent(from sourceLanguage: String, sectionIndex: Int, subsectionIndex: Int?, signIndex: Int) -> [(text: String, type: String, subsectionIndex: Int?, signIndex: Int, wrongAnswerIndex: Int?)] {
        var items: [(text: String, type: String, subsectionIndex: Int?, signIndex: Int, wrongAnswerIndex: Int?)] = []
        
        guard let signLanguage = language[sourceLanguage] else { return items }
        
        let typePrefix = subsectionIndex != nil ? "subsection-sign" : "section-sign"
        
        // Sign title
        if !signLanguage.title.isEmpty {
            items.append((text: signLanguage.title, type: "\(typePrefix)-title", subsectionIndex: subsectionIndex, signIndex: signIndex, wrongAnswerIndex: nil))
        }
        
        // Sign details
        if !signLanguage.details.isEmpty {
            items.append((text: signLanguage.details, type: "\(typePrefix)-details", subsectionIndex: subsectionIndex, signIndex: signIndex, wrongAnswerIndex: nil))
        }
        
        // Wrong answers
        for (wrongIndex, wrongAnswer) in signLanguage.wrongAnswers.enumerated() {
            if !wrongAnswer.isEmpty {
                items.append((text: wrongAnswer, type: "\(typePrefix)-wrong", subsectionIndex: subsectionIndex, signIndex: signIndex, wrongAnswerIndex: wrongIndex))
            }
        }
        
        return items
    }
    
    init(
        id: String,
        index: Int,
        difficulty: Int,
        imageData: [Data] = [],
        language: [String: SignLanguageContent] = [:]
    ) {
        self.id = id
        self.index = index
        self.difficulty = difficulty
        self.imageData = imageData
        
        // Encode language to JSON string
        if let encoded = try? JSONEncoder().encode(language),
           let jsonString = String(data: encoded, encoding: .utf8) {
            self.languageJSON = jsonString
        }
    }
}

// MARK: - Speed Limits Nested Structure
@Model
final class SpeedLimits {
    var urban: Int
    var rural: Int
    var motorway: Int
    
    init(urban: Int, rural: Int, motorway: Int) {
        self.urban = urban
        self.rural = rural
        self.motorway = motorway
    }
}
