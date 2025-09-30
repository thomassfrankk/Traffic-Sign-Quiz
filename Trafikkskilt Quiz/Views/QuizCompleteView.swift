//
//  QuizCompleteView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 23/9/25.
//

import SwiftUI
import SwiftData

struct QuizCompleteView: View {
    let quizMode: QuizMode
    let title: String
    let correctAnswers: Int
    let totalQuestions: Int
    let timeLength: Int?
    let onRestart: () -> Void
    let onExit: () -> Void
    
    @Environment(\.modelContext) private var context
    @Query private var settings: [GameSettings]
    
    @State private var newScore: Int = 0
    @State private var showResults = false
    @State private var adShown = false
    @State private var highScoreMessage: String? = nil
    
    private var country: String {
        settings.first?.selectedCountry ?? "Norway" // 👈 fallback if empty
    }
    
    private var score: Int {
        guard totalQuestions > 0 else { return 0 }
        return Int((Double(correctAnswers) / Double(totalQuestions)) * 100)
    }
    
    private var feedback: String {
        switch score {
        case 90...100:
            return LocalizationHelper.localizedString(for: "Traffic Master", country: country)
        case 70..<90:
            return LocalizationHelper.localizedString(for: "Highway Hero", country: country)
        case 50..<70:
            return LocalizationHelper.localizedString(for: "Learner Driver", country: country)
        default:
            return LocalizationHelper.localizedString(for: "Back to Driving School", country: country)
        }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text(quizMode == .timeChallange ? LocalizationHelper.localizedString(for: "Time’s Up!", country: country) : LocalizationHelper.localizedString(for: "Quiz Complete", country: country))
                .font(.system(size: 60, weight: .black, design: .default))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundStyle(.primary)
                .padding(.horizontal)
                .padding(.top, 48)
            
            Text(title)
                .font(.title2.bold())
            
            if showResults {
                Spacer()
                
                if quizMode == .timeChallange {
                    VStack(spacing: 12) {
                        Text(LocalizationHelper.localizedString(for: "You answered", country: country))
                            .font(.title3.weight(.medium))
                        Text("\(newScore)")
                            .contentTransition(.numericText(countsDown: false))
                            .font(.system(size: 72, weight: .heavy, design: .rounded))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        newScore = self.correctAnswers
                                    }
                                }
                            }
                        Text(LocalizationHelper.localizedString(for: "questions correctly", country: country))
                            .font(.title3.weight(.medium))
                        
                        if let highScoreMessage {
                            Text(highScoreMessage)
                                .font(.headline)
                                .foregroundStyle(.secondary)
                                .padding(.top)
                        }
                    }
                    .padding(32)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.blue.mix(with: .black, by: 0.3))
                            
                            ConcentricRectangle(corners: .concentric(minimum: 4))
                                .stroke(Color.white, lineWidth: 4)
                                .padding(8)
                        }
                        
                        
                    )
                    .containerShape(.rect(cornerRadius: 20, style: .continuous)) // 👈 important
                    .padding(.horizontal)
                    
                } else {
                    VStack(spacing: 12) {
                        HStack(alignment: .lastTextBaseline) {
                            Text("\(newScore)")
                                .font(.system(size: 72, weight: .heavy, design: .rounded))
                                .contentTransition(.numericText(countsDown: false))
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation {
                                            newScore = self.score
                                        }
                                    }
                                }
                            
                            Text("%")
                                .font(.system(size: 28, weight: .heavy, design: .rounded))
                        }
                        
                        Text("\(correctAnswers)/\(totalQuestions) \(LocalizationHelper.localizedString(for: "correct", country: country))")
                            .font(.title3.weight(.bold))
                            .opacity(newScore == score ? 1 : 0)
                        
                        if quizMode == .allSigns, let highScoreMessage {
                            Text(highScoreMessage)
                                .font(.headline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Divider()
                            .overlay(.white)
                            .padding(.vertical, 8)
                            .opacity(newScore == score ? 1 : 0)
                        
                        Text(feedback)
                            .font(.title.weight(.bold))
                            .opacity(newScore == score ? 1 : 0)
                    }
                    .padding(32)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(
                        ZStack {
                            if score >= 90 {
                                // 90–100% → Green
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.green.mix(with: .black, by: 0.15))
                            } else if score >= 70 {
                                // 70–89% → Blue
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.blue.mix(with: .black, by: 0.3))
                            } else if score >= 50 {
                                // 50–69% → Orange
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.brown.mix(with: .black, by: 0.1))
                            } else {
                                // Below 50% → Red
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color.red.mix(with: .black, by: 0.1))
                            }
                            
                            
                            // Inset white border
                            ConcentricRectangle(corners: .concentric(minimum: 4))
                                .stroke(Color.white, lineWidth: 4)
                                .padding(8)
                        }
                    )
                    .containerShape(.rect(cornerRadius: 20, style: .continuous)) // 👈 important
                    .padding(.horizontal)
                }
                
                Spacer()
                Spacer()
                
                VStack(spacing: 20) {
                    Button { onRestart() } label: {
                        Text(LocalizationHelper.localizedString(for: "Try Again", country: country))
                            .font(.title3.weight(.bold))
                            .textCase(.uppercase)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 4)
                    }
                    .foregroundStyle(Color(UIColor.systemBackground))
                    .buttonStyle(.glassProminent)
                    .controlSize(.large)
                    
                    Button { onExit() } label: {
                        Text(LocalizationHelper.localizedString(for: "Exit quiz", country: country))
                            .font(.subheadline.weight(.medium))
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.plain)
                    .controlSize(.large)
                }
                .tint(.primary)
                .padding(.horizontal)
            } else {
                Spacer()
            }
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        .onAppear {
            if !adShown {
                adShown = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    AdManager.shared.showAd(completion: {
                        withAnimation {
                            saveAndCheckHighScore()
                            showResults = true
                        }
                    })
                }
            }
        }
    }
    
    // MARK: - High score logic
    private func saveAndCheckHighScore() {
        guard let settings = settings.first else { return }
        let countryScores = settings.scores(for: country)
        
        var isNewHigh = false
        var best: Int = 0
        
        if quizMode == .timeChallange {
            guard let minutes = timeLength else { return }
            best = countryScores.bestScore(for: minutes)
            if correctAnswers > best {
                countryScores.updateTimeAttackScore(for: minutes, newScore: correctAnswers)
                try? context.save()
                isNewHigh = true
            }
        } else if quizMode == .allSigns {
            best = countryScores.bestScore(for: title)
            if score > best {
                countryScores.updateSectionScore(for: title, newScore: score)
                try? context.save()
                isNewHigh = true
            }
        }
        
        if quizMode == .allSigns {
            highScoreMessage = isNewHigh ? LocalizationHelper.localizedString(for: "New High Score!", country: country) : "\(LocalizationHelper.localizedString(for: "High Score:", country: country)) \(best)%"
        } else {
            highScoreMessage = isNewHigh ? LocalizationHelper.localizedString(for: "New High Score!", country: country) : "\(LocalizationHelper.localizedString(for: "High Score:", country: country)) \(best)"
        }
    }
}

#Preview {
    NavigationStack {
        QuizCompleteView(
            quizMode: .regular,
            title: "25 signs",
            correctAnswers: 18,
            totalQuestions: 25,
            timeLength: nil,
            onRestart: {
                print("Restart tapped")
            },
            onExit: {
                print("Exit tapped")
            }
        )
    }
}
