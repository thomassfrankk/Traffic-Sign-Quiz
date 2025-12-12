//
//  QuizModeSelectionView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on [Date]
//

import SwiftUI
import SwiftData

struct QuizModeSelectionView: View {
    let country: Country
    
    @EnvironmentObject var router: NavigationRouter
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    @Query private var settings: [GameSettings]
    @Query private var countries: [CountryDataEntity]
    
    @State private var quizMode: QuizMode = .grandTour
    
    @State private var buttonScale: CGFloat = 1.0
    
    private var currentSettings: GameSettings? {
        settings.first
    }
    
    private var countryScores: CountryScores? {
        currentSettings?.scores(for: country.rawValue)
    }
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    private var userLanguage: Language {
        Language.allCases.first { $0.rawValue == settings.first?.userLanguage ?? "" } ?? .englishGB
    }
    
    private var countryEntity: CountryDataEntity? {
        countries.first(where: { $0.country == country.rawValue })
    }
    
    private var sortedSections: [TrafficSectionEntity] {
        (countryEntity?.sections ?? []).sorted(by: { $0.index < $1.index })
    }
    
    /// Finds the first section or subsection with a high score less than 80%
    private func findFirstIncompleteSection(isExtreme: Bool = false) -> (section: TrafficSectionEntity, subsection: TrafficSubSectionEntity?)? {
        guard let scores = countryScores else { return nil }
        
        // Iterate through sections in order
        for section in sortedSections {
            // Check if section has subsections
            if let subSections = section.subSections, !subSections.isEmpty {
                // Check each subsection
                let sortedSubSections = subSections.sorted(by: { $0.index < $1.index })
                for subsection in sortedSubSections {
                    let sectionName = section.name(for: userLanguage.rawValue)
                    let subsectionName = subsection.name(for: userLanguage.rawValue)
                    let score = scores.bestScore(for: sectionName, subSection: subsectionName)
                    
                    if score < 80, !isExtreme {
                        return (section: section, subsection: subsection)
                    } else if isExtreme, score == 100 {
                        return (section: section, subsection: subsection)
                    }
                }
            } else {
                // Section has no subsections, check the section itself
                let sectionName = section.name(for: userLanguage.rawValue)
                let score = scores.bestScore(for: sectionName)
                
                if score < 80, !isExtreme {
                    return (section: section, subsection: nil)
                } else if isExtreme, score == 100 {
                    return (section: section, subsection: nil)
                }
            }
        }
        
        return nil
    }
    
    /// Calculates the overall completion percentage based on completed signs
    /// A section/subsection is considered completed if it has a score of 80% or higher
    private func calculateOverallProgress(isExtreme: Bool = false) -> Int {
        guard let scores = countryScores else { return 0 }
        
        var totalSigns = 0
        var completedSigns = 0
        
        for section in sortedSections {
            // Check if section has subsections
            if let subSections = section.subSections, !subSections.isEmpty {
                // Count signs from subsections
                for subsection in subSections {
                    let signCount = subsection.signs.count
                    totalSigns += signCount
                    
                    let sectionName = section.name(for: userLanguage.rawValue)
                    let subsectionName = subsection.name(for: userLanguage.rawValue)
                    let score = scores.bestScore(for: sectionName, subSection: subsectionName)
                    
                    // If score is 80% or higher, count all signs from this subsection as completed
                    if score >= 80, !isExtreme {
                        completedSigns += signCount
                    } else if score == 100 {
                        completedSigns += signCount
                    }
                }
            } else {
                // Section has no subsections, count its signs directly
                let signCount = section.signs.count
                totalSigns += signCount
                
                let sectionName = section.name(for: userLanguage.rawValue)
                let score = scores.bestScore(for: sectionName)
                
                // If score is 80% or higher, count all signs from this section as completed
                if score >= 80, !isExtreme {
                    completedSigns += signCount
                } else if score == 100 {
                    completedSigns += signCount
                }
            }
        }
        
        // Calculate percentage
        guard totalSigns > 0 else { return 0 }
        return Int((Double(completedSigns) / Double(totalSigns)) * 100)
    }
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    Text(languageManager.localizedString(
                        for: "Choose Your Drive. Own the road."
                    ))
                    .subtitleTextStyle(isSmall: isSmall, isPad: isPad)
                    .padding(.vertical, isPad ? 48 : 16)
                    
                    VStack(spacing: 16) {
                        
                        QuizModeCard(
                            title: findFirstIncompleteSection() != nil ? "Grand Tour" : "Grand Tour Elite",
                            description: findFirstIncompleteSection() != nil ? "All signs. Section by section. Limited lives." : "All signs. Section by section. One life.",
                            icon: "car.circle",
                            highscore: countryScores?.bestScore(for: .grandTour) ?? 0,
                            isSelected: quizMode == .grandTour,
                            isSmall: isSmall,
                            isPad: isPad,
                            country: country,
                            languageManager: languageManager,
                            router: router,
                            quizMode: quizMode,
                            nextIncompleteSection: findFirstIncompleteSection(isExtreme: false) != nil ? findFirstIncompleteSection(isExtreme: false) :
                                findFirstIncompleteSection(isExtreme: true),
                            overallProgress: findFirstIncompleteSection(isExtreme: false) != nil ?
                                calculateOverallProgress(isExtreme: false) :
                                calculateOverallProgress(isExtreme: true)
                        ) {
                            withAnimation {
                                quizMode = .grandTour
                            }
                            
                        }
                        
                        
                        QuizModeCard(
                            title: "Mixed Quiz",
                            description: "Random signs. Decreasing time limit. Three Lives.",
                            icon: "bolt.circle",
                            highscore: countryScores?.bestScore(for: .grandPrix) ?? 0,
                            isSelected: quizMode == .grandPrix,
                            isSmall: isSmall,
                            isPad: isPad,
                            country: country,
                            languageManager: languageManager,
                            router: router,
                            quizMode: quizMode,
                            nextIncompleteSection: nil,
                            overallProgress: 0
                        ) {
                            withAnimation {
                                quizMode = .grandPrix
                            }
                            
                        }
                        
                        QuizModeCard(
                            title: "Beat the Clock",
                            description: "Watch the timer. Keep moving. Earn or lose seconds.",
                            icon: "hourglass.circle",
                            highscore: countryScores?.bestScore(for: .beatTheClock) ?? 0,
                            isSelected: quizMode == .beatTheClock,
                            isSmall: isSmall,
                            isPad: isPad,
                            country: country,
                            languageManager: languageManager,
                            router: router,
                            quizMode: quizMode,
                            nextIncompleteSection: nil,
                            overallProgress: 0
                        ) {
                            withAnimation {
                                quizMode = .beatTheClock
                            }
                        }
                        
                        QuizModeCard(
                            title: "Flip & Match",
                            description: "Flip the cards. Find the match. Test your memory.",
                            icon: "lightbulb.circle",
                            highscore: currentSettings?.bestGlobalScore(for: .flipAndMatch) ?? 0,
                            isSelected: quizMode == .flipAndMatch,
                            isSmall: isSmall,
                            isPad: isPad,
                            country: country,
                            languageManager: languageManager,
                            router: router,
                            quizMode: quizMode,
                            nextIncompleteSection: nil,
                            overallProgress: 0
                        ) {
                            withAnimation {
                                quizMode = .flipAndMatch
                            }
                        }
                        .padding(.top, 24)
                    }
                    .padding(.top)
                }
                .padding(.bottom)
                .padding(.horizontal)
            }
            .scrollBounceBehavior(.basedOnSize)
            .frame(maxWidth: .infinity)
            .background(Color("GameBackground").gradient)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .title) {
                    Text(languageManager.localizedString(for: "Pick a Game"))
                        .titleTextStyle(isSmall: isSmall, isPad: isPad)
                }
            }
    }
}

struct QuizModeCard: View {
    let title: String
    let description: String
    let icon: String
    let highscore: Int
    let isSelected: Bool
    let isSmall: Bool
    let isPad: Bool
    let country: Country
    let languageManager: LanguageManager
    let router: NavigationRouter
    let quizMode: QuizMode
    let nextIncompleteSection: (section: TrafficSectionEntity, subsection: TrafficSubSectionEntity?)?
    let overallProgress: Int
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 16) {
                Image(systemName: icon)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .accent)
                    .font(.system(size: isPad ? 72 : 48).weight(.bold))
                    .offset(y: -8)
                
                VStack(alignment: .leading, spacing: isPad ? 16 : 8) {
                    Text(languageManager.localizedString(for: title))
                        .font(isPad ? .title.weight(.heavy) : isSmall ? .title3.weight(.heavy) : .title2.weight(.heavy))
                        .textCase(.uppercase)
                        .tracking(1)
                    
                    Text(languageManager.localizedString(for: description))
                        .font(isPad ? .body.weight(.medium) : isSmall ? .callout.weight(.medium) : .body.weight(.medium))
                        .fixedSize(horizontal: false, vertical: true)
                        .opacity(0.7)
                    
                    if quizMode == .grandTour, isSelected {
                        // Display next incomplete section
                        if nextIncompleteSection != nil {
                            let localeCompleted = languageManager.localizedString(for: "COMPLETED")
                            Text(String(format: "%d%% \(localeCompleted)", overallProgress))
                                .font(isPad ? .body.weight(.bold) : .callout.weight(.bold))
                                .padding(.top, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                        } else {
                            let localeCompleted = languageManager.localizedString(for: "COMPLETED")
                            Text("100% \(localeCompleted)")
                                .font(isPad ? .body.weight(.bold) : .callout.weight(.bold))
                                .padding(.top, 8)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                    } else if isSelected {
                        Text(
                            highscore != 0
                            ? String(format: languageManager.localizedString(for: "HIGH SCORE: %d SIGNS"), highscore)
                            : languageManager.localizedString(for: "NO HIGH SCORE")
                        )
                        .font(isPad ? .body.weight(.bold) : .callout.weight(.bold))
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            if isSelected {
                HStack(spacing: 16) {
                    Button {
                        router.goToQuizIntro(
                            mode: quizMode,
                            country: country,
                            sectionID: nil,
                            subSectionID: nil,
                            sectionTitle: nil,
                            subsectionTitle: nil
                        )
                    } label: {
                        Text(quizMode == .grandTour ?
                             overallProgress == 0 ?
                             languageManager.localizedString(for: "Start Tour") :
                             languageManager.localizedString(for: "Continue") :
                                title == "Flip & Match" ?
                             languageManager.localizedString(for: "Play Now") :
                                languageManager.localizedString(for: "Play Quiz"))
                        .tertiaryButtonLabel(isSmall: isSmall, isPad: isPad)
                    }
                    .tertiaryButtonContainer(tint: .accent)
                }
                .padding(.top, 24)
            }
            
        }
        .padding(isSmall ? 18 : 22)
        .foregroundStyle(.white)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, isPad ? 25 : 0)
        .frame(maxWidth: 650)
        .overlay(alignment: .topTrailing) {
            if title == "Flip & Match" {
                Text(languageManager.localizedString(for: "BONUS GAME"))
                    .font(isSmall ? .footnote.weight(.bold) : .subheadline.weight(.bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, isSmall ? 6 : 8)
                    .padding(.vertical, isSmall ? 2 : 4)
                    .background(Color.accent)
                    .cornerRadius(isSmall ? 3 : 5)
                    .padding(8)
                    .offset(x: -36, y: isSmall ? -17 : -22)
            }
        }
        .animation(.default, value: isSelected)
        .contentShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .onTapGesture { action() }
    }
}

//#Preview {
//    NavigationStack {
//        QuizModeSelectionView(country: .norway)
//    }
//}
