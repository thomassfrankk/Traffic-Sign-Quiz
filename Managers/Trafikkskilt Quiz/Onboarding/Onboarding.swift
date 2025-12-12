//  Onboarding.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 14/10/25.
//

import SwiftUI
import Lottie
import Combine
import SwiftData

// MARK: - Onboarding Manager
@MainActor
class OnboardingManager: ObservableObject {
    @Published var currentStep: OnboardingStep = .welcome
    @Published var selectedCountry: Country?
    @Published var downloadProgress: Double = 0
    @Published var isDownloading = false
    @Published var hasCompletedOnboarding = false
    @Published var notificationErrorCount: Int = 0  // New property
    
    enum OnboardingStep {
        case welcome
        case countrySelection
        case notificationPermission
        case downloadProgress
        case ready
    }
    
    private var progressCancellable: AnyCancellable?
    
    func selectCountry(_ country: Country) {
        selectedCountry = country
        startDownload()
        goToNextStep()
    }
    
    func requestNotifications() async -> Bool {
        do {
            let granted = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
            
            DispatchQueue.main.async {
                if granted {
                    self.completeOnboarding()
                } else {
                    self.notificationErrorCount += 1
                    if self.notificationErrorCount > 1 {
                        self.completeOnboarding()
                    }
                }
            }
            return granted
        } catch {
            DispatchQueue.main.async {
                self.notificationErrorCount += 1
                if self.notificationErrorCount > 1 {
                    self.completeOnboarding()
                }
            }
            return false
        }
    }
    
    func skipNotifications() {
        completeOnboarding()
    }
    
    func completeOnboarding() {
        hasCompletedOnboarding = true
        withAnimation {
            self.currentStep = .downloadProgress
        }
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
    }
    
     func startDownload() {
         print("ONBOARDING: starting to download signs")
        guard let country = selectedCountry else { return }
        isDownloading = true
        Task {
            await CountrySyncManager.shared.syncUserCountryIfNeeded(country)
            isDownloading = false
        }
    }
    
    func goToNextStep() {
        switch currentStep {
        case .welcome:
            currentStep = .countrySelection
        case .countrySelection:
            currentStep = .notificationPermission
        case .notificationPermission:
            currentStep = .downloadProgress
        case .downloadProgress:
            currentStep = .ready
        case .ready:
            break
        
        }
    }
}

struct OnboardingView: View {
    @StateObject private var manager = OnboardingManager()
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    @Query private var settings: [GameSettings]
    
    var body: some View {
        // Custom red dots
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        WelcomeView(manager: manager)
                            .containerRelativeFrame(.horizontal)
                            .id(OnboardingManager.OnboardingStep.welcome)
                        CountrySelectionView(manager: manager, settings: settings)
                            .containerRelativeFrame(.horizontal)
                            .id(OnboardingManager.OnboardingStep.countrySelection)
                        NotificationPermissionView(manager: manager, settings: settings)
                            .containerRelativeFrame(.horizontal)
                            .id(OnboardingManager.OnboardingStep.notificationPermission)
                        DownloadProgressView(manager: manager, settings: settings)
                            .containerRelativeFrame(.horizontal)
                            .id(OnboardingManager.OnboardingStep.downloadProgress)
                    }
                    .overlay(alignment: .bottom) {
                        VStack {
                            PagingIndicators()
                                .padding(.bottom, (isSmall || isPad) ? 84 : 72)
                            
                        }
                    }
                }
                .scrollDisabled(true)
                .scrollTargetBehavior(.paging)
                .scrollIndicators(.hidden)
                .onChange(of: manager.currentStep) {
                    withAnimation {
                        proxy.scrollTo(manager.currentStep, anchor: .center)
                    }
                }
            }
        }
        .background(Color("GameBackground").gradient)
    }
}

// MARK: - Welcome View
struct WelcomeView: View {
    @EnvironmentObject var syncManager: CountrySyncManager
    @ObservedObject var manager: OnboardingManager
    @Environment(\.modelContext) private var context
    @State private var isLoading = true
    
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    var logoNameForSystemLanguage: String {
        let language = Locale.current.language.languageCode?.identifier ?? "en"
        
        switch language {
        case "nb", "nn":   // Norwegian Bokmål or Nynorsk
            return "LogoNorwegian"
        case "es":   // Spanish
            return "LogoSpanish"
        default:     // Fallback to English
            return "LogoEnglish"
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if !isSmall {
                Spacer(minLength: 8)
            }
            
            VStack(spacing: isSmall ? 24 : 48) {
                Text("Welcome to")
                    .font(.custom("SairaStencilOne-Regular", size: isSmall ? 22 : 26))
                    .multilineTextAlignment(.center)
                    .tracking(1)
                    .opacity(0.7)
                    .padding(.top, isSmall ? 16 : 0)
                
                Image(logoNameForSystemLanguage)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 32)
                    .padding(.horizontal, isSmall ? 64 : isLandscape ? 128 : isPad ? 32 : 48)
            }
            .frame(maxWidth: 550)
            
            Spacer(minLength: 8)
            
            Image(systemName: "questionmark.circle")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .accent)
                .symbolEffect(.drawOn.byLayer, isActive: isLoading)
                .font(.system(size: isSmall ? 170 : isLandscape ? 200 : isPad ? 300 : 200).weight(.bold))
                .shadow(radius: 16)
            
            Spacer(minLength: 8)
            Spacer(minLength: 8)
            Spacer(minLength: 8)
            
            Button {
                withAnimation {
                    manager.goToNextStep()
                }
            } label: {
                if isLoading {
                    ProgressView()
                        .scaleEffect(0.75)
                        .frame(maxWidth: isPad ? 600 : .infinity)
                        .frame(height: 40)
                        .tint(.white)
                } else {
                    Text("Let's Get Started")
                        .font(.custom("SairaStencilOne-Regular", size: 22))
                        .tracking(1)
                        .frame(maxWidth: isPad ? 600 : .infinity)
                        .frame(height: 40)
                        .brightness(0.1)
                }
            }
            .tint(.accent)
            .foregroundStyle(.white)
            .buttonStyle(.glassProminent)
            .controlSize(.large)
            .disabled(isLoading)
            .padding(.bottom, (isSmall || isPad) ? 16 : 0)
        }
        .padding(.horizontal)
        .task {
            do {
                await GameSettings.ensureDefault(in: context)
                try await syncManager.fetchSupportedCountries()
                withAnimation {
                    isLoading = false
                }
            } catch {
                print("Error fetching countries:", error)
                withAnimation {
                    isLoading = false
                }
            }
        }
    }
}


// MARK: - Country Selection View
struct CountrySelectionView: View {
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    @ObservedObject var manager: OnboardingManager
    @State private var selectedCountry: Country?
    @State private var selectedLanguage: Language = .englishGB  // default
    
    @Environment(\.modelContext) private var context
    let settings: [GameSettings]
    
    @AppStorage("supportedCountriesData") private var supportedCountriesData: Data = Data()
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    private var countries: [Country] {
        do {
            let stored = try JSONDecoder().decode([String].self, from: supportedCountriesData)
            let mapped = stored.compactMap { Country(rawValue: $0) }
            return mapped.isEmpty ? Country.allCases : mapped
        } catch {
            print("⚠️ Failed to decode supported countries, using full list: \(error)")
            return Country.allCases
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(languageManager.localizedString(for: "Region"))
                .font(.custom("SairaStencilOne-Regular", size: 38))
                .multilineTextAlignment(.center)
                .padding(.top, (isSmall || isLandscape) ? 16 : 48)
            
            Spacer(minLength: 8)
            
            VStack(spacing: 32) {
                
                Image(systemName: "mappin.and.ellipse")
                    .font(.system(size: isSmall ? 55 : 70))
                    .frame(height: isSmall ? 60 : 100)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .accent)
                
                VStack(spacing: 32) {
                    VStack(spacing: 16) {
                        Text(languageManager.localizedString(for: "Select country"))
                            .font(.subheadline)
                            .tracking(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(0.7)
                        
                        Menu {
                            ForEach(countries, id: \.self) { country in
                                Button {
                                    selectedCountry = country
                                } label: {
                                    let localizedCountry = languageManager.localizedString(for: country.rawValue)
                                    Text("\(country.flag) \(localizedCountry)")
                                }
                            }
                        } label: {
                            HStack {
                                if let selectedCountry = selectedCountry {
                                    let localizedCountry = languageManager.localizedString(for: selectedCountry.rawValue)
                                    Text("\(selectedCountry.flag) \(localizedCountry)")
                                        .fontWeight(.medium)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 14).weight(.semibold))
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .frame(minHeight: isSmall ? 45 : 55)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(.white.opacity(0.15))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .tint(.white)
                    }
                    
                    VStack(spacing: 16) {
                        Text(languageManager.localizedString(for: "Select language"))
                            .font(.subheadline)
                            .tracking(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .opacity(0.7)
                        
                        if let selectedCountry = selectedCountry {
                            
                            // Build list same way you did in the Picker
                            let list = (
                                Language.allCases
                                    .filter { !$0.isLimitedSupport && $0 != .englishUS }
                                +
                                selectedCountry.supportedLanguages.filter { $0 != .englishUS }
                            )
                                .uniqued()
                                .sorted { $0.displayName < $1.displayName }
                            
                            Menu {
                                ForEach(list, id: \.self) { language in
                                    Button {
                                        selectedLanguage = language
                                    } label: {
                                        Text(languageManager.localizedString(for: language.displayName))
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(languageManager.localizedString(for: selectedLanguage.displayName))
                                        .fontWeight(.medium)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 14).weight(.semibold))
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(minHeight: isSmall ? 45 : 55)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.white.opacity(0.15))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            .tint(.white)
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, isSmall ? 32 : 48)
            .frame(maxHeight: isSmall ? 375 : 450, alignment: .top)
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, isPad ? 25 : 0)
            .frame(maxWidth: 650)
            
            Spacer()
            Spacer()
//            Spacer()
            
            // Continue button
            Button {
                if let country = selectedCountry {
                    // Save selected country to SwiftData
                    if let current = settings.first {
                        current.selectedCountry = country.rawValue
//                        current.userLanguage = selectedLanguage?.rawValue ?? "en"
                    } else {
                        let newSettings = GameSettings(selectedCountry: country.rawValue)
                        context.insert(newSettings)
                    }
                    try? context.save()
                    
                    // Continue onboarding flow
                    manager.selectCountry(country)
//                    manager.
                }
            } label: {
                Text(languageManager.localizedString(for: "Continue"))
                    .font(.custom("SairaStencilOne-Regular", size: 22))
                    .tracking(1)
                    .frame(maxWidth: isPad ? 600 : .infinity)
                    .frame(height: 40)
                    .brightness(0.1)
            }
            .tint(.accent)
            .foregroundStyle(.white)
            .buttonStyle(.glassProminent)
            .controlSize(.large)
            .disabled(selectedCountry == nil)
            .padding(.bottom, (isSmall || isPad) ? 16 : 0)
        }
        .padding(.horizontal)
        .onChange(of: selectedCountry, { oldValue, newValue in
            if let country = newValue {
                if !country.supports(selectedLanguage) {
                    selectedLanguage = country.supportedLanguages.first!
                }
            }
        })
        .onChange(of: selectedLanguage) { oldValue, newValue in
                // Save selected country to SwiftData
                if let current = settings.first {
                    current.userLanguage = newValue.rawValue
                } else {
                    let newSettings = GameSettings(userLanguage: newValue.rawValue)
                    context.insert(newSettings)
                }
                try? context.save()
        }
        .onChange(of: settings) { oldValue, newValue in
            loadStoredSettings()
        }
        .onAppear {
            loadStoredSettings()
        }
    }
    
    private func loadStoredSettings() {
        guard let current = settings.first else {
            print("No settings found")
            return
        }
        
        print("Saved country string: \(current.selectedCountry)")
        if let savedCountry = Country(rawValue: current.selectedCountry) {
            print("Matched Country enum: \(savedCountry)")
            selectedCountry = savedCountry
        } else {
            print("⚠️ Could not find Country enum for: \(current.selectedCountry)")
        }
        
        print("Saved language string: \(current.userLanguage)")
        if let savedLanguage = Language(rawValue: current.userLanguage) {
            print("Matched Language enum: \(savedLanguage)")
            
            // auto-correct englishUS -> englishGB
            selectedLanguage = savedLanguage == .englishUS ? .englishGB : savedLanguage
            
        } else {
            print("⚠️ Could not find Language enum for: \(current.userLanguage)")
        }
    }
}

// MARK: - Notification Permission View (already has buttons, but here's the updated version)
struct NotificationPermissionView: View {
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    @ObservedObject var manager: OnboardingManager
    
    @State var requestNotificationsError = false
    let settings: [GameSettings]
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text(languageManager.localizedString(for: "Stay Informed"))
                .font(.custom("SairaStencilOne-Regular", size: 38))
                .multilineTextAlignment(.center)
                .padding(.top, (isSmall || isLandscape) ? 16 : 48)
            
            Spacer()
            
            VStack(spacing: 64) {

                Image(systemName: "bell.and.waves.left.and.right.fill")
                    .font(.system(size: isSmall ? 55 : 70))
                    .frame(height: isSmall ? 60 : 100)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .accent)
                    .symbolEffect(.variableColor, options: .repeat(.continuous))
                
                VStack(spacing: isSmall ? 24 : 32) {
                    Text(languageManager.localizedString(for: requestNotificationsError ? "Notification Error" : "Enable Notifications"))
                        .font(isSmall ? .title3.weight(.semibold) : .title2.weight(.semibold))
                        .tracking(1)
                        .multilineTextAlignment(.center)
                        .id(requestNotificationsError)
                        .transition(.opacity)
                    
                    let description = requestNotificationsError
                    ? "We couldn’t activate notifications. Please try again."
                    : "Stay updated with new signs, feature releases, and important app notifications."
                    
                    Text(languageManager.localizedString(for: description))
                    .font(.callout)
                    .tracking(1)
                    .multilineTextAlignment(.center)
                    .id(requestNotificationsError)
                    .transition(.opacity)
                    .opacity(0.7)
                    
                }
                .frame(maxHeight: .infinity, alignment: .center)
                
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 48)
            .frame(maxHeight: isSmall ? 375 : 450, alignment: .top)
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, isPad ? 25 : 0)
            .frame(maxWidth: 650)
            
            Spacer()
            Spacer()
//            Spacer()
            
            // Buttons
            HStack(spacing: 16) {
                Button {
                    manager.skipNotifications()
                    settings.first?.notificationsEnabled = false
                } label: {
                    Text(languageManager.localizedString(for: "Skip"))
                        .font(.custom("SairaStencilOne-Regular", size: 22))
                        .tracking(1)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .brightness(0.1)
                }
                .tint(.blue.opacity(0.4))
                .foregroundStyle(.white)
                .buttonStyle(.glassProminent)
                .controlSize(.large)
                
                Button {
                    Task {
                        let granted = await manager.requestNotifications()
                        settings.first?.notificationsEnabled = granted
                        await MainActor.run {
                            requestNotificationsError = !granted
                        }
                    }
                } label: {
                    Text(languageManager.localizedString(for: "Enable"))
                        .font(.custom("SairaStencilOne-Regular", size: 22))
                        .tracking(1)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .brightness(0.1)
                }
                .tint(.accent)
                .foregroundStyle(.white)
                .buttonStyle(.glassProminent)
                .controlSize(.large)
            }
            .padding(.bottom, (isSmall || isPad) ? 16 : 0)
            .frame(maxWidth: isPad ? 600 : .infinity)
        }
        .padding(.horizontal)
    }
}

// MARK: - Download Progress View (auto-advances, but we can add skip)
struct DownloadProgressView: View {
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    @ObservedObject var manager: OnboardingManager
    @EnvironmentObject var syncManager: CountrySyncManager
    @Environment(\.dismiss) private var dismiss
    @State private var downloadCompleted: Bool = false
    @State private var showDownloadProgress: Bool = true
    let settings: [GameSettings]
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(languageManager.localizedString(for: showDownloadProgress ? syncManager.progress == 0.0
                 ? "Download Signs" : "Downloading Signs" : "Buckle Up"))
                .font(.custom("SairaStencilOne-Regular", size: 38))
                .multilineTextAlignment(.center)
                .padding(.top, (isSmall || isLandscape) ? 16 : 48)
                .id(showDownloadProgress)
                .transition(.scale.combined(with: .opacity))
            
            Spacer()
            
            VStack(spacing: isSmall ? 24 : 32) {
                let progress = CGFloat(syncManager.progress)
                
                Image(systemName: "car.circle", variableValue: progress)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .accent)
                    .symbolVariableValueMode(.draw)
                    .font(.system(size: isSmall ? 160 : 190).weight(.bold))
                    .animation(.default, value: progress)
                    .shadow(radius: 16)
                
                Text(languageManager.localizedString(for:
                    syncManager.progress == 0.0
                    ? "Fuel Required"
                    : showDownloadProgress
                    ? "Fueling Up!"
                    : "Car is Ready"
                ))
                .font(.title3.weight(.semibold))
                .multilineTextAlignment(.center)
                .tracking(1)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity)
                .id(syncManager.progress == 0.0 ? 0 : showDownloadProgress ? 1 : 2)
                .transition(.opacity)
                
                Text(languageManager.localizedString(for:
                    syncManager.progress == 0.0
                    ? "Download the traffic signs to get started"
                    : showDownloadProgress
                    ? "Downloading traffic signs and challenges."
                    : "Test your knowledge and master traffic rules."
                ))
                .font(.callout)
                .multilineTextAlignment(.center)
                .tracking(1)
                .id(syncManager.progress == 0.0 ? 0 : showDownloadProgress ? 1 : 2)
                .transition(.opacity)
                .opacity(0.7)
            }
            .padding(32)
//            .frame(maxWidth: .infinity)
            .frame(maxHeight: isSmall ? 375 : 450, alignment: .top)
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, isPad ? 25 : 0)
            .frame(maxWidth: 650)
            
            Spacer()
            Spacer()
            
            Button {
                if syncManager.progress == 0.0 {
                    if let current = settings.first,
                       let savedCountry = Country(rawValue: current.selectedCountry) {
                        manager.selectedCountry = savedCountry
                    }
                    manager.startDownload()
                } else {
                    manager.completeOnboarding()
                    manager.currentStep = .ready
                    dismiss()
                }
            } label: {
                Text(languageManager.localizedString(for: syncManager.progress == 0.0 ? "Start Download" : "Let's Go"))
                    .font(.custom("SairaStencilOne-Regular", size: 22))
                    .tracking(1)
                    .frame(maxWidth: isPad ? 600 : .infinity)
                    .frame(height: 40)
                    .brightness(0.1)
            }
            .tint(.accent)
            .foregroundStyle(.white)
            .buttonStyle(.glassProminent)
            .controlSize(.large)
            .disabled(syncManager.progress == 0.0 ? false : showDownloadProgress)
            .padding(.bottom, (isSmall || isPad) ? 16 : 0)
            .padding(.horizontal, isPad ? 25 : 0)
            .frame(maxWidth: 650)
        }
        .padding(.horizontal)
        .onChange(of: manager.isDownloading) { oldValue, newValue in
            if newValue == false {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    withAnimation {
                        showDownloadProgress = false
                    }
                }
            }
        }
    }
}


#Preview {
    OnboardingView()
}
