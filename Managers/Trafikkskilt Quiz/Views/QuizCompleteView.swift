//
//  QuizCompleteView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 23/9/25.
//

import SwiftUI
import SwiftData
import StoreKit
import Translation

struct QuizCompleteView: View {
    
    let result: QuizResult
    
    @EnvironmentObject var router: NavigationRouter
    
    // Computed properties for convenience
    private var quizMode: QuizMode { result.quizMode }
    private var country: Country { result.country }
    private var categoryTitle: String { result.categoryTitle }
    private var categorySubtitle: String? { result.categorySubtitle }
    private var correctAnswers: Int { result.correctAnswers }
    private var totalQuestions: Int { result.totalQuestions }
    private var incorrectSigns: [TrafficSignEntity] { result.incorrectSigns }
    
    @State private var showReview: Bool = false
    
    @EnvironmentObject var purchaseManager: PurchaseManager
    @Environment(\.modelContext) private var context
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.dismiss) private var dismiss
    
    @Query private var settings: [GameSettings]
    @Query private var countries: [CountryDataEntity]
    
    @State private var newScore: Int = 0
    @State private var showResults = false
    @State private var adShown = false
    @State private var highScoreMessage: String? = nil
    
    @State private var isGrandTourCompleted: Bool = false
    @State private var isGrandTourEliteCompleted: Bool = false
    
    @State private var grandTourRequirement: String = "80% required to pass"
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    private var userLanguage: Language {
        Language.allCases.first { $0.rawValue == settings.first?.userLanguage ?? "" } ?? .englishGB
    }
    
    private var supportedLanguage: Language {
        // If the user's language is in the country's supportedLanguages, use it
        if country.supportedLanguages.contains(userLanguage) {
            return userLanguage
        }
        // Otherwise, fall back to the first supported language
        return country.supportedLanguages.first { $0.isFullySupported } ?? .englishGB
    }
    
    private var configuration: TranslationSession.Configuration {
        TranslationSession.Configuration(
            source: Locale.Language(identifier: supportedLanguage.rawValue),
            target: Locale.Language(identifier: userLanguage.rawValue)
        )
    }
    
    private var score: Int {
        guard result.totalQuestions > 0 else { return 0 }
        return Int((Double(result.correctAnswers) / Double(result.totalQuestions)) * 100)
    }
    
    private var gameOverTitle: String {
        switch quizMode {
        case .grandTour:
            return isGrandTourEliteCompleted ?
            "Tour Complete" :
            isGrandTourCompleted ?
            "Tour Complete" :
            result.gamePassed ?
            languageManager.localizedString(for: "Section Passed") :
            languageManager.localizedString(for: "Game Over")
        case .grandPrix:
            return result.gamePassed ?
            languageManager.localizedString(for: "Game Complete") :
            languageManager.localizedString(for: "Game Over")
        case .beatTheClock:
            return result.gamePassed ?
            languageManager.localizedString(for: "Game Complete") :
            languageManager.localizedString(for: "Time's Up!")
        case .sectionSigns:
            return languageManager.localizedString(for: "Section Complete")
        default:
            return languageManager.localizedString(for: "Game Over")
        }
    }
    
    private var primaryButtonText: String {
        switch quizMode {
        case .grandTour:
            return isGrandTourEliteCompleted ?
            // Restart Tour needs to be implemented!!!!!!
            languageManager.localizedString(for: "Restart Tour") :
            isGrandTourCompleted ?
            languageManager.localizedString(for: "Continue to Elite") :
            result.gamePassed ?
            languageManager.localizedString(for: "Continue") :
            languageManager.localizedString(for: "Try Again")
        default:
            return languageManager.localizedString(for: "Try Again")
        }
    }
    
    
    private func evaluateGrandTourCompletion() {
        // currentSettings is optional → guard is correct
        guard let currentSettings = settings.first else { return }
        
        // scores(for:) returns NON-optional → no guard needed
        let countryScores = currentSettings.scores(for: country.rawValue)
        
        // countryEntity is optional → guard is correct
        guard let countryEntity = countries.first(where: { $0.country == country.rawValue }) else { return }
        
        // sections is non-optional, no need for ?? []
        let sections = countryEntity.sections.sorted { $0.index < $1.index }
        
        var allAtLeast80 = true
        var allAt100 = true
        
        outerLoop: for section in sections {
            let sectionName = section.name(for: userLanguage.rawValue)
            
            if let subs = section.subSections, !subs.isEmpty {
                let sortedSubs = subs.sorted { $0.index < $1.index }
                for sub in sortedSubs {
                    let subName = sub.name(for: userLanguage.rawValue)
                    let score = countryScores.bestScore(for: sectionName, subSection: subName)
                    
                    if score < 80 { allAtLeast80 = false }
                    if score < 100 { allAt100 = false }
                    
                    if !allAtLeast80 && !allAt100 { break outerLoop }
                }
            } else {
                let score = countryScores.bestScore(for: sectionName)
                
                if score < 80 { allAtLeast80 = false }
                if score < 100 { allAt100 = false }
                
                if !allAtLeast80 && !allAt100 { break outerLoop }
            }
        }
        
        if allAtLeast80 {
            grandTourRequirement = "100% required to pass"
        }
        
        // Update flags on the CountryScores model
        if countryScores.isGrandTourCompleted == false && countryScores.isGrandTourCompleted != allAtLeast80 {
            countryScores.isGrandTourCompleted = allAtLeast80
            isGrandTourCompleted = allAtLeast80
        } else if countryScores.isGrandTourEliteCompleted == false && countryScores.isGrandTourEliteCompleted != allAt100 {
            countryScores.isGrandTourEliteCompleted = allAt100
            isGrandTourEliteCompleted = allAt100
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                Text(gameOverTitle)
                    .font(.custom("SairaStencilOne-Regular", size: isSmall ? 50 : 80))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
                    .brightness(0.05)
                    .padding(.horizontal)
                    .layoutPriority(1)
                    .padding(.top,isSmall ? 0 : 16)
                
                Text(languageManager.localizedString(for: categoryTitle))
                    .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : 22))
                    .multilineTextAlignment(.center)
                    .tracking(1)
                    .padding(.top,isSmall ? 4 : 8)
                
                if let subtitle = categorySubtitle {
                    Text(languageManager.localizedString(for: subtitle))
                        .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : 22))
                        .multilineTextAlignment(.center)
                        .opacity(0.7)
                        .tracking(1)
                }
            }
            .frame(maxWidth: 650)

            if showResults {
                Spacer()
                
                VStack(spacing: 0) {
                    Text(scoreText())
                        .font(.custom("SairaStencilOne-Regular", size:isSmall ? 70 :  80))
                        .tracking(4)
                        .contentTransition(.numericText(countsDown: false))
                    
                    Text(
                        quizMode == .sectionSigns || quizMode == .grandTour
                        ? String(
                            format: languageManager.localizedString(
                                for: "quiz_practise_result"
                            ),
                            correctAnswers,
                            totalQuestions
                        )
                        : languageManager.localizedString(
                            for: scoreText() == "1" ? "quiz_correct_sign" : "quiz_correct_signs"
                        )
                    )
                    .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : 22))
                    .tracking(1)
                    
                    if quizMode == .grandTour, !result.gamePassed {
                        Text(languageManager.localizedString(for: grandTourRequirement))
                            .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : 22))
                            .tracking(1)
                            .opacity(0.7)
                    } else if let message = highScoreMessage {
                        Text(languageManager.localizedString(for: message))
                            .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : 22))
                            .tracking(1)
                            .opacity(0.7)
                    }
                }
                .padding([.horizontal, .bottom], isSmall ? 16 : 32)
                .padding(.vertical, isSmall ? 0 : 8)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, isPad ? 25 : 0)
                .frame(maxWidth: 650)
                
                Spacer()
                
                VStack(spacing: isSmall ? 16 : 20) {
                    
                    if !incorrectSigns.isEmpty {
                        Button {
                            showReview = true
                        } label: {
                            Text(languageManager.localizedString(for: "Review Mistakes"))
                                .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : 22))
                                .tracking(1)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Button {
                        if result.gamePassed, quizMode == .grandTour {
                            router
                                .goToQuizIntro(
                                    mode: .grandTour,
                                    country: country,
                                    sectionID: nil,
                                    subSectionID: nil,
                                    sectionTitle: nil,
                                    subsectionTitle: nil
                                )
                        } else {
                            router.popBackToQuizIntro() // remove complete view
                        }
                    } label: {
                        Text(languageManager.localizedString(for: primaryButtonText))
                            .primaryButtonLabel(isSmall: isSmall, isPad: isPad)
                    }
                    .primaryButtonContainer()
                    
                    Button { router.popBackToSelectionOrTrainingZone() }
                    label: {
                        Text(languageManager.localizedString(for: "Back to Menu"))
                            .secondaryButtonLabel(isSmall: isSmall, isPad: isPad)
                    }
                    .secondaryButtonContainer()
                }
                .padding(.bottom, (isSmall || isPad) ? 16 : 0)
            } else {
                Spacer()
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity)
        .background(Color("GameBackground").gradient)
        .navigationDestination(isPresented: $showReview) {
            IncorrectSignsView(
                quizMode: quizMode,
                incorrectSigns: incorrectSigns,
                languageManager: languageManager,
                configuration: configuration,
                userLanguage: userLanguage,
                supportedLanguage: supportedLanguage
            )
        }
        .onAppear {
            if quizMode == .grandTour {
                evaluateGrandTourCompletion()
            }
            if !adShown {
                adShown = true
                if purchaseManager.adFreeUnlocked {
                    withAnimation {
                        saveAndCheckHighScore()
                        showResults = true
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        AdManager.shared.showAd {
                            withAnimation {
                                saveAndCheckHighScore()
                                showResults = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    func scoreText() -> String {
        switch quizMode {
        case .sectionSigns, .grandTour:
            let percentage = totalQuestions > 0
            ? Int((Double(correctAnswers) / Double(totalQuestions)) * 100)
            : 0
            return "\(percentage)%"
            
        default:
            return "\(correctAnswers)"
        }
    }
    
    func maybeRequestReview() {
        guard let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
            return
        }
        
        AppStore.requestReview(in: scene)
    }
    
    // MARK: - High score logic
    private func saveAndCheckHighScore() {
        guard let settings = settings.first else { return }
        let countryScores = settings.scores(for: country.rawValue)
        
        var isNewHigh = false
        var best: Int = 0
        
        switch quizMode {
        case .beatTheClock:
            // Grand Prix (timed mode)
            best = countryScores.bestScore(for: .beatTheClock)
            if correctAnswers > best {
                countryScores.updateQuizModeScore(for: .beatTheClock, newScore: correctAnswers)
                try? context.save()
                isNewHigh = true
            }
            
        case .grandPrix:
            // Grand Tour (mixed quiz)
            best = countryScores.bestScore(for: .grandPrix)
            if correctAnswers > best {
                countryScores.updateQuizModeScore(for: .grandPrix, newScore: correctAnswers)
                try? context.save()
                isNewHigh = true
            }
            
        case .flipAndMatch:
            // Grand Recall (memory matching) — global, not tied to country
            best = settings.bestGlobalScore(for: .flipAndMatch)
            if correctAnswers > best {
                settings.updateGlobalScore(for: .flipAndMatch, newScore: correctAnswers)
                try? context.save()
                isNewHigh = true
            }
            
        default:
            // Existing section/subsection handling
            if let sub = categorySubtitle {
                // Subcategory quiz
                best = countryScores.bestScore(for: categoryTitle, subSection: sub)
                if score > best {
                    countryScores.updateSubSectionScore(for: categoryTitle, subSection: sub, newScore: score)
                    try? context.save()
                    isNewHigh = true
                }
            } else {
                // Category-level quiz
                best = countryScores.bestScore(for: categoryTitle)
                if score > best {
                    countryScores.updateSectionScore(for: categoryTitle, newScore: score)
                    try? context.save()
                    isNewHigh = true
                }
            }
//        case .grandTour:
//            print("Grand Tour mode not yet implemented")
        }
        
        // MARK: - Update high score message
        
        if quizMode == .sectionSigns || quizMode == .grandTour {
            highScoreMessage = isNewHigh
            ? languageManager.localizedString(for: "NEW HIGH SCORE")
            : "\(languageManager.localizedString(for: "High Score:")) \(best)%"
        } else {
            highScoreMessage = isNewHigh
            ? languageManager.localizedString(for: "NEW HIGH SCORE")
            : "\(languageManager.localizedString(for: "High Score:")) \(best)"
        }
        
        if settings.soundEnabled {
            if (quizMode == .grandTour && result.gamePassed) || (quizMode != .grandTour && (isNewHigh || correctAnswers == best || score == best)) {
                SoundManager.playSound(named: "tada")
            } else if correctAnswers == 0 {
                SoundManager.playSound(named: "failure")
            }
        }
    }
}

#Preview {
    let mockResult = QuizResult(
        quizMode: .flipAndMatch, // replace with a valid QuizMode case
        country: .usa,
        categoryTitle: "Road Signs",
        categorySubtitle: "Basic",
        gamePassed: true,
        correctAnswers: 7,
        totalQuestions: 10,
        incorrectSigns: [], // empty array or mock TrafficSignEntity
    )
    
    QuizCompleteView(result: mockResult)
}


struct FlashingText: View {
    let text: String
    @State private var isVisible = true
    
    var body: some View {
        Text(text)
            .opacity(isVisible ? 1 : 0.25)
            .animation(
                .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
                value: isVisible
            )
            .onAppear {
                isVisible.toggle()
            }
    }
}
