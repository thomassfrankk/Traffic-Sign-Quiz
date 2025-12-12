//
//  GameView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 19/11/25.
//

import SwiftUI
import SwiftData

struct QuizGameView: View {
    // MARK: - Environment & State Management
    @EnvironmentObject var purchaseManager: PurchaseManager
    @EnvironmentObject var router: NavigationRouter
    @StateObject private var viewModel: GameViewModel
    
    // MARK: - Queries
    @Query private var settings: [GameSettings]
    @Query private var countryEntities: [CountryDataEntity]
    
    // MARK: - Environment Variables
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    // MARK: - Parameters
    let quizMode: QuizMode
    let country: Country
    let selectedSectionID: String?
    let selectedSubSectionID: String?
    let initialLives: Int?
    
    // MARK: - State
    private let hapticGenerator = UINotificationFeedbackGenerator()
    @State private var showDismissWarning = false
    @State var gameTimer: Timer?
    @State var grandPrixShortTime: Bool = false
    @State private var showTimeReduced = false
    @State private var remainingSecondsForQuestion: Int = 12
    @State private var timePerQuestion: Int = 12
    
    @State private var timeRemaining: Int = 60
    
    @State private var timeChange: Int = 0  // 0 = neutral state // 1 = more time // 2 = less time
    
    // MARK: - Computed Properties
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    private var userLanguage: Language {
        Language.allCases.first { $0.rawValue == settings.first?.userLanguage ?? "" } ?? .englishGB
    }
    
    private var countryEntity: CountryDataEntity? {
        countryEntities.first { $0.country == country.rawValue }
    }
    
    private var selectedSection: TrafficSectionEntity? {
        guard let id = selectedSectionID else { return nil }
        return countryEntity?.sections.first { $0.id == id }
    }
    
    private var categoryTitle: String? {
        guard let selectedSection = selectedSection else { return nil }
        return selectedSection.name(for: userLanguage.rawValue)
    }
    
    private var selectedSubSection: TrafficSubSectionEntity? {
        guard let id = selectedSubSectionID else { return nil }
        return countryEntity?.sections
            .flatMap { $0.subSections ?? [] }
            .first { $0.id == id }
    }
    
    private var subCategoryTitle: String? {
        guard let selectedSubSection = selectedSubSection else { return nil }
        return selectedSubSection.name(for: userLanguage.rawValue)
    }
    
    
    private func getSignsForSection() -> [TrafficSignEntity] {
        if let subSection = selectedSubSection {
            return subSection.signs
        } else if let section = selectedSection {
            let sectionSigns = section.signs
            let subSectionSigns = section.subSections?.flatMap { $0.signs } ?? []
            return sectionSigns + subSectionSigns
        }
        return []
    }
    
    private var allSigns: [TrafficSignEntity] {
        countryEntity?.sections
            .flatMap { section in
                let subSigns = section.subSections?.flatMap { $0.signs } ?? []
                return section.signs + subSigns
            } ?? []
    }
    
    private func getSignsForQuizMode() -> [TrafficSignEntity] {
        if quizMode == .grandTour || quizMode == .sectionSigns {
            return getSignsForSection()
        } else {
            return allSigns
        }
    }
    
    // MARK: - Initialization
    init(
        quizMode: QuizMode,
        country: Country,
        selectedSectionID: String? = nil,
        selectedSubSectionID: String? = nil,
        initialLives: Int? = nil
    ) {
        self.quizMode = quizMode
        self.country = country
        self.selectedSectionID = selectedSectionID
        self.selectedSubSectionID = selectedSubSectionID
        self.initialLives = initialLives
        
        let vm = GameViewModel(quizMode: quizMode, initialLives: initialLives)
        _viewModel = StateObject(wrappedValue: vm)
    }
    
    private var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func buttonColorForOption(_ option: String) -> Color {
        guard let currentSign = viewModel.currentSign, viewModel.isAnswered else {
            return .blue.opacity(0.4)
        }
        
        let correctTitle = currentSign.title(for: userLanguage.rawValue)
        let selectedTitle = viewModel.selectedAnswer
        
        if option == correctTitle {
            return Color.green.mix(with: .black, by: 0.1)
        } else if option == selectedTitle {
            return Color.red.mix(with: .black, by: 0.1)
        }
        
        return .blue.opacity(0.4)
    }
    
    private var heartsDisplay: some View {
        HStack(spacing: 8) {
            Image(systemName: "heart.fill")
                .foregroundColor(.accent)
            
            Text("\(viewModel.lives ?? 0)")
                .contentTransition(.numericText(countsDown: viewModel.heartsCountsDown))
                .font(.headline.weight(.semibold))
                .foregroundStyle(.white)
                .frame(width: 20, alignment: .center)
        }
        .frame(
            width: 88,
            height: 38
        )
        .background(
            Capsule()
                .stroke(Color.white, lineWidth: 1.5)
        )
        .animation(.default, value: viewModel.lives)
    }
    
    private func sectionModeDisplay() -> some View {
        let totalQuestions = viewModel.gameSigns.count
        let currentIndex = viewModel.gameSigns.firstIndex(where: { $0.id == viewModel.currentSign?.id }) ?? 0
        
        return HStack(spacing: 8) {
            Text("\(currentIndex + 1) / \(totalQuestions)")
                .contentTransition(.numericText(countsDown: false))
                .font(.headline.weight(.semibold).monospaced(true))
                .foregroundStyle(.white)
        }
        .frame(width: 100, height: 38)
        .background(
            Capsule()
                .stroke(Color.white, lineWidth: 1.5)
        )
        .animation(.default, value: currentIndex)
    }
    
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            if let sign = viewModel.currentSign {
                VStack(spacing: ((isPad && isLandscape) || isSmall) ? 16 : 32) {
                    SignImageDisplay(sign: sign, image: viewModel.currentImage)
                        .id(viewModel.currentImage)
                        .transition(.push(from: .trailing).combined(with: .opacity))
                    
                    if viewModel.currentImageErrorMessage != nil {
                        Text(viewModel.currentImageErrorMessage!)
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.center)
                            .opacity(0.7)
                            .id(viewModel.currentImageErrorMessage)
                            .transition(.push(from: .trailing).combined(with: .opacity))
                        
                    } else if quizMode != .grandTour, quizMode != .sectionSigns {
                        VStack(spacing: 8) {
                            Text(sign.sectionName(for: userLanguage.rawValue))
                                .font(.subheadline.weight(.medium))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .transition(.push(from: .trailing).combined(with: .opacity))
                                .id(sign.id)
                            
                            if let subSection = sign.subSectionName(for: userLanguage.rawValue) {
                                Text(subSection)
                                    .font(.subheadline.weight(.medium))
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.white)
                                    .opacity(0.7)
                                    .id("\(sign.id)-subsection")
                                    .transition(.push(from: .trailing).combined(with: .opacity))
                            }
                        }
                    }
                }
                .animation(.default, value: viewModel.currentImage)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .onAppear {
                    if let hapticsEnabled = settings.first?.hapticsEnabled, hapticsEnabled {
                        hapticGenerator.prepare()
                    }
                }
                .padding(isSmall ? 16 : 32)
                .frame(maxWidth: 500)
                
                if quizMode == .sectionSigns || quizMode == .grandTour {
                    VStack(spacing: 8) {
                        Text(sign.sectionName(for: userLanguage.rawValue))
                            .font(.subheadline.weight(.medium))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .id("title")
                        
                        if let subSection = sign.subSectionName(for: userLanguage.rawValue) {
                            Text(subSection)
                                .font(.subheadline.weight(.medium))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                                .opacity(0.7)
                                .id("subTitle")
                        }
                    }
                    .padding([.horizontal, .bottom], 32)
                }
                
                
                // Options
                VStack(spacing: isSmall ? 8 : 12) {
                    ForEach(viewModel.titleOptions, id: \.self) { option in
                        let buttonColor = buttonColorForOption(option)
                        let isWrongSelected = viewModel.selectedAnswer == option && viewModel.selectedAnswer != viewModel.currentSign?.title(for: userLanguage.rawValue)
                        Button {
                            if !viewModel.isAnswered {
                                viewModel.handleAnswer(for: option, languageManager: languageManager,  languageCode: userLanguage.rawValue, soundEnabled: settings.first?.soundEnabled ?? true, hapticsEnabled: settings.first?.hapticsEnabled ?? true)
                            }
                        } label: {
                            Text(option)
                                .font(isSmall ? .callout : .headline)
                                .fontWeight(.semibold)
                                .allowsTightening(true)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true) 
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal)
                                .padding(.vertical)
                                .frame(minHeight: isSmall ? 55 : isPad ? 65 : 60)
                        }
                        .disabled(viewModel.isAnswered || viewModel.timeIsUp)
                        .padding(.horizontal, isPad ? 16 : 0)
                        .glassEffect(.regular.tint(buttonColor).interactive(!viewModel.isAnswered), in: RoundedRectangle(cornerRadius: isSmall ? 12 : 15))
                        .id(viewModel.currentSign?.id)
                        .transition(.opacity)
                        .shake(when: isWrongSelected)
                    }
                }
                .animation(.default, value: viewModel.titleOptions)
                .sensoryFeedback(.success, trigger: viewModel.triggerSuccessFeedback)
                .sensoryFeedback(.error, trigger: viewModel.triggerErrorFeedback)
                .frame(maxWidth: 600)
            }
        }
        .animation(.default, value: viewModel.currentSign)
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding([.top, .horizontal])
        .padding(.bottom, (isSmall || isPad) ? 16 : 0)
        .background(Color("GameBackground").gradient)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    showDismissWarning = true
                } label: {
                    Image(systemName: "xmark")
                }
            }
            
            ToolbarSpacer(.fixed, placement: .topBarLeading)
            
            ToolbarItem(placement: .topBarLeading) {
                if let settings = settings.first {
                    Button {
                        withAnimation { settings.soundEnabled.toggle() }
                    } label: {
                        Image(systemName: settings.soundEnabled ? "speaker.fill" : "speaker.slash.fill")
                            .contentTransition(.symbolEffect(.replace.magic(fallback: .replace)))
                    }
                }
            }
            
            if quizMode == .grandTour || quizMode == .grandPrix {
                ToolbarItem(placement: .principal) {
                    heartsDisplay
                }
            }
            
            if quizMode == .grandTour {
                ToolbarItem(placement: .topBarTrailing) {
                    let totalQuestions = viewModel.gameSigns.count
                    let currentIndex = viewModel.gameSigns.firstIndex(where: { $0.id == viewModel.currentSign?.id }) ?? 0
                    let progress = Double(currentIndex + 1) / Double(totalQuestions)
                    
                    Image(systemName: "circle", variableValue: progress)
                        .font(.largeTitle.weight(.bold))
                        .symbolVariableValueMode(.draw)
                        .foregroundStyle(.white)
                        .animation(.default, value: progress)
                        .overlay {
                            Text("\(viewModel.correctAnswers)")
                                .font(.headline.weight(.semibold))
                                .foregroundStyle(.white)
                                .contentTransition(.numericText(countsDown: false))
                        }
                        .animation(.default, value: viewModel.correctAnswers)
                }
                .sharedBackgroundVisibility(.hidden)
            }
            
            if quizMode == .grandPrix {
                ToolbarItem(placement: .topBarTrailing) {
                    let progress = Double(remainingSecondsForQuestion) / Double(timePerQuestion)
                    
                    Image(systemName: "circle", variableValue: progress)
                        .font(.largeTitle.weight(.bold))
                        .symbolVariableValueMode(.draw)
                        .foregroundStyle(grandPrixShortTime ? .accent : .white)
                        .animation(.easeInOut(duration: 1), value: progress)
                        .overlay {
                            Group {
                                if showTimeReduced {
                                    Text("-1s")
                                        .font(.headline.weight(.medium))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                        .foregroundStyle(grandPrixShortTime ? .accent : .white)
                                        .transition(.scale.combined(with: .opacity))
                                } else {
                                    Text("\(viewModel.correctAnswers)")
                                        .font(.headline.weight(.bold))
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                        .foregroundStyle(grandPrixShortTime ? .accent : .white)
                                        .contentTransition(.numericText(countsDown: false))
                                        .transition(.scale.combined(with: .opacity))
                                        .animation(.default, value: viewModel.correctAnswers)
                                }
                            }
                            .animation(.easeInOut, value: showTimeReduced)
                        }
                        
                }
                .sharedBackgroundVisibility(.hidden)
            }
            
            if quizMode == .sectionSigns {
                ToolbarItem(placement: .principal) {
                    sectionModeDisplay()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    let totalQuestions = viewModel.gameSigns.count
                    let currentIndex = viewModel.gameSigns.firstIndex(where: { $0.id == viewModel.currentSign?.id }) ?? 0
                    let progress = Double(currentIndex + 1) / Double(totalQuestions)
                    
                    Image(systemName: "circle", variableValue: progress)
                        .font(.largeTitle.weight(.bold))
                        .symbolVariableValueMode(.draw)
                        .foregroundStyle(.white)
                        .animation(.default, value: progress)
                        .overlay {
                            Text("\(viewModel.correctAnswers)")
                                .font(.headline.weight(.bold))
                                .foregroundStyle(.white)
                                .contentTransition(.numericText(countsDown: false))
                        }
                        .animation(.default, value: viewModel.correctAnswers)
                }
                .sharedBackgroundVisibility(.hidden)
            }
            
            if quizMode == .beatTheClock {
                ToolbarItem(placement: .principal) {
                    Text(formattedTime)
                        .contentTransition(.numericText(countsDown: true))
                        .font(.title.monospacedDigit().weight(.medium))
                        .foregroundColor(timeRemaining <= 10 ? .accent : .white)
                        .brightness(0.05)
                        .overlay(alignment: .bottom) {
                            if timeChange == 1 {
                                Text("+3s")
                                    .font(.subheadline.weight(.regular))
                                    .transition(.push(from: .top).combined(with: .opacity))
                                    .offset(y: 20)
                                    
                            } else if timeChange == 2 {
                                Text("-2s")
                                    .font(.subheadline.weight(.regular))
                                    .transition(.push(from: .top).combined(with: .opacity))
                                    .offset(y: 20)
                            }
                        }
                        .animation(.default, value: timeChange)
                }
                .sharedBackgroundVisibility(.hidden)
                
                ToolbarItem(placement: .topBarTrailing) {
                    let progress = Double(timeRemaining) / 60.0
                    
                    Image(systemName: "circle", variableValue: progress)
                        .font(.largeTitle.weight(.bold))
                        .symbolVariableValueMode(.draw)
                        .foregroundStyle(.white)
                        .animation(.default, value: progress)
                        .overlay {
                            Text("\(viewModel.correctAnswers)")
                                .font(.headline.weight(.bold))
                                .foregroundStyle(.white)
                                .contentTransition(.numericText(countsDown: false))
                        }
                }
                .sharedBackgroundVisibility(.hidden)
            }
            
        }
        .alert(
            languageManager.localizedString(for: "Exit quiz?"),
            isPresented: $showDismissWarning
        ) {
            Button(
                languageManager.localizedString(for: "Cancel"),
                role: .cancel
            ) {}
            
            Button(
                languageManager.localizedString(for: "Exit"),
                role: .destructive
            ) {
                if quizMode == .grandPrix {
                    gameTimer?.invalidate()
                }
                router.popBackToSelectionOrTrainingZone()
            }
        } message: {
            Text(
                languageManager.localizedString(for: "You will lose your progress in this quiz.")
            )
        }
        .onAppear {
            viewModel
                .startGame(
                    with: getSignsForQuizMode(),
                    languageManager: languageManager,
                    languageCode: userLanguage.rawValue,
                    soundEnabled: settings.first?.soundEnabled ?? true
                )
            
            if !purchaseManager.adFreeUnlocked {
                AdManager.shared.loadInterstitial()
            }
            
            if quizMode == .grandPrix {
                startGrandPrixTimer(languageManager: languageManager, languageCode: userLanguage.rawValue)
            } else if quizMode == .beatTheClock {
                startBeatTheClockTimer()
            }
        }
        .onChange(of: viewModel.isGameOver) { oldValue, newValue in
            if newValue == true {
                let result = QuizResult(
                    quizMode: quizMode,
                    country: country,
                    categoryTitle: categoryTitle ?? quizMode.rawValue,
                    categorySubtitle: subCategoryTitle,
                    gamePassed: viewModel.gamePassed,
//                    correctAnswers: 10,
//                    totalQuestions: 10,
                    correctAnswers: viewModel.correctAnswers,
                    totalQuestions: viewModel.gameSigns.count,
                    incorrectSigns: viewModel.incorrectSigns,
                )
                router.goToComplete(result: result)
            }
        }
        .onChange(of: viewModel.currentSign) { oldValue, newValue in
            if quizMode == .grandPrix {
                startGrandPrixTimer(languageManager: languageManager, languageCode: userLanguage.rawValue)
            }
        }
        .onChange(of: viewModel.selectedAnswer) { oldValue, newValue in
            if quizMode == .grandPrix, newValue != nil {
                gameTimer?.invalidate()
            }
        }
        .onChange(of: timePerQuestion) { oldValue, newValue in
            if newValue < oldValue {
                showTimeReduced = true
                
                let soundEnabled = settings.first?.soundEnabled == true
                
                if soundEnabled {
                    SoundManager.playSound(named: "longPop")
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showTimeReduced = false
                }
            }
        }
        .onChange(of: viewModel.correctAnswers) { oldValue, newValue in
            if quizMode == .beatTheClock, newValue > oldValue {
                timeChange = 1
                withAnimation {
                    timeRemaining += 3
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    timeChange = 0
                }
            }
        }
        .onChange(of: viewModel.incorrectSigns.count) { oldValue, newValue in
            if quizMode == .beatTheClock, newValue > oldValue {
                timeChange = 2
                withAnimation {
                    timeRemaining = max(0, timeRemaining - 2)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    timeChange = 0
                }
            }
        }
        .onDisappear {
            gameTimer?.invalidate()
        }
    }
    
    private func startGrandPrixTimer(languageManager: LanguageManager, languageCode: String) {
        gameTimer?.invalidate()
        
        withAnimation {
            grandPrixShortTime = false
        }
        
        timePerQuestion = max(12 - (viewModel.correctAnswers / 5), 6)
        remainingSecondsForQuestion = timePerQuestion
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let soundEnabled = settings.first?.soundEnabled == true
            let hapticsEnabled = settings.first?.hapticsEnabled == true
            
            guard remainingSecondsForQuestion > 1 else {
                remainingSecondsForQuestion -= 1
                self.gameTimer?.invalidate()
                viewModel.handleGrandPrixTimeout(languageManager: languageManager, languageCode: languageCode, soundEnabled: soundEnabled)
                return
            }
            
            if remainingSecondsForQuestion <= 4 {
                remainingSecondsForQuestion -= 1
                withAnimation {
                    grandPrixShortTime = true
                }
                // Last 3 seconds alert
                if soundEnabled {
                    SoundManager.playSound(named: "clockBeep", withExtension: "mp3")
                }
                if hapticsEnabled {
                    self.hapticGenerator.prepare()
                    self.hapticGenerator.notificationOccurred(.warning)
                }
            } else {
                remainingSecondsForQuestion -= 1
            }
        }
    }
    
    private func startBeatTheClockTimer() {
        gameTimer?.invalidate()
        timeRemaining = 60
        
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let soundEnabled = settings.first?.soundEnabled == true
            let hapticsEnabled = settings.first?.hapticsEnabled == true
            
            if timeRemaining > 1 {
                withAnimation { timeRemaining -= 1 }
                if timeRemaining <= 3 {
                    // Last 3 seconds alert
                    if soundEnabled {
                        SoundManager.playSound(named: "clockBeep", withExtension: "mp3")
                    }
                    if hapticsEnabled {
                        hapticGenerator.prepare()
                        hapticGenerator.notificationOccurred(.success)
                    }
                }
            } else {
                withAnimation { timeRemaining = max(0, timeRemaining - 1) }
                if soundEnabled {
                    SoundManager.playSound(named: "timesUp", withExtension: "mp3")
                }
                viewModel.timeIsUp = true
                viewModel.currentSign = nil
                viewModel.endGame(after: 1.0)
                gameTimer?.invalidate()
            }
        }
    }
}


struct SignImageDisplay: View {
    let sign: TrafficSignEntity
    let image: Data?  // Optional image data
    
    var body: some View {
        Group {
            if let data = image, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                VStack(spacing: 8) {
                    Image(systemName: "nosign.app")
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.palette)   // Use .palette for multiple colors
                        .foregroundStyle(.white, .accent)  // First layer white, second layer red
                        .padding(24)
                }
            }
        }
        .cornerRadius(5)
        .shadow(radius: 12)
        .frame(maxWidth: .infinity)
    }
}

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 9
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
                                                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                                              y: 0))
    }
}

extension View {
    func shake(when condition: Bool) -> some View {
        let shakeValue = condition ? 1.0 : 0.0
        return self.modifier(ShakeEffect(animatableData: shakeValue))
            .animation(.default, value: shakeValue)
    }
}
