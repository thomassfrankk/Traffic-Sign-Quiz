//
//  QuizGameView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 23/9/25.
//

import SwiftUI
import GoogleMobileAds

struct QuizGameView: View {
    let quizMode: QuizMode
    let signs: [TrafficSign]
    let title: String
    let showProgress: Bool
    let timeLegnth: Int?   // in minutes
    let country: Country
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var showDismissWarning = false
    @State private var isCompleted = false
    @State private var correctAnswers = 0
    
    @State private var remainingSigns: [TrafficSign] = []
    @State private var currentSign: TrafficSign?
    @State private var currentImage: String?
    @State private var options: [TrafficSign] = []
    @State private var selected: TrafficSign?
    @State private var isAnswered = false
    @State private var shakeTrigger: CGFloat = 0
    
    // ⏱ Timer state
    @State private var remainingSeconds: Int = 0
    @State private var timer: Timer?
    
    private let hapticGenerator = UINotificationFeedbackGenerator()
    
    var body: some View {
        Group {
            if isCompleted {
                QuizCompleteView(
                    quizMode: quizMode,
                    title: title,
                    correctAnswers: correctAnswers,
                    totalQuestions: signs.count,
                    timeLength: timeLegnth,
                    onRestart: restartQuiz,
                    onExit: { dismiss() }
                )
            } else {
                VStack(spacing: 0) {
                    if let sign = currentSign, let imageName = currentImage {
                        VStack {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .id(imageName)
                                .transition(.push(from: .trailing).combined(with: .opacity))
                                .cornerRadius(5)
                                .shadow(radius: 4)
                                .padding(32)
                            
                            if quizMode != .allSigns {
                                Text(sign.section)
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                                    .padding(.top, -16)
                                    .id(imageName)
                                    .transition(.push(from: .trailing).combined(with: .opacity))
                                    .padding(.bottom)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .padding(.bottom)
                        .onAppear {
                            hapticGenerator.prepare()
                        }
                        
                        // Options
                        VStack(spacing: 16) {
                            ForEach(options) { option in
                                Button {
                                    if !isAnswered {
                                        selected = option
                                        isAnswered = true
                                        handleAnswer(for: option, correct: sign)
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + (quizMode == .timeChallange ? 1 : 2)) {
                                            withAnimation {
                                                loadNewQuestion()
                                            }
                                        }
                                    }
                                } label: {
                                    let isWrongSelected = option.id == selected?.id && option.id != currentSign?.id
                                    let optionColor = colorForOption(option)
                                    Text(option.title)
                                        .font(.headline)
                                        .foregroundStyle(.primary)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(optionColor)
                                        )
                                        .modifier(ShakeEffect(animatableData: isWrongSelected ? shakeTrigger : 0))
                                }
                                .tint(.primary)
                                .disabled(isAnswered)
                            }
                        }
                        .id(currentSign?.id)
                        .transition(.opacity)
                    }
                }
                .padding()
                .background(.regularMaterial)
                .navigationTitle(
                    LocalizationHelper.localizedString(for: title, country: country.rawValue)
                )
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showDismissWarning = true
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                    
                    // ✅ Progress counter
                    if showProgress {
                        ToolbarItem(placement: .topBarTrailing) {
                            HStack(spacing: 4) {
                                Text("\(signs.count - remainingSigns.count)")
                                    .contentTransition(.numericText(countsDown: false))
                                Text("/")
                                Text("\(signs.count)")
                            }
                            .font(.headline.monospacedDigit().weight(.semibold))
                        }
                        .sharedBackgroundVisibility(.hidden)
                    }
                    
                    // ⏱ Countdown for Time Challenge
                    if quizMode == .timeChallange {
                        ToolbarItem(placement: .topBarTrailing) {
                            Text(formattedTime)
                                .contentTransition(.numericText(countsDown: true))
                                .font(.headline.monospacedDigit().weight(.semibold))
                                .foregroundColor(remainingSeconds <= 10 ? .red : .primary)
                        }
                        .sharedBackgroundVisibility(.hidden)
                    }
                }
                .onAppear {
                    if remainingSigns.isEmpty {
                        remainingSigns = signs.shuffled()
                        loadNewQuestion()
                    }
                    
                    if quizMode == .timeChallange, let timeLegnth {
                        startTimer(minutes: timeLegnth)
                    }
                    AdManager.shared.loadInterstitial()
                }
                .onDisappear {
                    timer?.invalidate()
                }
                .alert(
                    LocalizationHelper.localizedString(for: "Exit quiz?", country: country.rawValue),
                    isPresented: $showDismissWarning
                ) {
                    Button(
                        LocalizationHelper.localizedString(for: "Cancel", country: country.rawValue),
                        role: .cancel
                    ) {}
                    
                    Button(
                        LocalizationHelper.localizedString(for: "Exit", country: country.rawValue),
                        role: .destructive
                    ) {
                        dismiss()
                    }
                } message: {
                    Text(
                        LocalizationHelper.localizedString(for: "You will lose your progress in this quiz.", country: country.rawValue)
                    )
                }
            }
        }
    }
    
    // MARK: - Helpers
    
    private var formattedTime: String {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer(minutes: Int) {
        remainingSeconds = minutes * 60
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                timer?.invalidate()
//                AdManager.shared.showAd()
                isCompleted = true
            }
        }
    }
    
    private func loadNewQuestion() {
        selected = nil
        isAnswered = false
        
        if let nextSign = remainingSigns.popLast() {
            currentSign = nextSign
            currentImage = nextSign.images.randomElement()
            
            let wrongTitles = Array(nextSign.wrongAnswers.shuffled().prefix(3))
            let wrong = wrongTitles.map {
                TrafficSign(
                    title: $0,
                    section: "",
                    description: "",
                    images: [],
                    wrongAnswers: []
                )
            }
            options = (wrong + [nextSign]).shuffled()
        } else {
            currentSign = nil
            currentImage = nil
            options = []
//            AdManager.shared.showAd()
            isCompleted = true
        }
    }
    
    private func restartQuiz() {
        correctAnswers = 0
        remainingSigns = signs.shuffled()
        isCompleted = false
        loadNewQuestion()
        
        if quizMode == .timeChallange, let timeLegnth {
            startTimer(minutes: timeLegnth)
        }
    }
    
    private func handleAnswer(for option: TrafficSign, correct sign: TrafficSign) {
        if option.id == sign.id {
            correctAnswers += 1
            SoundManager.playSound(named: "correct")
            triggerHaptic(success: true)
        } else {
            SoundManager.playSound(named: "error")
            triggerHaptic(success: false)
            withAnimation(.default) {
                shakeTrigger += 1
            }
        }
    }
    
    private func colorForOption(_ option: TrafficSign) -> Color {
        guard isAnswered, let correct = currentSign else {
            return colorScheme == .dark ? Color.white.opacity(0.15) : Color.gray.opacity(0.2)
        }
        if option.id == correct.id {
            return Color.green
        }
        if option.id == selected?.id {
            return Color.red
        }
        return colorScheme == .dark ? Color.white.opacity(0.15) : Color.gray.opacity(0.2)
    }
    
    func triggerHaptic(success: Bool) {
        hapticGenerator.notificationOccurred(success ? .success : .error)
    }
    
}

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                              y: 0)
        )
    }
}
