//
//  NavigationRouter.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 5/11/25.
//

import SwiftUI
import Combine
import Translation


enum QuizDestination: Hashable {
    case intro(QuizMode, Country, sectionID: String?, subSectionID: String?, sectionTitle: String?, subsectionTitle: String?)
    case selection(Country)
    case quiz(QuizMode, Country, sectionID: String?, subSectionID: String?, sectionTitle: String?, subsectionTitle: String?, initialLives: Int?)
    case flipAndFlop(Country)
    case quizComplete(QuizResult)
    case trainingZone(Country)
    case learnSigns(section: TrafficSectionEntity, title: String)
}

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    @Published var destinations: [QuizDestination] = []
    
    func goToQuizIntro(mode: QuizMode, country: Country, sectionID: String?, subSectionID: String?, sectionTitle: String?, subsectionTitle: String?) {
        let destination = QuizDestination.intro(mode, country, sectionID: sectionID, subSectionID: subSectionID, sectionTitle: sectionTitle, subsectionTitle: subsectionTitle)
        destinations.append(destination)
        path.append(destination)
    }
    
    func goToGameSelection(country: Country) {
        let destination = QuizDestination.selection(country)
        destinations.append(destination)
        path.append(destination)
    }
    
    func goToQuiz(mode: QuizMode, country: Country, sectionID: String?, subSectionID: String?, sectionTitle: String?, subsectionTitle: String?, initialLives: Int?) {
        let destination = QuizDestination.quiz(mode, country, sectionID: sectionID, subSectionID: subSectionID, sectionTitle: sectionTitle, subsectionTitle: subsectionTitle, initialLives: initialLives)
        destinations.append(destination)
        path.append(destination)
    }
    
    func goToFlipAndFlop(country: Country) {
        let destination = QuizDestination.flipAndFlop(country)
        destinations.append(destination)
        path.append(destination)
    }
    
    func goToComplete(result: QuizResult) {
        let destination = QuizDestination.quizComplete(result)
        destinations.append(destination)
        path.append(destination)
    }
    
    func goToTrainingZone(country: Country) {
        let destination = QuizDestination.trainingZone(country)
        destinations.append(destination)
        path.append(destination)
    }
    
    func goToLearnSigns(section: TrafficSectionEntity, title: String) {
        let destination = QuizDestination.learnSigns(section: section, title: title)
        destinations.append(destination)
        path.append(destination)
    }
    
    func pop(_ count: Int = 1) {
        for _ in 0..<count {
            if !path.isEmpty {
                path.removeLast()
                destinations.removeLast()
            }
        }
    }
    
    func popBackToQuizIntro() {
        while !destinations.isEmpty {
            destinations.removeLast()
            path.removeLast()
            
            if let last = destinations.last {
                if case .intro = last {
                    return
                }
            }
        }
    }
    
    func popBackToSelectionOrTrainingZone() {
        while !destinations.isEmpty {
            destinations.removeLast()
            path.removeLast()
            
            if let last = destinations.last {
                if case .selection = last {
                    return
                }
                if case .trainingZone = last {
                    return
                }
            }
        }
    }
}

// MARK: - Example supporting types

struct QuizResult: Hashable {
    let quizMode: QuizMode
    let country: Country
    let categoryTitle: String
    let categorySubtitle: String?
    let gamePassed: Bool
    let correctAnswers: Int
    let totalQuestions: Int
    let incorrectSigns: [TrafficSignEntity] 
}
