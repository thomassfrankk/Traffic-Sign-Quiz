////
////  QuizCompleteView.swift
////  Trafikkskilt Quiz
////
////  Created by Thomas Frank on 23/9/25.
////
//
//import SwiftUI
//import SwiftData
//import StoreKit
//
//struct TestView: View {
//    
//    let result: QuizResult
//    
////    @EnvironmentObject var router: NavigationRouter
//    
//    // Computed properties for convenience
//    private var quizMode: QuizMode { result.quizMode }
//    private var country: Country { result.country }
//    private var categoryTitle: String { result.categoryTitle }
//    private var categorySubtitle: String? { result.categorySubtitle }
//    private var correctAnswers: Int { result.correctAnswers }
//    private var totalQuestions: Int { result.totalQuestions }
//    private var incorrectSigns: [TrafficSignEntity] { result.incorrectSigns }
//    
//    @State private var showReview: Bool = false
//    
////    @EnvironmentObject var purchaseManager: PurchaseManager
////    @Environment(\.modelContext) private var context
////    @Environment(\.isPad) private var isPad
////    @Environment(\.isSmall) private var isSmall
////    @Environment(\.dismiss) private var dismiss
//    
////    @Query private var settings: [GameSettings]
//    
//    @State private var newScore: Int = 0
//    @State private var showResults = true
//    @State private var adShown = false
//    @State private var highScoreMessage: String? = nil
//    
//    
//    private var score: Int {
//        guard result.totalQuestions > 0 else { return 0 }
//        return Int((Double(result.correctAnswers) / Double(result.totalQuestions)) * 100)
//    }
//    
//    
//    var body: some View {
//        VStack(spacing: 0) {
//            Text("Game Over")
//            .font(.custom("SairaStencilOne-Regular", size: 80))
//            .lineLimit(1)
//            .minimumScaleFactor(0.5)
//            .foregroundStyle(.white)
//            .brightness(0.05)
//            .padding(.horizontal)
//            .layoutPriority(1)
//            
//            
//            if let subtitle = categorySubtitle {
//                Text(subtitle)
//                    .font(.custom("SairaStencilOne-Regular", size: 22))
//                    .tracking(1)
//                
//                Text(categoryTitle)
//                    .font(.custom("SairaStencilOne-Regular", size: 20))
//                    .opacity(0.6)
//                    .tracking(1)
//                
//            } else {
//                Text(categoryTitle)
//                    .font(.custom("SairaStencilOne-Regular", size: 22))
//                    .tracking(1)
//            }
////            
//            if showResults {
//                Spacer(minLength: 16)
//                
//                VStack(spacing: 0) {
//                    
//                    
//                    // Display only number of correct answers
//                    Text(scoreText())
//                        .font(.custom("SairaStencilOne-Regular", size: 80))
//                        .tracking(4)
//                        .contentTransition(.numericText(countsDown: false))
//                        .onAppear {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                withAnimation {
//                                    // trigger any animation if needed
//                                }
//                            }
//                        }
//                    Text(LocalizationHelper.localizedString(for: quizMode == .practiseSigns ?
//                                                            "\(correctAnswers) out of \(totalQuestions) signs correct" :
//                                                                "Correct Signs", country: country.rawValue))
//                        .font(.title3)
//                        .fontWeight(.medium)
//                        .tracking(1)
//                    
//                    Text(LocalizationHelper.localizedString(for: "NEW HIGH SCORE", country: country.rawValue))
////                    FlashingText(text: "NEW HIGH SCORE")
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                        .tracking(1)
////                        .opacity(0.6)
//                        .padding(.top)
//                }
//                .padding([.horizontal, .bottom], 32)
//                .frame(maxWidth: .infinity)
//                .foregroundStyle(.white)
//                .background(
//                    RoundedRectangle(cornerRadius: 20, style: .continuous)
//                        .fill(Color.white.opacity(0.15))
//                )
//                
//                
//                Spacer(minLength: 16)
//                Spacer(minLength: 16)
//                
//                VStack(spacing: 20) {
//                    
////                    if !incorrectSigns.isEmpty {
//                        Button {
////                            showReview = true
//                        } label: {
//                            Text(LocalizationHelper.localizedString(for: "Review Mistakes", country: country.rawValue))
//                                .font(.custom("SairaStencilOne-Regular", size: 22))
//                                .tracking(1)
//                            //                                .frame(maxWidth: .infinity)
//                        }
//                        .buttonStyle(.plain)
////                    }
//                    
//                    Button {
////                        router.pop() // remove complete view
//                    } label: {
//                        Text(LocalizationHelper.localizedString(for: "Try Again", country: country.rawValue))
//                            .font(.custom("SairaStencilOne-Regular", size: 32))
//                            .tracking(1)
//                            .frame(maxWidth: .infinity)
////                            .padding(.vertical, isSmall ? 3 : 6)
//                    }
//                    .tint(.accent)
//                    .foregroundStyle(.white)
//                    .buttonStyle(.borderedProminent)
//                    .controlSize(.extraLarge)
//                    
//                    
//                    
//                    
//                    Button {
////                        router.pop(2)
//                    } label: {
//                        Text(LocalizationHelper.localizedString(for: "Exit quiz", country: country.rawValue))
//                            .font(.custom("SairaStencilOne-Regular", size: 22))
//                            .tracking(1)
//                            .frame(maxWidth: .infinity)
//                    }
//                    .buttonStyle(.bordered)
//                    .controlSize(.large)
//                }
//                .tint(.primary)
////                .padding(.bottom, (isSmall || isPad) ? 16 : 0)
//                //                .padding(.horizontal)
//            } else {
//                Spacer()
//            }
//        }
//        .foregroundStyle(.white)
//        .padding(.horizontal)
//        .navigationBarBackButtonHidden(true)
//        .frame(maxWidth: .infinity)
//        .background(Color("GameBackground").gradient)
////        .navigationDestination(isPresented: $showReview) {
////            IncorrectSignsView(
////                incorrectSigns: incorrectSigns,
////                country: country
////            )
////        }
////        .onAppear {
////            if !adShown {
////                adShown = true
//////                if purchaseManager.adFreeUnlocked {
//////                    withAnimation {
//////                        saveAndCheckHighScore()
//////                        showResults = true
//////                        if let soundEnabled = settings.first?.soundEnabled, soundEnabled, score >= 50 {
//////                            SoundManager.playSound(named: "tada")
//////                        }
//////                    }
//////                } else {
//////                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//////                        AdManager.shared.showAd {
//////                            withAnimation {
//////                                saveAndCheckHighScore()
//////                                showResults = true
//////                                
//////                                if let soundEnabled = settings.first?.soundEnabled, soundEnabled, score >= 50 {
//////                                    SoundManager.playSound(named: "tada")
//////                                }
//////                            }
//////                        }
//////                    }
//////                }
////            }
////        }
//    }
//    
//    func scoreText() -> String {
//        switch quizMode {
//        case .practiseSigns:
//            let percentage = totalQuestions > 0
//            ? Int((Double(correctAnswers) / Double(totalQuestions)) * 100)
//            : 0
//            return "\(percentage)%"
//            
//        default:
//            return "\(correctAnswers)"
//        }
//    }
//    
////    func maybeRequestReview() {
////        guard let scene = UIApplication.shared.connectedScenes
////            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
////            return
////        }
////        
////        AppStore.requestReview(in: scene)
////    }
//    
//    // MARK: - High score logic
////    private func saveAndCheckHighScore() {
////        guard let settings = settings.first else { return }
////        let countryScores = settings.scores(for: country.rawValue)
////        
////        var isNewHigh = false
////        var best: Int = 0
////        
////        if quizMode == .timeChallenge {
////            guard let minutes = timeLength else { return }
////            best = countryScores.bestScore(for: minutes)
////            if correctAnswers > best {
////                countryScores.updateTimeAttackScore(for: minutes, newScore: correctAnswers)
////                try? context.save()
////                isNewHigh = true
////            }
////        } else if quizMode == .practiseSigns {
////            if let sub = categorySubtitle {
////                // ✅ Subcategory quiz
////                best = countryScores.bestScore(for: categoryTitle, subSection: sub)
////                if score > best {
////                    countryScores.updateSubSectionScore(for: categoryTitle, subSection: sub, newScore: score)
////                    try? context.save()
////                    isNewHigh = true
////                }
////            } else {
////                // ✅ Category-level quiz
////                best = countryScores.bestScore(for: categoryTitle)
////                if score > best {
////                    countryScores.updateSectionScore(for: categoryTitle, newScore: score)
////                    try? context.save()
////                    isNewHigh = true
////                }
////            }
////        }
////        
////        if quizMode == .practiseSigns {
////            highScoreMessage = isNewHigh
////            ? LocalizationHelper.localizedString(for: "New High Score!", country: country.rawValue)
////            : "\(LocalizationHelper.localizedString(for: "High Score:", country: country.rawValue)) \(best)%"
////        } else {
////            highScoreMessage = isNewHigh
////            ? LocalizationHelper.localizedString(for: "New High Score!", country: country.rawValue)
////            : "\(LocalizationHelper.localizedString(for: "High Score:", country: country.rawValue)) \(best)"
////        }
////    }
//}
//
//#Preview {
//    let mockResult = QuizResult(
//        quizMode: .timeChallenge, // replace with a valid QuizMode case
//        country: .usa,
//        categoryTitle: "Road Signs",
//        categorySubtitle: "Basic Road Signs",
//        correctAnswers: 7,
//        totalQuestions: 10,
//        incorrectSigns: [], // empty array or mock TrafficSignEntity
//    )
//    
//    TestView(result: mockResult)
//}
