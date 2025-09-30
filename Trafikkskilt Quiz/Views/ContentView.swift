//
//  ContentView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingSettings = false
    @Namespace private var quizNamespace
    @Environment(\.colorScheme) var colorScheme
    @State private var newColorScheme: ColorScheme?
    
    @Query private var settings: [GameSettings]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                let country = settings.first?.selectedCountry ?? "Norway"
                
                Text(LocalizationHelper.localizedString(for: "Traffic Sign Quiz", country: country))
                    .font(.system(size: 60, weight: .black, design: .default))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.primary)
                    .padding(.horizontal, 32)
                
                Spacer(minLength: 15)
                
                Image("Trafikkskilt Quiz LOGO")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300)
                    .padding(.horizontal, 46)
                
                Spacer(minLength: 15)
                Spacer(minLength: 15)
                
                NavigationStack {
                    VStack(spacing: 20) {
                        let country = settings.first?.selectedCountry ?? "Norway"
                        
                        NavigationLink(value: QuizMode.regular) {
                            Text(LocalizationHelper.localizedString(for: "Regular Quiz", country: country))
                                .font(.title3.weight(.bold))
                                .textCase(.uppercase)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 4)
                        }
                        .tint(.primary)
                        .foregroundStyle(Color(UIColor.systemBackground))
                        .buttonStyle(.glassProminent)
                        .controlSize(.large)
                        .padding(.horizontal)
                        .matchedTransitionSource(id: "regular", in: quizNamespace)
                        
                        NavigationLink(value: QuizMode.timeChallange) {
                            Text(LocalizationHelper.localizedString(for: "Time Challenge", country: country))
                                .font(.title3.weight(.bold))
                                .textCase(.uppercase)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 4)
                        }
                        .tint(.primary)
                        .foregroundStyle(Color(UIColor.systemBackground))
                        .buttonStyle(.glassProminent)
                        .controlSize(.large)
                        .padding(.horizontal)
                        .matchedTransitionSource(id: "timeAttack", in: quizNamespace)
                        
                        NavigationLink(value: QuizMode.allSigns) {
                            Text(LocalizationHelper.localizedString(for: "All Signs", country: country))
                                .font(.title3.weight(.bold))
                                .textCase(.uppercase)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 4)
                        }
                        .tint(.primary)
                        .foregroundStyle(Color(UIColor.systemBackground))
                        .buttonStyle(.glassProminent)
                        .controlSize(.large)
                        .padding(.horizontal)
                        .matchedTransitionSource(id: "allSigns", in: quizNamespace)
                    }
                    .navigationDestination(for: QuizMode.self) { mode in
                        switch mode {
                        case .regular:
                            StartQuizIntroView(
                                quizMode: .regular,
                                country: .norway,
                                title: LocalizationHelper.localizedString(for: "Regular Quiz", country: country),
                                subtitle: LocalizationHelper.localizedString(
                                    for: "Decide how many signs you want to be tested on. The signs will be chosen randomly from all categories.",
                                    country: country
                                ),
                                namespace: quizNamespace,
                                matchedID: "regular"
                            )
                        case .timeChallange:
                            StartQuizIntroView(
                                quizMode: .timeChallange,
                                country: .norway,
                                title: LocalizationHelper.localizedString(for: "Time Challenge", country: country),
                                subtitle: LocalizationHelper.localizedString(
                                    for: "Choose how long you want to play and answer as many signs as you can before time runs out.",
                                    country: country
                                ),
                                namespace: quizNamespace,
                                matchedID: "timeAttack"
                            )
                        case .allSigns:
                            StartQuizIntroView(
                                quizMode: .allSigns,
                                country: .norway,
                                title: LocalizationHelper.localizedString(for: "All Signs", country: country),
                                subtitle: LocalizationHelper.localizedString(
                                    for: "Explore all traffic signs. Choose a category and test your knowledge.",
                                    country: country
                                ),
                                namespace: quizNamespace,
                                matchedID: "allSigns"
                            )
                        }
                    }
                }
            }
            .background(.regularMaterial)
            .tint(.primary)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showingSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView()
                    .environment(\.colorScheme, colorScheme)
            }
        }
        .preferredColorScheme(newColorScheme)
        .onChange(of: settings.first?.displayMode) {
            updateColorScheme()
        }
        .onAppear {
            updateColorScheme()
        }
    }
    
//    private func colorSchemeFromSettings() -> ColorScheme? {
//        switch settings.first?.displayMode ?? 0 {
//        case 1: return .light
//        case 2: return .dark
//        default: return nil // system default
//        }
//    }
    
    private func updateColorScheme() {
        switch settings.first?.displayMode ?? 0 {
        case 1:
            withAnimation {
                newColorScheme = .light
            }
        case 2:
            withAnimation {
                newColorScheme = .dark
            }
        default:
            withAnimation {
                newColorScheme = nil
            }
        }
    }
}

/// Reusable styled button for menu items
struct MenuButton: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(.thinMaterial))
    }
}

enum QuizMode: String, CaseIterable, Identifiable {
    case regular = "Regular Quiz"
    case timeChallange = "Time Challenge"
    case allSigns = "All Signs"
    
    var id: String { rawValue }
    
    func localizedTitle(for country: String) -> String {
        switch self {
        case .regular:
            return LocalizationHelper.localizedString(for: "Regular Quiz", country: country)
        case .timeChallange:
            return LocalizationHelper.localizedString(for: "Time Challenge", country: country)
        case .allSigns:
            return LocalizationHelper.localizedString(for: "All Signs", country: country)
        }
    }
}

enum Country: String, CaseIterable, Identifiable  {
    case norway = "Norway"
    
    var id: String { self.rawValue }
    
    var flag: String {
        switch self {
        case .norway: return "🇳🇴"
        }
    }
    
    var localizedName: String {
        switch self {
        case .norway: return "Norge"
        }
    }
}


#Preview {
    ContentView()
}
