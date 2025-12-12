//
//  GameViewModel.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 19/11/25.
//

import Foundation
import Combine
import SwiftUI
import AudioToolbox


class GameViewModel: ObservableObject {
    
    let quizMode: QuizMode
    let initialLives: Int?
    
    // MARK: - Shared State
    @Published var gameSigns: [TrafficSignEntity] = []
    @Published var currentSign: TrafficSignEntity?
    @Published var currentImage: Data?
    @Published var currentImageErrorMessage: String?
    @Published var selectedAnswer: String?
    @Published var titleOptions: [String] = []
    @Published var isAnswered = false
    @Published var correctAnswers: Int = 0
    @Published var incorrectSigns: [TrafficSignEntity] = []
    @Published var lives: Int? = nil
    @Published var heartsCountsDown: Bool = true
    @Published var triggerSuccessFeedback = false
    @Published var triggerErrorFeedback = false
    @Published var isGameOver: Bool = false
    @Published var gamePassed: Bool = false
    
    @Published var timeIsUp: Bool = false
    
    // MARK: - Initialization
    init(quizMode: QuizMode, initialLives: Int? = nil) {
        self.quizMode = quizMode
        self.initialLives = initialLives
    }
    
    // MARK: - Public Methods
    func startGame(with signs: [TrafficSignEntity], languageManager: LanguageManager, languageCode: String, soundEnabled: Bool) {
        gameSigns = signs.shuffled()
        
        if soundEnabled {
            SoundManager.playSound(named: "start2")
        }
        
        if let firstSign = gameSigns.first {
            currentSign = firstSign
            loadImage(languageManager: languageManager, languageCode: languageCode)
            titleOptions = generateTitleOptions(for: firstSign, languageCode: languageCode)
        }
        
        lives = initialLives
        correctAnswers = 0
        incorrectSigns = []
        isAnswered = false
        selectedAnswer = nil
        gamePassed = false
    }
    
    func handleAnswer(for option: String, languageManager: LanguageManager, languageCode: String, soundEnabled: Bool, hapticsEnabled: Bool) {
        guard let currentSign = currentSign, !isAnswered else { return }
        
        let correctTitle = currentSign.title(for: languageCode)
        
        selectedAnswer = option
        isAnswered = true
        
        if option == correctTitle {
            correctAnswers += 1
            if soundEnabled{
                SoundManager.playSound(named: "correct")
            }
            if hapticsEnabled{
                triggerSuccessFeedback.toggle()
            }
            
            print("✅ Correct! Sign: \(currentSign.title(for: languageCode))")
        } else {
            incorrectSigns.append(currentSign)
            heartsCountsDown = true
            
            if lives != nil {
                lives! -= 1
            }
            
            if soundEnabled{
                SoundManager.playSound(named: "error")
            }
            if hapticsEnabled {
                triggerErrorFeedback.toggle()
            }
            print("❌ Incorrect! Selected: \(option), Correct: \(correctTitle)")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (quizMode == .beatTheClock ? 1 : 2)) {
            self.nextQuestion(languageManager:languageManager, languageCode: languageCode)
        }
    }
    
    func nextQuestion(languageManager: LanguageManager, languageCode: String) {
        guard let currentIndex = gameSigns.firstIndex(where: { $0.id == currentSign?.id }) else { return }
        let nextIndex = currentIndex + 1
        print("Running nextQuestion, nextIndex: \(nextIndex)")
        if let lives, lives < 1 {
            endGame()
        } else if nextIndex < gameSigns.count, !timeIsUp {
            currentSign = gameSigns[nextIndex]
            loadImage(languageManager: languageManager, languageCode: languageCode)
            titleOptions = generateTitleOptions(for: currentSign!, languageCode: languageCode)
            isAnswered = false
            selectedAnswer = nil
        } else {
            if quizMode == .grandTour {
                gamePassed = true
            } else if nextIndex == gameSigns.count {
                gamePassed = true
            }
            endGame()
        }
    }
    
    func loadImage(languageManager: LanguageManager, languageCode: String) {
        guard let currentSign = currentSign else { return }
        
        if currentSign.imageData.isEmpty {
            currentImage = nil
            let template = languageManager.localizedString(for: "no_images_available")
            currentImageErrorMessage = String(format: template, currentSign.title(for: languageCode))
        } else if let idx = currentSign.imageData.indices.randomElement() {
            currentImage = currentSign.imageData[idx]
            currentImageErrorMessage = nil
        } else {
            currentImage = nil
            let template = languageManager.localizedString(for: "failed_to_load_image")
            currentImageErrorMessage = String(format: template, currentSign.title(for: languageCode))
        }
    }
    
    // MARK: - Private Methods
    private func generateTitleOptions(for sign: TrafficSignEntity, languageCode: String) -> [String] {
        let correctTitle = sign.title(for: languageCode)
        let wrongAnswers = sign.wrongAnswers(for: languageCode).prefix(3)
        
        let options = [correctTitle] + Array(wrongAnswers)
        return options.shuffled()
    }
    
    func endGame(after seconds: Double = 0.0) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.isGameOver = true
        }
    }
    
    func handleGrandPrixTimeout(languageManager: LanguageManager, languageCode: String, soundEnabled: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [self] in
            if soundEnabled {
                SoundManager.playSound(named: "error")
            }
            
            heartsCountsDown = true
            isAnswered = true
            withAnimation {
                if lives != nil {
                    lives! -= 1
                }
            }
            if lives != nil, lives! <= 0 {
                self.endGame(after: 2.0)
                return
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation { self.nextQuestion(languageManager: languageManager, languageCode: languageCode) }
        }
    }
}
