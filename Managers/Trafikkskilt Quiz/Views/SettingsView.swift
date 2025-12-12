//
//  SettingsView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftUI
import SwiftData
import StoreKit
import Translation

struct CustomSettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    @Environment(\.scenePhase) private var scenePhase
    
    @Bindable var gameSettings: GameSettings
    private var country: String { gameSettings.selectedCountry }
    
    @State private var accentColor: Color = .accent
    
    @State private var policyText: String = ""
    
    @State private var notificationStatus: UNAuthorizationStatus = .notDetermined
    @State private var buttonLabel: String = "Allow"

    @AppStorage("systemNotificationsAllowed") private var systemNotificationsAllowed: Bool = false
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: gameSettings)
    }
    
    private var userCountry: Country {
        Country(rawValue: country) ?? .usa
    }
    
    func printAllSupportedLanguages() async {
        let availability = LanguageAvailability()
        let languages = await availability.supportedLanguages
        
        print("Found \(languages.count) supported languages:")
        for (index, language) in languages.enumerated() {
            // language.languageCode?.identifier gives the base code (e.g. "en")
            let code = language.languageCode?.identifier ?? language.maximalIdentifier
            // localized name in current locale (fall back to identifier)
            let name = Locale.current.localizedString(forLanguageCode: code) ?? code
            print("\(index + 1). \(name) — \(language.maximalIdentifier)")
        }
    }
    
    private var appVersionString: String {
        let info = Bundle.main.infoDictionary
        let version = info?["CFBundleShortVersionString"] as? String ?? "—"
        return languageManager.localizedString(for: "App Version:") + " \(version)"
    }
    
    private func checkNotificationAuthorization() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                let allowed = settings.authorizationStatus == .authorized
                || settings.authorizationStatus == .provisional
                || settings.authorizationStatus == .ephemeral
                
                // If system permission changed, update AppStorage
                if allowed != systemNotificationsAllowed {
                    systemNotificationsAllowed = allowed
                    
                    // If system now allows notifications, enable game settings
                    if allowed {
                        gameSettings.notificationsEnabled = true
                    }
                }
                
                // Update view state
                withAnimation {
                    notificationStatus = settings.authorizationStatus
                    buttonLabel = buttonLabelKey(for: settings.authorizationStatus)
                }
            }
        }
    }
    
    private func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Request notifications
    private func requestNotifications() {
        Task {
            do {
                let granted = try await UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .badge, .sound])
                
                // Fetch current settings
                let settings = await UNUserNotificationCenter.current().notificationSettings()
                
                // Update state on main thread
                await MainActor.run {
                    withAnimation {
                        notificationStatus = settings.authorizationStatus
                        buttonLabel = buttonLabelKey(for: settings.authorizationStatus)
                        
                        // If authorization granted, enable notifications in settings
                        if granted {
                            gameSettings.notificationsEnabled = true
                        }
                    }
                }
            } catch {
                // On error, fetch current settings to update status
                let settings = await UNUserNotificationCenter.current().notificationSettings()
                await MainActor.run {
                    withAnimation {
                        notificationStatus = settings.authorizationStatus
                        buttonLabel = buttonLabelKey(for: settings.authorizationStatus)
                    }
                }
            }
        }
    }
    
    private func buttonLabelKey(for status: UNAuthorizationStatus) -> String {
        switch status {
        case .notDetermined:
            return "Allow"
        case .denied:
            return "Enable"
        case .authorized, .provisional, .ephemeral:
            return "Enable"
        default:
            return "Enable"
        }
    }
    
    
    // MARK: - Notification Permission Flow
    private func handleNotificationPermissionFlow() async {
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        switch settings.authorizationStatus {
        case .notDetermined:
            requestNotifications()
        case .denied:
            openAppSettings()
        default:
            break
        }
        checkNotificationAuthorization()
    }
    
    func defaultEnglish(for systemLanguages: [String] = Locale.preferredLanguages) -> Language {
        // Find the first English language in the list
        if let firstEnglish = systemLanguages.first(where: { $0.starts(with: "en") }) {
            return firstEnglish == "en-US" ? .englishUS : .englishGB
        }
        
        // No English in system list → default to GB
        return .englishGB
    }
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32) {
                VStack(alignment: .center, spacing: 16) {
                    Text(languageManager.localizedString(for: "Select Language"))
                        .font(.custom("SairaStencilOne-Regular", size: 18))
                        .tracking(1)
                        .frame(maxWidth: 600, alignment: .leading)
                    Menu {
                        let list = (
                            Language.allCases
                                .filter { !$0.isLimitedSupport && $0 != .englishUS }
                            +
                            userCountry.supportedLanguages.filter { $0 != .englishUS }
                        )
                            .uniqued()
                            .sorted { languageManager.localizedString(for: $0.displayName) < languageManager.localizedString(for: $1.displayName) }

                        
                        ForEach(list, id: \.self) { language in
                            Button {
                                if language == .englishGB {
                                    gameSettings.userLanguage = defaultEnglish().rawValue
                                } else {
                                    gameSettings.userLanguage = language.rawValue
                                }
                            } label: {
                                Text(languageManager.localizedString(for: language.displayName))
                            }
                        }
                    } label: {
                        HStack {
                            if let userLanguage = Language(rawValue: gameSettings.userLanguage)?.displayName  {
                                Text(languageManager.localizedString(for: userLanguage))
                                    .tracking(1)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 14).weight(.semibold))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .frame(maxWidth: 600, alignment: .leading)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 15))
                    }
                }
                
                // MARK: - Notifications Section
                VStack(alignment: .center, spacing: 16) {
                    Text(languageManager.localizedString(for: "Notifications"))
                        .font(.custom("SairaStencilOne-Regular", size: 18))
                        .tracking(1)
                        .frame(maxWidth: 600, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        // Show the toggle only if notifications are enabled at the system level
                        if notificationStatus == .authorized || notificationStatus == .provisional || notificationStatus == .ephemeral {
                            Toggle(
                                languageManager.localizedString(for: "Enable Notifications"),
                                isOn: Binding(
                                    get: { gameSettings.notificationsEnabled },
                                    set: { newValue in
                                        gameSettings.notificationsEnabled = newValue
                                    }
                                )
                            )
                            .tint(.red)
                        } else {
                            HStack(spacing: 0) {
                                Text(languageManager.localizedString(for: "Enable Notifications"))
                                
                                Spacer(minLength: 16)
                                
                                Button {
                                    Task { await handleNotificationPermissionFlow() }
                                } label: {
                                    Text(languageManager.localizedString(for: buttonLabel))
                                    .bold()
                                    .tracking(0)
                                }
                                .id(notificationStatus)
                                .transition(.scale.combined(with: .opacity))
                                .buttonStyle(.bordered)
                                .controlSize(.regular)
                                .tint(.white)
                            }
                        }
                    }
                    .toggleStyle(.switch)
                    .tracking(1)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: 600, alignment: .leading)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 15))
                    .task {
                        await printAllSupportedLanguages()
                    }
                    .onAppear {
                        checkNotificationAuthorization()
                        
                    }
                    .onChange(of: scenePhase) { _, newPhase in
                        if newPhase == .active {
                            checkNotificationAuthorization()
                        }
                    }
                    
                }
                
                // MARK: - Game Effects Section
                VStack(alignment: .center, spacing: 16) {
                    Text(languageManager.localizedString(for: "Game Effects"))
                        .font(.custom("SairaStencilOne-Regular", size: 18))
                        .foregroundColor(.white)
                        .tracking(1)
                        .frame(maxWidth: 600, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Toggle(languageManager.localizedString(for: "Sound Effects"), isOn: Binding(
                            get: { gameSettings.soundEnabled },
                            set: { gameSettings.soundEnabled = $0 }
                        ))
                        .tint(.red)
                        
                        Toggle(languageManager.localizedString(for: "Haptics"), isOn: Binding(
                            get: { gameSettings.hapticsEnabled },
                            set: { gameSettings.hapticsEnabled = $0 }
                        ))
                        .tint(.red)
                    }
                    .toggleStyle(.switch)
                    .tracking(1)
                    .padding()
                    .frame(maxWidth: 600, alignment: .leading)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 15))
                }
                
                // MARK: - Privacy0
                VStack(alignment: .center, spacing: 16) {
                    Text(languageManager.localizedString(for: "Privacy Policy"))
                        .font(.custom("SairaStencilOne-Regular", size: 18))
                        .foregroundColor(.white)
                        .tracking(1)
                        .frame(maxWidth: 600, alignment: .leading)
                    
                    NavigationLink {
                        PrivacyPolicyView(policyText: policyText, isPad: isPad)
                    } label: {
                        Text(languageManager.localizedString(for: "Read the policy"))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .tracking(1)
                            .padding()
                            .frame(maxWidth: 600, alignment: .leading)
                            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 15))
                    }
                }
                
                PremiumSectionView(languageManager: languageManager)
                
                
                // MARK: - Footer
                Text(appVersionString)
                    .font(.footnote)
                    .opacity(0.7)
                    .tracking(1)
                    .padding(.vertical)
            }
            .task {
                await loadPolicy()
            }
            .padding(.horizontal)
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .title) {
                    Text(languageManager.localizedString(for: "Settings"))
                        .titleTextStyle(isSmall: isSmall, isPad: isPad)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Color("GameBackground").gradient)
    }
    
    @MainActor
    private func loadPolicy() async {
        guard let url = URL(string: "https://raw.githubusercontent.com/thomassfrankk/Traffic-Sign-Quiz/main/PRIVACY.md?raw=true") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let contents = String(data: data, encoding: .utf8) {
                policyText = contents
            } else {
                policyText = "Privacy Policy unavailable."
            }
        } catch {
            policyText = "Privacy Policy unavailable."
        }
    }
}



struct PremiumSectionView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    let languageManager: LanguageManager
    
    var body: some View {
        //        Section(languageManager.localizedString(for: "Premium"))) {
        VStack(alignment: .center, spacing: 16) {
            Text(languageManager.localizedString(for: "Premium"))
                .font(.custom("SairaStencilOne-Regular", size: 18))
                .foregroundColor(.white)
                .tracking(1)
                .frame(maxWidth: 600, alignment: .leading)
            
            VStack(spacing: 0) {
                if purchaseManager.adFreeUnlocked {
                    
                    VStack(spacing: 12) {
                        Text(languageManager.localizedString(for: "You have Premium access"))
                            .font(.headline)
                            .tracking(1)
                            .multilineTextAlignment(.center)
                        
                        Text(languageManager.localizedString(for: "Enjoy an ad-free experience. Thank you for supporting the app."))
                            .font(.subheadline)
                            .tracking(1)
                            .opacity(0.6)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                } else if let product = purchaseManager.adFreeProduct {
                    VStack(spacing: 12) {
                        Text(languageManager.localizedString(for: "Upgrade to Premium"))
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        
                        Text(languageManager.localizedString(for: "Support the app and enjoy an ad-free experience"))
                            .font(.subheadline)
                            .opacity(0.6)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        
                        Button {
                            Task { await purchaseManager.purchaseAdFree() }
                        } label: {
                            Text("\(languageManager.localizedString(for: "Remove Ads")) – \(product.displayPrice)")
                                .padding(.horizontal)
                        }
                        .tint(.primary)
                        .foregroundStyle(Color(UIColor.systemBackground))
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        
                        Button(languageManager.localizedString(for: "Restore Purchases")) {
                            Task { await purchaseManager.restorePurchases() }
                        }
                        .buttonStyle(.plain)
                        .font(.footnote)
                        .opacity(0.6)
                        .padding(.vertical, 2)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    ProgressView(languageManager.localizedString(for: "Loading…"))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
            .frame(maxWidth: 600, alignment: .leading)
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 15))
        }
        
    }
    
}

//#Preview {
//    SettingsView()
//        .modelContainer(for: GameSettings.self, inMemory: true)
//}

struct PrivacyPolicyView: View {
    let policyText: String
    let isPad: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                // Split paragraphs
                let paragraphs: [String] = policyText
                    .split(separator: "\n\n")
                    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
                
                // Remove the first section if it starts with "# " and remove paragraphs starting with "---"
                let dropFirstCount = (paragraphs.first?.hasPrefix("# ") == true) ? 1 : 0
                let filteredParagraphs = paragraphs
                    .dropFirst(dropFirstCount)
                    .filter { !$0.hasPrefix("---") }
                
                // Combine the first three paragraphs into one info box
                let infoParagraphs = Array(filteredParagraphs.prefix(3))
                // Find the index of the "Contact" heading
                let restParagraphs = Array(filteredParagraphs.dropFirst(3))
                // Find the index of the "Contact" heading in restParagraphs
                let contactIndex = restParagraphs.firstIndex(where: { para in
                    para.components(separatedBy: "\n").first?.trimmingCharacters(in: .whitespacesAndNewlines).hasPrefix("## Contact") ?? false
                })
                
                let (mainBlocks, contactBlocks): ([String], [String]) = {
                    if let contactIdx = contactIndex {
                        return (Array(restParagraphs.prefix(contactIdx)), Array(restParagraphs.suffix(from: contactIdx)))
                    } else {
                        return (restParagraphs, [])
                    }
                }()
                VStack(alignment: .leading, spacing: 16) {
                    // Information box with first three paragraphs
                    if !infoParagraphs.isEmpty {
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(alignment: .center, spacing: 16) {
                                Image(systemName: "info.circle")
                                    .font(.system(size: 30).weight(.semibold))
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.white, .accent)
                                Text("Information")
                                    .font(.title3.weight(.bold))
                                    .tracking(1)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            VStack(alignment: .leading, spacing: 16) {
                                ForEach(infoParagraphs, id: \.self) { para in
                                    if let parsed = try? AttributedString(
                                        markdown: para,
                                        options: .init(interpretedSyntax: .full)
                                    ) {
                                        Text(parsed)
                                    } else {
                                        Text(para)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineSpacing(6)
                            .padding(.top, 2)
                        }
                        .padding(28)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, isPad ? 25 : 0)
                        .frame(maxWidth: 650)
                    }
                    
                    // Display all main blocks as before
                    ForEach(Array(mainBlocks.enumerated()), id: \.offset) { _, block in
                        let lines = block.components(separatedBy: "\n")
                            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                            .filter { !$0.isEmpty }
                        
                        if lines.isEmpty {
                            EmptyView()
                        } else {
                            VStack(alignment: .leading, spacing: 16) {
                                // Heading logic
                                if let heading = lines.first, heading.hasPrefix("## ") {
                                    let headingText = String(heading.dropFirst(3))
                                    // Map heading to SF Symbol
                                    let symbolName: String = {
                                        switch headingText {
                                        case "Information":
                                            return "info.circle"
                                        case "Information Collection and Use", "Collection and Use":
                                            return "archivebox.circle"
                                        case "Advertising":
                                            return "tag.circle"
                                        case "In-App Purchases":
                                            return "cart.circle"
                                        case "Changes to This Policy":
                                            return "pencil.circle"
                                        case "Contact":
                                            return "envelope.circle"
                                        default:
                                            return "info.triangle"
                                        }
                                    }()
                                    HStack(alignment: .center, spacing: 16) {
                                        Image(systemName: symbolName)
                                            .font(.system(size: 30).weight(.semibold))
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white, .accent)
                                        // Remove "Information" from "## Information Collection and Use"
                                        Text(
                                            headingText.trimmingPrefix("Information ")
                                        )
                                        .font(.title3.weight(.bold))
                                        .tracking(1)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                // Body / bullets
                                VStack(alignment: .leading, spacing: 8) {
                                    ForEach(Array(lines.enumerated()), id: \.offset) { idx, line in
                                        // Skip top-level heading (# ) line if present
                                        if idx == 0 && (line.hasPrefix("# ") || line.hasPrefix("## ")) {
                                            EmptyView()
                                        } else {
                                            let trimmed = line
                                            if trimmed.hasPrefix("- ") {
                                                HStack(alignment: .top, spacing: 8) {
                                                    Text("•")
                                                    if let parsed = try? AttributedString(
                                                        markdown: String(trimmed.dropFirst(2)),
                                                        options: .init(interpretedSyntax: .full)
                                                    ) {
                                                        Text(parsed)
                                                    } else {
                                                        Text(String(trimmed.dropFirst(2)))
                                                    }
                                                }
                                            } else {
                                                if let parsed = try? AttributedString(
                                                    markdown: trimmed,
                                                    options: .init(interpretedSyntax: .full)
                                                ) {
                                                    Text(parsed)
                                                } else {
                                                    Text(trimmed)
                                                }
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineSpacing(6)
                                .padding(.top, 2)
                            }
                            .padding(28)
                            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal, isPad ? 25 : 0)
                            .frame(maxWidth: 650)
                        }
                    }
                    
                    // Display the "Contact" heading and all following blocks in a single box if present
                    if !contactBlocks.isEmpty {
                        // Flatten all lines from contactBlocks
                        let allContactLines: [String] = contactBlocks.flatMap { $0.components(separatedBy: "\n")
                                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                                .filter { !$0.isEmpty }
                        }
                        if !allContactLines.isEmpty {
                            VStack(alignment: .leading, spacing: 16) {
                                // Heading logic for the first line (should be ## Contact)
                                if let heading = allContactLines.first, heading.hasPrefix("## ") {
                                    let headingText = String(heading.dropFirst(3))
                                    let symbolName: String = {
                                        switch headingText {
                                        case "Contact":
                                            return "envelope.circle"
                                        default:
                                            return "info.triangle"
                                        }
                                    }()
                                    HStack(alignment: .center, spacing: 16) {
                                        Image(systemName: symbolName)
                                            .font(.system(size: 30).weight(.semibold))
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white, .accent)
                                        Text(
                                            headingText.trimmingPrefix("Information ")
                                        )
                                        .font(.title3.weight(.bold))
                                        .tracking(1)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                // Body / bullets
                                VStack(alignment: .leading, spacing: 16) {
                                    ForEach(Array(allContactLines.enumerated()), id: \.offset) { idx, line in
                                        if idx == 0 && (line.hasPrefix("# ") || line.hasPrefix("## ")) {
                                            EmptyView()
                                        } else {
                                            let trimmed = line
                                            if trimmed.hasPrefix("- ") {
                                                HStack(alignment: .top, spacing: 8) {
                                                    Text("•")
                                                    if let parsed = try? AttributedString(
                                                        markdown: String(trimmed.dropFirst(2)),
                                                        options: .init(interpretedSyntax: .full)
                                                    ) {
                                                        Text(parsed)
                                                    } else {
                                                        Text(String(trimmed.dropFirst(2)))
                                                    }
                                                }
                                            } else {
                                                if let parsed = try? AttributedString(
                                                    markdown: trimmed,
                                                    options: .init(interpretedSyntax: .full)
                                                ) {
                                                    Text(parsed)
                                                } else {
                                                    Text(trimmed)
                                                }
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineSpacing(6)
                            }
                            .padding(28)
                            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal, isPad ? 25 : 0)
                            .frame(maxWidth: 650)
                        }
                    }
                }
                .padding()
            }
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("GameBackground").gradient)
        .navigationTitle("Privacy Policy")
        .toolbarTitleDisplayMode(.inline)
    }
    
    
}

// Helper extension to trim prefix
private extension String {
    func trimmingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}


extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        Array(Set(self))
    }
}
