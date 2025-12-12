//
//  QuizGameView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 23/9/25.
//

import SwiftUI
import GoogleMobileAds
import SwiftData
import AudioToolbox
import Translation

struct FlipAndFlopView: View {
    let country: Country
    
    @Query private var settings: [GameSettings]
    @Query private var countries: [CountryDataEntity]
    
    @EnvironmentObject var purchaseManager: PurchaseManager
    @EnvironmentObject var router: NavigationRouter
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    @State private var bounceLife: Bool = false
    @State private var heartsCountsDown: Bool = true
    
    private let hapticGenerator = UINotificationFeedbackGenerator()
    @State private var shakeTrigger: CGFloat = 0
    
    @State private var showDismissWarning = false
    @State private var isCompleted = false
    
    // flip & match
    @State private var memoryCards: [MemoryCard] = []
    @State private var flippedCards: [UUID] = [] // max 2
    @State private var matchedCards: Set<UUID> = []
    @State private var memoryRound: Int = 1
    @State private var memoryPairAmount: Int = 6
    @State private var memoryRows: Int = 4
    @State private var isPreviewing = true
    @State private var memoryInstructions: String = ""
    @State private var memoryProgress: Double = 1.0
    @State private var memoryGameComplited: Bool = false
    @State private var correctAnswers: Int = 0
    @State private var lives: Int = 5
    
    private var languageManager: LanguageManager {
        LanguageManager(settings: settings.first)
    }
    
    var userLanguage: Language {
        Language.allCases.first { $0.rawValue == settings.first?.userLanguage ?? "" } ?? .englishGB
    }

    
    var body: some View {
        VStack(spacing: 0) {
                GeometryReader { geo in
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)
                    let totalRows = memoryRows
                    let totalSpacing = CGFloat(totalRows - 1) * 12
                    let verticalPadding: CGFloat = 16
                    let cardHeight = (geo.size.height - totalSpacing - verticalPadding) / CGFloat(totalRows)
//                    GlassEffectContainer(spacing: 12) {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(memoryCards) { card in
                                CardView(card: card, isSmall: isSmall, isPad: isPad, isMany: memoryCards.count > 12)
                                    .frame(height: cardHeight)
                                    .onTapGesture {
                                        guard !isPreviewing, !memoryGameComplited else { return }
                                        handleCardTap(card)
                                    }
                                    .transition(.push(from: .bottom).combined(with: .opacity))
                            }
                        }
                        .onAppear {
                            setupMemoryGame()
                            startMemoryPreview()
                        }
                }
                

        }
        .foregroundStyle(.white)
        .padding(.top, isSmall ? 16 : 24)
        .padding(.horizontal, isPad ? 32 : 16)
        .padding(.bottom, isPad ? 16 : 0)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .safeAreaBar(edge: .top) {
                Text(memoryInstructions)
                    .font(.title3.weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.top)
                    .id(memoryInstructions)
                    .transition(.push(from: .bottom))
        }
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
            
            ToolbarItem(placement: .principal) {
                heartsDisplay
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                MemoryProgressView(correctAnswers: $correctAnswers, progress: $memoryProgress)
            }
            .sharedBackgroundVisibility(.hidden)
        }
        .onAppear {
            if let soundEnabled = settings.first?.soundEnabled, soundEnabled {
                SoundManager.playSound(named: "start2")
            }
            
            if !purchaseManager.adFreeUnlocked {
                AdManager.shared.loadInterstitial()
            }
        }
        .background(Color("GameBackground").gradient)
        .alert(
            languageManager.localizedString(for: "Exit game?"),
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
                router.popBackToSelectionOrTrainingZone()
            }
        } message: {
            Text(
                languageManager.localizedString(for: "You will lose your progress in this game.")
            )
        }
        
    }
    
    private func setupMemoryGame() {
        lives = 5
        memoryPairAmount = 6
        memoryRows = 4
        memoryRound = 1
        memoryGameComplited = false
        
        memoryInstructions = languageManager.localizedString(for: "Get ready!")
        
        let selectedSymbols = TrafficSignSymbol.allCases
            .shuffled()
            .prefix(memoryPairAmount)
        
        let pairedSymbols = Array(selectedSymbols) + Array(selectedSymbols)
        
        memoryCards = pairedSymbols
            .map { MemoryCard(symbol: $0) }
            .shuffled()
    }
    
    private func startMemoryPreview() {
        isPreviewing = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.linear(duration: 0.5)) {
                memoryProgress = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Step 2️⃣: Reveal all cards
            withAnimation(.default) {
                for index in memoryCards.indices {
                    memoryCards[index].isFlipped = true
                }
                memoryInstructions = languageManager.localizedString(for: "Memorize")
            }
            
            withAnimation(.linear(duration: 4)) {
                memoryProgress = 0.0
            }
            
            if settings.first?.soundEnabled == true {
                SoundManager.playSound(named: "longPop")
            }
            // Step 3️⃣: Keep them visible briefly
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                // Step 4️⃣: Flip cards back down
                    for index in memoryCards.indices {
                        memoryCards[index].isLoading = false
                        
                        withAnimation(.default) {
                            memoryCards[index].isFlipped = false
                        }
                    }
                withAnimation(.default) {
                    memoryInstructions = String(
                        format: languageManager.localizedString(for: "memory_round"),
                        memoryRound
                    )
                }
                
                if settings.first?.soundEnabled == true {
                    SoundManager.playSound(named: "longPop")
                }
                
                // Step 5️⃣: Start the playable phase
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.default) {
                        isPreviewing = false
                    }
                }
            }
        }
    }
    
    private func finishQuiz() {
        
        let result = QuizResult(
            quizMode: .flipAndMatch,
            country: country,
            categoryTitle: "Flip & Match",
            categorySubtitle: nil,
            gamePassed: false,
            correctAnswers: correctAnswers,
            totalQuestions: 0,
            incorrectSigns: [],
        )
        
        router.goToComplete(result: result)
    }

    
    private func handleCardTap(_ card: MemoryCard) {
        // Ignore if already matched or already flipped
        guard !card.isFlipped && !card.isMatched else { return }
        
        // First, flip back any previously flipped but unmatched cards immediately
        let currentlyFlipped = memoryCards.filter { $0.isFlipped && !$0.isMatched }
        if currentlyFlipped.count == 2 {
            for flippedCard in currentlyFlipped {
                if let idx = memoryCards.firstIndex(where: { $0.id == flippedCard.id }) {
                    memoryCards[idx].isFlipped = false
                }
            }
        }
        
        // Flip the tapped card
        if let index = memoryCards.firstIndex(where: { $0.id == card.id }) {
            memoryCards[index].isFlipped = true
        }
        
        // Track currently flipped cards again
        let updatedFlipped = memoryCards.filter { $0.isFlipped && !$0.isMatched }
        
        // Check for match if two cards are flipped
        if updatedFlipped.count == 2 {
            let first = updatedFlipped[0]
            let second = updatedFlipped[1]
            
            if first.symbol == second.symbol {
                // Matched
                withAnimation {
                    correctAnswers += 1
                }
                
                if settings.first?.soundEnabled == true {
                    SoundManager.playSound(named: "correct")
                }
                
                if let firstIndex = memoryCards.firstIndex(where: { $0.id == first.id }) {
                    memoryCards[firstIndex].isMatched = true
                }
                if let secondIndex = memoryCards.firstIndex(where: { $0.id == second.id }) {
                    memoryCards[secondIndex].isMatched = true
                }
            } else {
                // Not matched: deduct life
                heartsCountsDown = true
                withAnimation {
                    lives -= 1
                }
                
                if settings.first?.soundEnabled == true {
                    SoundManager.playSound(named: "error")
                }
                // Optionally, you can keep a short visual delay for user to see the mismatch
                let firstID = first.id
                let secondID = second.id
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    // Only flip back if both are still flipped and unmatched
                    if let firstIndex = memoryCards.firstIndex(where: { $0.id == firstID }),
                       let secondIndex = memoryCards.firstIndex(where: { $0.id == secondID }),
                       memoryCards[firstIndex].isFlipped,
                       memoryCards[secondIndex].isFlipped,
                       !memoryCards[firstIndex].isMatched,
                       !memoryCards[secondIndex].isMatched {
                        
                        withAnimation(.easeInOut(duration: 0.3)) {
                            memoryCards[firstIndex].isFlipped = false
                            memoryCards[secondIndex].isFlipped = false
                        }
                    }
                }
            }
            
            // Check for game over
            if lives <= 0 {
                memoryGameComplited = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    finishQuiz()
                }
            }
            
            // Check if all cards matched
            if memoryCards.allSatisfy({ $0.isMatched }) {
                
                memoryRound += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.default) {
                        memoryInstructions = languageManager.localizedString(for: "Get ready for next Round")
                    }
                    resetMemoryGame()
                }
            }
        } else if updatedFlipped.count == 1 {
            if settings.first?.soundEnabled == true {
                SoundManager.playSound(named: "mediumPop")
            }
        }
    }
    
    private func resetMemoryGame() {
        let soundEnabled = settings.first?.soundEnabled == true
        // Step 0: Flip all current cards down
        
        if soundEnabled {
            SoundManager.playSound(named: "shuffle")
        }
        
        for (index, card) in memoryCards.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                if let idx = memoryCards.firstIndex(where: { $0.id == card.id }) {
                    memoryCards[idx].isLoading = true
                    memoryCards[idx].isFlipped = false
                    memoryCards[idx].isMatched = false
                }
            }
        }
        
        let flipDownDelay = Double(memoryCards.count) * 0.05 + 0.1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + flipDownDelay) {
            
            // Step 1: Reshuffle original cards
            let originalCount = memoryPairAmount
            let selectedSymbols = TrafficSignSymbol.allCases.shuffled().prefix(originalCount)
            let originalPairs = Array(selectedSymbols) + Array(selectedSymbols)
            let originalCards = originalPairs.map { MemoryCard(symbol: $0) }.shuffled()
            
            memoryCards = originalCards
            
            // Step 2: Add new cards with animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if memoryRows != 6 {
                    // Step 1: Add new cards
                    let newCount = 9 - originalCount
                    let usedSymbols = Set(memoryCards.map { $0.symbol })
                    let newSymbols = TrafficSignSymbol.allCases
                        .filter { !usedSymbols.contains($0) }
                        .shuffled()
                        .prefix(newCount)
                    let newPairs = Array(newSymbols) + Array(newSymbols)
                    let newCards = newPairs.map { MemoryCard(symbol: $0) }
                    
                    withAnimation(.default) {
                        memoryRows = 6
                        memoryPairAmount = 9
                        memoryCards.append(contentsOf: newCards)
                    }
                    
                    // Step 2: Wait 0.5 seconds before continuing
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        memoryCards.shuffle() // no animation
                        heartsCountsDown = false
                        if soundEnabled {
                            SoundManager.playSound(named: "life")
                        }
                        withAnimation {
                            bounceLife.toggle()
                            lives += 3
                            memoryInstructions = languageManager.localizedString(for: "+3 Lives")
                        }
                        
                        startMemoryPreview()
                    }
                    
                } else {
                    // If rows already increased, continue immediately
                    memoryCards.shuffle() // no animation
                    heartsCountsDown = false
                    if soundEnabled {
                        SoundManager.playSound(named: "life")
                    }
                    withAnimation {
                        bounceLife.toggle()
                        lives += 3
                        memoryInstructions = languageManager.localizedString(for: "+3 Lives")
                    }
                    
                    
                    startMemoryPreview()
                }
            }
        }
    }
    
    private var heartsDisplay: some View {
        HStack(spacing: 8) {
            Image(systemName: "heart.fill")
                .foregroundColor(.accent)
                .symbolEffect(.bounce, value: bounceLife)
            
            Text("\(lives)")
                .contentTransition(.numericText(countsDown: heartsCountsDown))
                .font(.headline.weight(.bold))
                .foregroundColor(.white)
                .frame(width: 20, alignment: .center)
        }
        .frame(
            width: 90,    // roughly matches .padding(.horizontal, 16)
            height: 40    // roughly matches .padding(.vertical, 8)
        )
        .background(
            Capsule()
                .stroke(Color.white, lineWidth: 1.5)
        )
//        .transition(.scale)
//        .animation(.default, value: bounceLife)
    }
    
    
//    private func loadSignsForCurrentMode() {
//        switch quizMode {
//        case .sectionSigns:
//            if let sub = selectedSubSection {
//                signs = sub.signs.shuffled()
//            } else if let section = selectedSection {
//                signs = section.signs.shuffled()
//            } else {
//                signs = []
//            }
//        case .grandPrix, .beatTheClock, .flipAndMatch:
//            signs = allSigns.shuffled()
//        case .grandTour:
//            if let sub = selectedSubSection {
//                signs = sub.signs.shuffled()
//            } else if let section = selectedSection {
//                signs = section.signs.shuffled()
//            } else {
//                signs = []
//            }
//        }
//        
//        remainingSigns = signs
//    }
    
//    private func loadNewQuestion() {
//        selected = nil
//        isAnswered = false
//        
//        print("🔄 Loading next question... remainingSigns: \(remainingSigns.count)")
//        
//        guard let nextSign = remainingSigns.popLast() else {
//            print("✅ No more signs, quiz complete.")
//            currentSign = nil
//            currentImage = nil
//            options = []
//            finishQuiz()
//            return
//        }
//        
//        currentSign = nextSign
//        
//        if nextSign.imageData.isEmpty {
//            currentImage = nil
//            let template = languageManager.localizedString(for: "no_images_available")
//            currentImageErrorMessage = String(format: template, nextSign.title(for: userLanguage.rawValue))
//        } else if let idx = nextSign.imageData.indices.randomElement() {
//            currentImage = nextSign.imageData[idx]
//            currentImageErrorMessage = nil
//        } else {
//            currentImage = nil
//            let template = languageManager.localizedString(for: "failed_to_load_image")
//            currentImageErrorMessage = String(format: template, nextSign.title(for: userLanguage.rawValue))
//        }
//        
//        // Create wrong answers
//        let wrongTitles = Array(nextSign.wrongAnswers(for: userLanguage.rawValue).shuffled().prefix(3))
//        let wrong = wrongTitles.map { title in
//            TrafficSignEntity(
//                id: UUID().uuidString,
//                index: 0,
//                difficulty: 0,
//                imageData: [],
//                language: [userLanguage.rawValue: SignLanguageContent(
//                    title: title,
//                    details: "",
//                    wrongAnswers: [],
//                    sectionName: "",
//                    subSectionName: nil
//                )]
//            )
//        }
//        
//        options = (wrong + [nextSign]).shuffled()
//        
//        if quizMode == .grandPrix {
//            startQuestionTimer()
//        } else if quizMode == .beatTheClock {
//            if quizMode == .beatTheClock, globalTimer == nil {
//                startTimeChallengeTimer()
//            }
//        }
//        
//        options = (wrong + [nextSign]).shuffled()
//    }
    

    
    func triggerHaptic(success: Bool) {
        if let hapticsEnabled = settings.first?.hapticsEnabled, hapticsEnabled {
            hapticGenerator.notificationOccurred(success ? .success : .error)
        }
    }
    
}




enum TrafficSignSymbol: String, CaseIterable, Identifiable {
    case parkingsignCircle = "parkingsign.circle"
    case carRearHazardsign = "car.rear.hazardsign"
    case hazardsign = "hazardsign"
    case yieldsign = "yieldsign"
    case wrongwaysign = "wrongwaysign"
    case figureWalkDiamond = "figure.walk.diamond"
    case arrowTriangleheadTurnUpRightDiamond = "arrow.trianglehead.turn.up.right.diamond"
    case dropTriangle = "drop.triangle"
    case exclamationmarkTriangle = "exclamationmark.triangle"
    case figureWalkTriangle = "figure.walk.triangle"
    case dropCircle = "drop.circle"
    case flameCircle = "flame.circle"
    case airplaneCircle = "airplane.circle"
    case carCircle = "car.circle"
    case tramCircle = "tram.circle"
    case bicycleCircle = "bicycle.circle"
    case fuelpumpCircle = "fuelpump.circle"
    case twoHCircle = "2h.circle"
    case fourHCircle = "4h.circle"
    case crossCircle = "cross.circle"
    case hareCircle = "hare.circle"
    case tortoiseCircle = "tortoise.circle"
    case exclamationmarkCircle = "exclamationmark.circle"
    case twentyCircle = "20.circle"
    case thirtyCircle = "30.circle"
    case fortyCircle = "40.circle"
    case fiftyCircle = "50.circle"
    case figureWalkCircle = "figure.walk.circle"
    case figureWaveCircle = "figure.wave.circle"
    case figureRollCircle = "figure.roll.circle"
    case figureSkiingCrosscountryCircle = "figure.skiing.crosscountry.circle"
    case figureOutdoorCycleCircle = "figure.outdoor.cycle.circle"
    case arrowUpLeftCircle = "arrow.up.left.circle"
    case arrowUpRightCircle = "arrow.up.right.circle"
    case arrowDownLeftCircle = "arrow.down.left.circle"
    case arrowDownRightCircle = "arrow.down.right.circle"
    case arrowUturnLeftCircle = "arrow.uturn.left.circle"
    case arrowUturnRightCircle = "arrow.uturn.right.circle"
    case arrowUturnUpCircle = "arrow.uturn.up.circle"
    case arrowUturnDownCircle = "arrow.uturn.down.circle"
    case arrowTriangleheadTurnUpRightCircle = "arrow.trianglehead.turn.up.right.circle"
    case snowflakeCircle = "snowflake.circle"
    case tornadoCircle = "tornado.circle"
    
    var id: String { rawValue }
}

struct MemoryCard: Identifiable, Equatable {
    let id = UUID()
    let symbol: TrafficSignSymbol
    var isFlipped: Bool = false
    var isMatched: Bool = false
    var isLoading: Bool = true
}


struct CardView: View {
    var card: MemoryCard
    var isSmall: Bool
    var isPad: Bool
    var isMany: Bool
    @State private var flipped = false
    
    var body: some View {
        ZStack {
            // Front of the card (symbol)
            VStack {
                if card.isFlipped || card.isMatched {
                    Image(systemName: card.symbol.rawValue)
                        .resizable()
                        .scaledToFit()
                        .fontWeight(.semibold)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, .accent)
                        .padding((isPad && !isMany) ? 32 : isSmall ? 8 : 16)
                        
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
//            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
            .opacity(flipped ? 1 : 0)
            
            // Back of the card (question mark)
            VStack {
                Image(systemName: card.isLoading ? "hourglass.circle" : "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.5))
                    .padding((isPad && !isMany) ? 32 : isSmall ? 8 : 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
            .opacity(flipped ? 0 : 1)
        }
//        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
        .rotation3DEffect(
            .degrees(flipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 12))
//        .animation(.default, value: flipped)
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: flipped)
        .onChange(of: card.isFlipped) { _, newValue in
            flipped = newValue
        }
    }
}

struct MemoryProgressView: View {
    @Binding var correctAnswers: Int
    @Binding var progress: Double  // 0 = empty, 1 = full
    
    var body: some View {
        ZStack {
            // Background track
            Circle()
                .stroke(Color.white.opacity(0.3), lineWidth: 5)
            
            // Foreground progress
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            // Overlay text
            Text("\(correctAnswers)")
                .font(.headline.weight(.bold))
                .foregroundColor(.white)
                .contentTransition(.numericText(countsDown: false))
        }
        .frame(width: 40, height: 40)
    }
}


//struct TranslatedSectionText: View {
//    let sign: TrafficSignEntity
//    let effectiveLanguage: Language
//    let userLanguage: Language
//    @State var translatedSectionTitle = ""
//
//    var body: some View {
//        Text(translatedSectionTitle)
//            .font(.subheadline.weight(.medium))
//            .foregroundStyle(.white)
//            .opacity(0.8)
//            .id(sign.sectionName(for: effectiveLanguage.rawValue))
//            .transition(.push(from: .trailing).combined(with: .opacity))
//            .translationTask(
//                TranslationSession.Configuration(
//                    source: Locale.Language(identifier: effectiveLanguage.rawValue),
//                    target: Locale.Language(identifier: userLanguage.rawValue)
//                )
//            ) { session in
//                guard effectiveLanguage != userLanguage else {
//                    await MainActor.run {
//                        translatedSectionTitle = sign.sectionName(for: userLanguage.rawValue)
//                        print("Section No Translation for: \(translatedSectionTitle)")
//                    }
//                    return
//                }
//                let originalText = sign.sectionName(for: effectiveLanguage.rawValue)
//                do {
//                    let result = try await session.translate(originalText)
//                    await MainActor.run {
//                        translatedSectionTitle = result.targetText
//                        print("Section Translation: \(result.targetText)")
//                    }
//                } catch {
//                    print("Translation failed for \(originalText): \(error)")
//                }
//            }
//    }
//
//}
