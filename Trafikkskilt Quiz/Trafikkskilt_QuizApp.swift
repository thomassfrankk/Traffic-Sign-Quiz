//
//  Trafikkskilt_QuizApp.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftUI
import SwiftData
import GoogleMobileAds

@main
struct Trafikkskilt_QuizApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            GameSettings.self,
            CountryScores.self   // ← Did you forget this?
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        // ✅ Initialize Google Mobile Ads SDK once at app startup
        MobileAds.shared.start()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
