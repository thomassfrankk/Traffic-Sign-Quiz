//
//  QuizIntroScreen.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 18/11/25.
//

import SwiftUI
import SwiftData

struct QuizIntroScreen: View {
    // MARK: - Environment Variables
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    @EnvironmentObject var router: NavigationRouter   // ← add this
    
    @Query private var settings: [GameSettings]
    @Query private var countries: [CountryDataEntity]
    
    private let hapticGenerator = UINotificationFeedbackGenerator()
    
    let quizMode: QuizMode
    let country: Country
    
    let sectionID: String?
    let subSectionID: String?
    
    let sectionTitle: String?
    let subsectionTitle: String?
    
    
    @State private var variableValue: Double = 1.0
    @State private var timer: Timer?
    
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
    
    private func findFirstIncompleteSection(isExtreme: Bool) -> (section: TrafficSectionEntity, subsection: TrafficSubSectionEntity?)? {
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
                    //                    let score = scores.bestScore(for: subsectionName, subSection: sectionName)
                    
                    if score < (isExtreme ? 100 : 80) {
                        return (section: section, subsection: subsection)
                    }
                }
            } else {
                // Section has no subsections, check the section itself
                let sectionName = section.name(for: userLanguage.rawValue)
                let score = scores.bestScore(for: sectionName)
                
                if score < (isExtreme ? 100 : 80) {
                    return (section: section, subsection: nil)
                }
            }
        }
        
        return nil
    }
    
    private var signCountGrandTour: Int {
        guard let next = findFirstIncompleteSection(isExtreme: false) ?? findFirstIncompleteSection(isExtreme: true) else { return 0 }
        
        // If there's a subsection, use it
        if let sub = next.subsection {
            return sub.signs.count
        }
        
        // Otherwise, use the section
        return next.section.signs.count
    }
    
    private func signCount() -> Int {
        // Must have a country loaded
        guard let countryEntity = countries.first(where: { $0.country == country.rawValue }) else {
            return 0
        }
        
        // Need a section
        guard let sectionID = sectionID,
              let section = countryEntity.sections.first(where: { $0.id == sectionID }) else {
            return 0
        }
        
        // If subsection is provided, use it
        if let subSectionID = subSectionID,
           let sub = section.subSections?.first(where: { $0.id == subSectionID }) {
            return sub.signs.count
        }
        
        // Otherwise return section-level count
        return section.signs.count
    }
    
    /// Calculates the number of lives based on sign count
    /// Formula: User needs 80% correct to pass, so lives = total signs - (80% of total signs) + 1
    /// Example: 10 signs → need 8 correct → can miss 2 → 3 lives (2 misses + 1)
    private var livesCount: Int? {
        if quizMode == .grandPrix { return 3 }
        
        if quizMode != .grandTour { return nil }
        
        if quizMode == .grandTour, findFirstIncompleteSection(isExtreme: false) == nil { return 1 }
        
        guard signCountGrandTour > 0 else { return 3 } // Default to 3 if no signs
        
        // Calculate minimum correct answers needed (80%)
        let minimumCorrect = Int(ceil(Double(signCountGrandTour) * 0.8))
        
        // Calculate maximum allowed incorrect answers
        let maxIncorrect = signCountGrandTour - minimumCorrect
        
        // Lives = maximum incorrect + 1 (so the last life ends the game)
        return maxIncorrect + 1
    }
    
    private func calculateStageNumber() -> (current: Int, total: Int) {
        guard let next = findFirstIncompleteSection(isExtreme: false) ?? findFirstIncompleteSection(isExtreme: true) else { return (1, 1)  }
        
        let sectionID = next.section.id
        
        // Find the country entity
        guard let countryEntity = countries.first(where: { $0.country == country.rawValue }) else {
            return (1, 1)
        }
        
        // Get all sections sorted by index
        let sortedSections = countryEntity.sections.sorted(by: { $0.index < $1.index })
        
        var currentStage = 0
        var totalStages = 0
        
        // Calculate total stages and current stage
        for section in sortedSections {
            // Check if section has subsections
            if let subSections = section.subSections, !subSections.isEmpty {
                // Each subsection is a stage
                let sortedSubSections = subSections.sorted(by: { $0.index < $1.index })
                
                for subsection in sortedSubSections {
                    totalStages += 1
                    
                    // If this is our target section and subsection
                    if section.id == sectionID {
                        if let targetSubSectionID = next.subsection?.id,
                           subsection.id == targetSubSectionID {
                            currentStage = totalStages
                        } else if next.subsection?.id == nil && currentStage == 0 {
                            // No subsection specified, use first subsection
                            currentStage = totalStages
                        }
                    }
                }
            } else {
                // Section without subsections is one stage
                totalStages += 1
                
                if section.id == sectionID {
                    currentStage = totalStages
                }
            }
        }
        
        let finalStage = currentStage > 0 ? currentStage : 1
        let finalTotal = totalStages > 0 ? totalStages : 1
        
        return (finalStage, finalTotal)
    }
    
    
    func startCountdown() {
        timer?.invalidate()  // stop previous timer if any
        hapticGenerator.prepare()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            withAnimation {
                variableValue = max(variableValue - 0.25, -0.25)
            }
            
           if variableValue == -0.25 {
                timer?.invalidate()
                
               if quizMode == .grandTour, let next = findFirstIncompleteSection(isExtreme: false) ?? findFirstIncompleteSection(isExtreme: true) {
                   DispatchQueue.main.async {
                       router.goToQuiz(
                        mode: quizMode,        // whatever mode you use
                        country: country, // pass your real values
                        sectionID: next.section.id,
                        subSectionID: next.subsection?.id,
                        sectionTitle: next.section.name(for: userLanguage.rawValue),
                        subsectionTitle: next.subsection?.name(for: userLanguage.rawValue),
                        initialLives: findFirstIncompleteSection(isExtreme: false) == nil ? 1 : livesCount
                       )
                   }
               } else if quizMode == .flipAndMatch {
                   DispatchQueue.main.async {
                       router.goToFlipAndFlop(country: country)
                   }
               } else if quizMode == .sectionSigns {
                   DispatchQueue.main.async {
                       router.goToQuiz(
                        mode: quizMode,        // whatever mode you use
                        country: country, // pass your real values
                        sectionID: sectionID,
                        subSectionID: subSectionID,
                        sectionTitle: nil,
                        subsectionTitle: nil,
                        initialLives: nil
                       )
                   }
               } else {
                   DispatchQueue.main.async {
                       router.goToQuiz(
                        mode: quizMode,        // whatever mode you use
                        country: country, // pass your real values
                        sectionID: nil,
                        subSectionID: nil,
                        sectionTitle: nil,
                        subsectionTitle: nil,
                        initialLives: livesCount
                       )
                   }
               }
            }
        }
    }

    var body: some View {
        VStack(spacing: 0)  {
            VStack(spacing: 8)  {
                
                Text(languageManager.localizedString(for: "Get Ready"))
                    .font(.custom("SairaStencilOne-Regular", size: isSmall ? 50 : 60))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .tracking(1)
                    .padding(.top)
                
                Spacer()
                
                Image(systemName: "flag.pattern.checkered.circle", variableValue: variableValue)
                    .resizable()
                    .scaledToFit()
                    .symbolVariableValueMode(.draw)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .accent)
                    .padding(.horizontal, 64)
                    .shadow(radius: 16)
                    .onAppear {
                        startCountdown()
                    }
                    .onDisappear {
                        variableValue = 1.0
                    }
                    .frame(maxWidth: 500)
                
                Spacer(minLength: 16)
                
                VStack(spacing: 8) {
                    Divider()
                        .frame(height: 2)
                        .overlay(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    if quizMode == .grandTour, let next = findFirstIncompleteSection(isExtreme: false) ?? findFirstIncompleteSection(isExtreme: true) {
                        VStack {
                            let (current, total) = calculateStageNumber()
                            let formatString = "\(languageManager.localizedString(for: "section_of_format")):"
                            Text(String(format: formatString, current, total))
                                .font(.custom("SairaStencilOne-Regular", size: 22))
                                .textCase(.uppercase)
                                .tracking(1)
                                .padding(.horizontal, isSmall ? 0 : 8)
                            
                            let sectionTitle = next.section.name(for: userLanguage.rawValue)
                            let subsectionTitle = next.subsection?.name(for: userLanguage.rawValue)
                            
                            Text(sectionTitle)
                                .font(.custom("SairaStencilOne-Regular", size: 22))
                                .multilineTextAlignment(.center)
                                .tracking(1)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal, isSmall ? 0 : 8)
                            
                            if let subsectionTitle = subsectionTitle {
                                Text(subsectionTitle)
                                    .font(.custom("SairaStencilOne-Regular", size: 22))
                                    .opacity(0.7)
                                    .multilineTextAlignment(.center)
                                    .tracking(1)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.horizontal, isSmall ? 0 : 8)
                            }
                        }
                    } else if quizMode == .sectionSigns, let sectionTitle = sectionTitle {
                        Text(sectionTitle)
                            .font(.custom("SairaStencilOne-Regular", size: 22))
                            .multilineTextAlignment(.center)
                            .tracking(1)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal, isSmall ? 0 : 8)
                        
                        if let subsectionTitle = subsectionTitle {
                            Text(subsectionTitle)
                                .font(.custom("SairaStencilOne-Regular", size: 22))
                                .opacity(0.7)
                                .multilineTextAlignment(.center)
                                .tracking(1)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal, isSmall ? 0 : 8)
                        }
                    } else {
                        Text(languageManager.localizedString(for: quizMode.rawValue))
                            .font(.custom("SairaStencilOne-Regular", size: 22))
                            .textCase(.uppercase)
                            .tracking(1)
                            .padding(.horizontal, isSmall ? 0 : 8)
                    }
                    
                    Divider()
                        .frame(height: 2)
                        .overlay(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    if quizMode != .grandTour, quizMode != .sectionSigns {
                        Text(languageManager.localizedString(for: quizMode.subtitle))
                            .font(.custom("SairaStencilOne-Regular", size: 22))
                            .multilineTextAlignment(.center)
                            .opacity(0.7)
                            .tracking(1)
                        
                    } else if quizMode == .grandTour {
                        let count = livesCount ?? 1
                        if count == 1 {
                            Text(String(format: languageManager.localizedString(for: "signs_life"), signCountGrandTour, count))
                                .font(.custom("SairaStencilOne-Regular", size: 22))
                                .opacity(0.7)
                                .tracking(1)
                        } else {
                            Text(String(format: languageManager.localizedString(for: "signs_lives"), signCountGrandTour, count))
                                .font(.custom("SairaStencilOne-Regular", size: 22))
                                .opacity(0.7)
                                .tracking(1)
                        }
                        
                    } else {
                        Text(String(format: languageManager.localizedString(for: "amount_signs"), signCount()))
                            .font(.custom("SairaStencilOne-Regular", size: 22))
                            .opacity(0.7)
                            .tracking(1)
                    }
                }
                Spacer(minLength: 8)
                Spacer(minLength: 8)
                
                Button {
                    timer?.invalidate()
                    router.popBackToSelectionOrTrainingZone()
                } label: {
                    Text(languageManager.localizedString(for: "Cancel"))
                        .font(.custom("SairaStencilOne-Regular", size: 22))
                        .tracking(1)
                        .frame(maxWidth: .infinity)
                        .brightness(0.1)
                        .padding(.vertical, 6)
                }
                .tint(.blue.opacity(0.4))
                .buttonStyle(.glassProminent)
                .controlSize(.regular)
                .padding(.bottom, (isSmall || isPad) ? 16 : 0)
            }
            .frame(maxWidth: 600)
        }
        .onChange(of: variableValue, { oldValue, newValue in
            if newValue > -0.25, newValue != 1.0 {
                if settings.first?.hapticsEnabled == true {
                    hapticGenerator.notificationOccurred(.warning)
                }
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .foregroundStyle(.white)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(Color("GameBackground").gradient)
        .navigationBarBackButtonHidden()
    }
}

//#Preview {
//    QuizIntroScreen(quizMode: .flipAndMatch, country: .usa)
//}
