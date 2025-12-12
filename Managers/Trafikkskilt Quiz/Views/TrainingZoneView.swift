//
//  PracticeSignsView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on [Date]
//

import SwiftUI
import SwiftData
import Translation

struct TrainingZoneView: View {
    let country: Country
    
    @EnvironmentObject var router: NavigationRouter
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    @Query private var settings: [GameSettings]
    @Query private var countries: [CountryDataEntity]
    
    @State private var expandedIndex: Int? = nil
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    private var userLanguage: Language {
        Language.allCases.first { $0.rawValue == settings.first?.userLanguage ?? "" } ?? .englishGB
    }
    
//    private var supportedLanguage: Language {
//        // If the user's language is in the country's supportedLanguages, use it
//        if country.supportedLanguages.contains(userLanguage) {
//            return userLanguage
//        }
//        // Otherwise, fall back to the first supported language
//        return country.supportedLanguages.first { $0.isFullySupported } ?? .englishGB
//    }
    
//    private var configuration: TranslationSession.Configuration {
//        TranslationSession.Configuration(
//            source: Locale.Language(identifier: supportedLanguage.rawValue),
//            target: Locale.Language(identifier: userLanguage.rawValue)
//        )
//    }
    
    var countryScores: CountryScores? {
        guard let settings = settings.first else { return nil }
        return settings.scores(for: country.rawValue)
    }
    
    private var countryEntity: CountryDataEntity? {
        let found = countries.first(where: { $0.country == country.rawValue })
        return found
    }
    
    private var sortedSections: [TrafficSectionEntity] {
        (countryEntity?.sections ?? []).sorted(by: { $0.index < $1.index })
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                Text(languageManager.localizedString(
                    for: "Learn the rules. Beat the game."
                ))
                .subtitleTextStyle(isSmall: isSmall, isPad: isPad)
                .padding(.vertical, isPad ? 48 : 16)
                .padding(.horizontal)
                
                GlassEffectContainer(spacing: 16) {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(sortedSections.indices, id: \.self) { index in
                            categoryCard(for: index)
                        }
                    }
                    .padding(.top, isPad ? 32 : 16)
                    .padding(.bottom, (isSmall || isPad) ? 16 : 0)
                }
            }
            .padding(.bottom, (isSmall || isPad) ? 16 : 0)
            .padding(.horizontal)
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Color("GameBackground").gradient)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .title) {
                Text(languageManager.localizedString(for: "Training Zone"))
                    .titleTextStyle(isSmall: isSmall, isPad: isPad)
            }
        }
    }
    
    // MARK: - Category Cards
    @ViewBuilder
    private func categoryCard(for index: Int) -> some View {
        let section = sortedSections[index]
        let subSections = section.subSections ?? []
        
//        let subcategoryList = subSections.map {
//            let count = $0.signs.count
//            let score = countryScores?.bestScore(for: $0.name(for: userLanguage.rawValue),
//                                                 subSection: section.name(for: userLanguage.rawValue)) ?? 0
//            return SubcategoryData(index: $0.index, name: $0.name(for: userLanguage.rawValue), signCount: count, highScore: score)
//        }
        
        let subcategoryList = subSections.map { sub in
            let count = sub.signs.count
            
            let sectionName = section.name(for: userLanguage.rawValue)
            let subsectionName = sub.name(for: userLanguage.rawValue)
            
            let score = countryScores?.bestScore(
                for: sectionName,
                subSection: subsectionName
            ) ?? 0
            
            return SubcategoryData(
                index: sub.index,
                name: subsectionName,
                signCount: count,
                highScore: score
            )
        }
        
        let totalSigns = subSections.isEmpty
        ? section.signs.count
        : subSections.reduce(section.signs.count) { $0 + $1.signs.count }
        
        let description = "\(totalSigns) \(languageManager.localizedString(for: "signs"))"
        let highScore: Int = countryScores?.bestScore(for: section.name(for: userLanguage.rawValue)) ?? 0
        
        SignCategoryCard(
            title: section.name(for: userLanguage.rawValue),
            description: description,
            subcategories: subSections.isEmpty ? nil : subcategoryList,
            highScore: highScore,
            color: .blue.mix(with: .black, by: 0.3),
            isSmall: isSmall,
            isPad: isPad,
            isLandscape: isLandscape,
            languageManager: languageManager,
            userLanguage: userLanguage,
            onStartQuiz: { sectionTitle in router.goToQuizIntro(mode: .sectionSigns, country: country, sectionID: section.id, subSectionID: nil, sectionTitle: sectionTitle, subsectionTitle: nil) },
            onStartSubQuiz: { sectionTitle, subsectionTitle, index in
                if let subSection = section.subSections?.first(where: { $0.index == index }) {
                    router.goToQuizIntro(mode: .sectionSigns, country: country, sectionID: section.id, subSectionID: subSection.id, sectionTitle: sectionTitle, subsectionTitle: subsectionTitle)
                }
            },
            onLearnSigns: { title in router.goToLearnSigns(section: section, title: title) },
            isExpanded: Binding(
                get: { expandedIndex == index },
                set: { newValue in
                    withAnimation {
                        expandedIndex = newValue ? index : nil
                    }
                }
            )
        )
    }
}


struct SignCategoryCard: View {
    let title: String
    let description: String
    let subcategories: [SubcategoryData]?
    let highScore: Int
    let color: Color
    let isSmall: Bool
    let isPad: Bool
    let isLandscape: Bool
    let languageManager: LanguageManager
    let userLanguage: Language
    let onStartQuiz: (String) -> Void
    let onStartSubQuiz: (String, String, Int) -> Void
    let onLearnSigns: (String) -> Void
    
    @Binding var isExpanded: Bool
    
//    @State private var displayTitle: String? = nil
//    @State private var displaySubsectionTitles: [String: String] = [:]
    
    private var summaryText: String {
        if let subs = subcategories, !subs.isEmpty {
            return String(format: languageManager.localizedString(for: "%d Sections"), subs.count)
        } else {
            return String(
                format: languageManager.localizedString(for: "High Score: %d%%"),
                highScore
            )
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // MARK: Header
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(isPad ? .title.weight(.bold) : .title3.weight(.bold))
                        .transition(.opacity)
                    
                    Text(description)
                        .font(isPad ? .body.weight(.medium) : .callout.weight(.medium))
                        .opacity(0.7)
                    
                    Text(summaryText)
                        .font(isPad ? .body.weight(.medium) : .callout.weight(.medium))
                        .opacity(0.7)
                }
                
                Spacer(minLength: 16)
                
                Image(systemName: isExpanded ? "arrow.up.circle.dotted" : "arrow.down.circle.dotted")
                    .symbolRenderingMode(.palette)
                    .contentTransition(.symbolEffect(.replace.magic(fallback: .replace)))
                    .foregroundStyle(.white, .accent)
                    .font(.system(size: isPad ? 50 : 40).weight(.bold))
                    .symbolEffect(.pulse, options: .repeat(.continuous))
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
            }
            
            // MARK: Expanded content
            if isExpanded {
                if let subs = subcategories, !subs.isEmpty {
                    VStack(alignment: .center, spacing: 20) {
                        ForEach(subs.sorted(by: { $0.index < $1.index })) { sub in
                            HStack(alignment: .center, spacing: 0) {
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(sub.name)
                                        .font(isPad ? .body.weight(.bold) : .callout.weight(.bold))
                                    
                                    Text(String(format: languageManager.localizedString(for: "%d signs"), sub.signCount))
                                        .font(isPad ? .subheadline.weight(.medium) : .footnote.weight(.medium))
                                        .opacity(0.7)
                                    
                                    Text(String(format: languageManager.localizedString(for: "High Score: %d%%"), sub.highScore))
                                        .font(isPad ? .subheadline.weight(.medium) : .footnote.weight(.medium))
                                        .opacity(0.7)
                                }
                                
                                Spacer(minLength: 16)
                                
                                Button {
                                    onStartSubQuiz(title, sub.name, sub.index)
                                } label: {
                                    Text(languageManager.localizedString(for: "Play Quiz"))
                                        .font(.custom("SairaStencilOne-Regular", size: isPad ? 22 : 17))
                                        .tracking(0)
                                        .lineLimit(1)
                                        .allowsTightening(true)
                                        .padding(.horizontal, isPad ? 32 : 6)
                                        .padding(.vertical, 2)
                                }
                                .tint(.accent)
                                .foregroundStyle(.white)
                                .buttonStyle(.glassProminent)
                                .controlSize(.small)
                            }
                        }
                        
                        Button {
                            onLearnSigns(title)
                        } label: {
                            Text(languageManager.localizedString(for: "Driver's Guide"))
                                .tertiaryButtonLabel(isSmall: isSmall, isPad: isPad)
                        }
                        .tint(.blue.opacity(0.5))
                        .foregroundStyle(.white)
                        .buttonStyle(.glassProminent)
                        .controlSize(.regular)
                        .padding(.top)
                    }
                    .padding(.top)
                } else {
                    HStack(spacing: isSmall ? 12 : 16) {
                            
                            Button {
                                onLearnSigns(title)
                            } label: {
                                Text(languageManager.localizedString(for: "Driver's Guide"))
                                    .tertiaryButtonLabel(isSmall: isSmall, isPad: isPad)
                            }
                            .tint(.blue.opacity(0.5))
                            .foregroundStyle(.white)
                            .buttonStyle(.glassProminent)
                            .controlSize(.regular)
                            
                            
                            Button {
                                onStartQuiz(title)
                            } label: {
                                Text(languageManager.localizedString(for: "Play Quiz"))
                                    .tertiaryButtonLabel(isSmall: isSmall, isPad: isPad)
                            }
                            .tint(.accent)
                            .foregroundStyle(.white)
                            .buttonStyle(.glassProminent)
                            .controlSize(.regular)
                        }
                        .padding(.top)
//                    }
                }
            }
        }
        .tracking(1)
        .padding(isSmall ? 18 : 22)
        .foregroundStyle(.white)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, isPad ? 25 : 0)
        .frame(maxWidth: 650)
    }
}

struct SubcategoryData: Identifiable {
    let id = UUID()
    let index: Int
    let name: String
    let signCount: Int
    let highScore: Int
}
