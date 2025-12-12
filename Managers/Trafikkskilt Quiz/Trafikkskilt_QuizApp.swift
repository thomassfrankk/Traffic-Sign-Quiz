//
//  Trafikkskilt_QuizApp.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftUI
import SwiftData
import GoogleMobileAds
import FirebaseCore

@main
struct Trafikkskilt_QuizApp: App {
    @StateObject private var purchaseManager = PurchaseManager()
    @StateObject private var orientationObserver = OrientationObserver()
    @StateObject private var router = NavigationRouter()
    
    // MARK: - Persistent SwiftData container
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            GameSettings.self,
            CountryScores.self,
            CountryDataEntity.self,
            TrafficSectionEntity.self,
            TrafficSubSectionEntity.self,
            TrafficSignEntity.self,
            SpeedLimits.self
        ])
        
        // ✅ Persistent on-disk storage
        let modelConfiguration = ModelConfiguration(
            "Main",
            schema: schema,
            isStoredInMemoryOnly: false
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("❌ Could not create ModelContainer: \(error)")
        }
    }()
    
    init() {
        MobileAds.shared.start()
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environmentObject(purchaseManager)
                    .environmentObject(orientationObserver)
                    .environmentObject(CountrySyncManager.shared)
                    .environment(\.screenHeight, UIScreen.currentHeight)
                    .environment(\.isPad, UIScreen.isPad)
                    .environment(\.isSmall, UIScreen.isSmall)
                    .environment(\.isLandscape, orientationObserver.isLandscape)
                    .environmentObject(router) // inject it into all child views
                    .onAppear {
                        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
                    }
                    .environment(\.colorScheme, .dark)
                // ✅ Assign SwiftData context to the shared sync manager
                    .task {
                        let context = sharedModelContainer.mainContext
                        CountrySyncManager.shared.setContext(context)
                    }
                    .background(Color("GameBackground").gradient)
        }
        .modelContainer(sharedModelContainer)
    }
}
