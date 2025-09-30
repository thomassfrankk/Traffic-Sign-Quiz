//
//  StartQuizIntroView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftUI
import SwiftData

struct StartQuizIntroView: View {
    let quizMode: QuizMode
    let country: Country
    let title: String
    let subtitle: String
    var namespace: Namespace.ID
    var matchedID: String
    
    @Environment(\.dismiss) private var dismiss
    @Query private var settings: [GameSettings]
    
    @State private var startQuiz = false
    @State private var selectedIndex: Int? = 0
    
    private let quizItemCountOptions = [10, 25, 50]
    private let quizMinuteLengthOptions = [1, 2, 3]
    
    private var sections: [TrafficSection] {
        TrafficSectionStore.all[country] ?? []
    }
    
    var countryScores: CountryScores? {
        guard let settings = settings.first else { return nil }
        return settings.scores(for: settings.selectedCountry)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.largeTitle.weight(.black))
                .padding(.horizontal)
                .navigationTransition(.zoom(sourceID: matchedID, in: namespace))
            
            Text(subtitle)
                .font(.title3.bold())
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            if quizMode == .allSigns {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 32) {
                            ForEach(sections.indices, id: \.self) { index in
                                let section = sections[index]
                                let best = countryScores?.bestScore(for: section.name) ?? 0
                                
                                SectionBox(
                                    title: section.name,
                                    numberOfSigns: section.signs.count,
                                    highScore: best,
                                    country: country
                                )
                                .frame(width: 320, height: 220)
                                .id(index)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 32)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .contentMargins(.horizontal, 64, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))
                    .scrollPosition(id: $selectedIndex)
                    .onAppear {
                        DispatchQueue.main.async {
                            proxy.scrollTo(selectedIndex ?? 0, anchor: .center)
                        }
                    }
                }
            } else {
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            if quizMode == .regular {
                                ForEach(0..<quizItemCountOptions.count, id: \.self) { index in
                                    SignCountSelector(number: quizItemCountOptions[index])
                                        .id(index) // ✅ still needed for scroll binding
                                        .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                                }
                            } else if quizMode == .timeChallange {
                                ForEach(0..<quizMinuteLengthOptions.count, id: \.self) { index in
                                    let minutes = quizMinuteLengthOptions[index]
                                    let best = countryScores?.bestScore(for: minutes) ?? 0
                                    
                                    SignTimeSelector(
                                        number: minutes,
                                        unit: LocalizationHelper.localizedString(
                                            for: minutes == 1 ? "minute" : "minutes",
                                            country: country.rawValue
                                        ),
                                        highscore: best
                                    )
                                    .id(index)
                                    .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                                }
                            }
                            
                        }
                        .scrollTargetLayout()
                    }
                    .contentMargins(.horizontal, 64, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))
                    .scrollPosition(id: $selectedIndex)
                    .onAppear {
                        proxy.scrollTo(selectedIndex ?? 1, anchor: .center)
                    }
                }
            }
            
            if quizMode == .regular {
                Text("\(quizItemCountOptions[selectedIndex ?? 1]) \(LocalizationHelper.localizedString(for: "signs", country: country.rawValue))")
                    .font(.title3.bold())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
            } else if quizMode == .timeChallange, let idx = selectedIndex {
                let minutes = quizMinuteLengthOptions[idx]
                
                if minutes == 1 {
                    Text("1 \(LocalizationHelper.localizedString(for: "minute challenge singular", country: country.rawValue))")
                        .font(.title3.bold())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                } else {
                    Text("\(minutes) \(LocalizationHelper.localizedString(for: "minute challenge plural", country: country.rawValue))")
                        .font(.title3.bold())
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                }
                
                
            } else {
                Text("\(LocalizationHelper.localizedString(for: "Test your skills", country: country.rawValue))")
                    .font(.title3.bold())
                    .multilineTextAlignment(.center)
                    .padding(.top)
            }
            
            Spacer()
            Spacer()
            
            if quizMode == .allSigns, let selectedIndex {
                NavigationLink {
                    QuizGameView(
                        quizMode: .allSigns,
                        signs: sections[selectedIndex].signs,
                        title: sections[selectedIndex].name,
                        showProgress: true,
                        timeLegnth: nil,
                        country: country
                    )
                } label: {
                    Text(LocalizationHelper.localizedString(for: "START QUIZ", country: country.rawValue))
                        .font(.title3.weight(.bold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 4)
                }
                .tint(.primary)
                .foregroundStyle(Color(UIColor.systemBackground))
                .buttonStyle(.glassProminent)
                .controlSize(.large)
                .padding(.horizontal)
                //                .navigationTransition(.zoom(sourceID: matchedID, in: namespace))
            } else if quizMode == .regular {
                NavigationLink {
                    QuizGameView(
                        quizMode: .regular,
                        signs: Array(
                            (TrafficSectionStore.all[country] ?? [])
                                .flatMap { $0.signs }
                                .shuffled()
                                .prefix(quizItemCountOptions[selectedIndex ?? 0])
                        ),
                        title: "Regular Quiz",
                        showProgress: true,
                        timeLegnth: nil,
                        country: country
                    )
                } label: {
                    Text(LocalizationHelper.localizedString(for: "START QUIZ", country: country.rawValue))
                        .font(.title3.weight(.bold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 4)
                }
                .tint(.primary)
                .foregroundStyle(Color(UIColor.systemBackground))
                .buttonStyle(.glassProminent)
                .controlSize(.large)
                .padding(.horizontal)
                //                .navigationTransition(.zoom(sourceID: matchedID, in: namespace))
            } else if quizMode == .timeChallange {
                NavigationLink {
                    QuizGameView(
                        quizMode: .timeChallange,
                        signs: (TrafficSectionStore.all[country] ?? [])
                            .flatMap { $0.signs }
                            .shuffled(),
                        title: "Time Challenge",
                        showProgress: false, // ⏱ time mode doesn’t need progress counter
                        timeLegnth: quizMinuteLengthOptions[selectedIndex ?? 0],
                        country: country
                    )
                } label: {
                    Text(LocalizationHelper.localizedString(for: "START QUIZ", country: country.rawValue))
                        .font(.title3.weight(.bold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 4)
                }
                .tint(.primary)
                .foregroundStyle(Color(UIColor.systemBackground))
                .buttonStyle(.glassProminent)
                .controlSize(.large)
                .padding(.horizontal)
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .background(.regularMaterial)
        
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }
        
    }
    
    // Helper: pick random unique signs
    private func randomSigns(count: Int) -> [TrafficSign] {
        let allSigns = TrafficSectionsNorway.all.flatMap { $0.signs }
        let picked = Array(allSigns.shuffled().prefix(count))
        return picked.map { sign in
            TrafficSign(
                title: sign.title,
                section: sign.section,
                description: sign.description,
                images: sign.images,
                wrongAnswers: sign.wrongAnswers
            )
        }
    }
    
}

struct SectionBox: View {
    let title: String
    let numberOfSigns: Int
    let highScore: Int
    let country: Country
    
    var body: some View {
        
        VStack(spacing: 8) {
            Text(title)
                .font(.largeTitle.weight(.heavy))
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .multilineTextAlignment(.center)
            
            Text("\(numberOfSigns) \(LocalizationHelper.localizedString(for: "signs", country: country.rawValue))")
                .font(.headline.weight(.bold))
            
            Divider()
                .overlay(.white)
                .padding(.vertical, 4)
                .padding(.horizontal)
            
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text("\(LocalizationHelper.localizedString(for: "High Score:", country: country.rawValue)) \(highScore)")
                    .font(.title2.weight(.bold))
                Text("%")
                    .font(.subheadline.weight(.heavy))
            }
        }
        .foregroundStyle(.white)
        .padding(24)
        .frame(width: 300, height: 200)
        .background(
            ZStack {
                // Orange background
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.blue.mix(with: .black, by: 0.3))
                
                // Inset white border
                ConcentricRectangle(corners: .concentric(minimum: 4))
                    .stroke(Color.white, lineWidth: 4)
                    .padding(9)
            }
        )
        .containerShape(.rect(cornerRadius: 20, style: .continuous))
        .shadow(radius: 4)
    }
}


struct SignCountSelector: View {
    let number: Int
    
    private var screenWidth: CGFloat {
        // ✅ Uses connected scenes instead of UIScreen.main
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.screen.bounds.width }
            .first ?? 300 // fallback if no screen is found
    }
    
    private var size: CGFloat {
        screenWidth / 1.75
    }
    
    var body: some View {
        ZStack {
            // Red outer circle
            Circle()
                .fill(Color.red.mix(with: .black, by: 0.1))
                .frame(width: size, height: size)
                .shadow(radius: 4)
            
            // White inner circle
            Circle()
                .fill(Color.white)
                .frame(width: size * 0.73, height: size * 0.73)
            
            // Number
            Text("\(number)")
                .font(.system(size: size * 0.3, weight: .heavy, design: .rounded))
                .foregroundColor(.black)
        }
        .clipShape(.circle)
        .padding(.vertical)
    }
}

/// Button styled as a solid blue circle with number and unit stacked vertically
struct SignTimeSelector: View {
    let number: Int
    let unit: String
    let highscore: Int
    
    private var screenWidth: CGFloat {
        // ✅ Uses connected scenes instead of UIScreen.main
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.screen.bounds.width }
            .first ?? 300 // fallback if no screen is found
    }
    
    private var size: CGFloat {
        screenWidth / 1.75
    }
    
    var body: some View {
        
        ZStack {
            Circle()
                .fill(Color.green.mix(with: .black, by: 0.15))
                .frame(width: size, height: size)
                .shadow(radius: 4)
            
            VStack(spacing: 0) {
                Text("\(number)")
                    .font(.system(size: size * 0.4, weight: .heavy, design: .rounded))
                
                Text(unit)
                    .font(.system(size: size * 0.1, weight: .semibold, design: .default))
                
                Text("Highscore: \(highscore)")
                    .font(.system(size: size * 0.075, weight: .semibold, design: .default))
                    .foregroundStyle(.secondary)
                    .padding(.top, 4)
            }
            .foregroundStyle(.white)
        }
        .clipShape(.circle)
        .padding(.vertical)
    }
}

//#Preview {
//    NavigationStack {
//        StartQuizIntroView(quizMode: .regular,
//                           country: .norway,
//                           title: "Regular Quiz",
//                           subtitle: "Decide how many signs you want to be tested on. The signs will be chosen randomly from all categories.")
//    }
//}
