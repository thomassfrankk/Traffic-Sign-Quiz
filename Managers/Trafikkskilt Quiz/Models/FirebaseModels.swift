//
//  FirebaseModels.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 13/11/25.
//

import Foundation

// MARK: - Language Content DTO Models (for Firestore decoding only)
// These are plain Codable structs used only for deserializing Firebase data
// They get converted to SwiftData models in the sync manager

struct CountryLanguageData: Codable {
    let generalInformation: String
    let drivingRules: [String]
}

struct SectionLanguageData: Codable {
    let name: String
    let details: String?
}

struct SubsectionLanguageData: Codable {
    let name: String
    let details: String?
}

struct SignLanguageData: Codable {
    let title: String
    let description: String
    let wrongAnswers: [String]
    let sectionName: String
    let subSectionName: String?
}

// MARK: - Image Data DTO

struct ImageData: Codable {
    let filename: String
    let url: String?
}

// MARK: - Traffic Sign DTO

struct TrafficSign: Codable, Identifiable {
    var id: String = UUID().uuidString
    var index: Int = 0
    var difficulty: Int = 0 // 0 = easy, 1 = medium, 2 = hard
    var language: [String: SignLanguageData] // ["en-GB": {...}, "nb-NO": {...}]
    var images: [ImageData] // Array of image objects
}

// MARK: - Traffic SubSection DTO

struct TrafficSubSection: Identifiable, Codable {
    var id: String = UUID().uuidString
    let index: Int
    let language: [String: SubsectionLanguageData] // ["en-GB": {...}, "nb-NO": {...}]
    let signs: [TrafficSign]
}

// MARK: - Traffic Section DTO

struct TrafficSection: Identifiable, Codable {
    var id: String = UUID().uuidString
    var index: Int = 0
    var language: [String: SectionLanguageData] // ["en-GB": {...}, "nb-NO": {...}]
    var subsections: [TrafficSubSection]?
    var signs: [TrafficSign]
}

// MARK: - Speed Limits DTO

struct SpeedLimitsData: Codable {
    let urban: Int
    let rural: Int
    let motorway: Int
}

// MARK: - Complete Country Data DTO

struct CountryData: Identifiable, Codable {
    var id: String { country.rawValue }
    
    // Country identification
    let country: Country
    
    // Driving information
    let drivingSide: DrivingSide
    let alcoholLimit: Double
    let alcoholUnit: AlcoholUnit
    let emergencyNumber: String
    let currency: String
    let speedUnit: String
    let speedLimits: SpeedLimitsData
    
    // Language content dictionary: ["en-GB": {...}, "nb-NO": {...}]
    let language: [String: CountryLanguageData]
    
    // Traffic signs
    let sections: [TrafficSection]
    
    // Metadata
    let lastUpdated: Date
    
    // Computed properties from Country enum
    var flag: String { country.flag }
    var localizedName: String { country.localizedName }
}
