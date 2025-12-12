//
//  LearnSignsView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 5/10/25.
//

import SwiftUI
import Translation
import SwiftData

struct LearnSignsView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    
    let section: TrafficSectionEntity
    let title: String
    let languageManager: LanguageManager
    
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isSmall) private var isLandscape
    
    @State private var expandedSubSectionIDs: Set<String> = []
    @State private var displayInformation: String? = nil
    @State private var displaySubNames: [String: String] = [:]
    @State private var displaySubDetails: [String: String] = [:]
    
    @Query private var settings: [GameSettings]
    
    private var country: Country {
        if let raw = settings.first?.selectedCountry,
           let parsed = Country(rawValue: raw) {
            return parsed
        }
        return .usa
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
    
    private var groupedSigns: [(key: TrafficSubSectionEntity?, value: [TrafficSignEntity])] {
        if let subSections = section.subSections, !subSections.isEmpty {
            let sortedSubSections = subSections.sorted { $0.index < $1.index }
            return sortedSubSections.map { subSection in
                // Make a new array copy to avoid any reference issues
                let signs = subSection.signs.sorted { $0.index < $1.index }
                return (key: subSection, value: Array(signs))
            }
        } else {
            let signs = section.signs.sorted { $0.index < $1.index }
            return [(key: nil, value: signs)]
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .center, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 28) {
                    HStack(alignment: .bottom, spacing: 16) {
                        Image(systemName: "info.triangle")
                            .font(.system(size: 30).weight(.semibold))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .accent)
                            .offset(y: 1)
                        
                        Text(languageManager.localizedString(for: "Information"))
                            .font(.title3.weight(.bold))
                            .tracking(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                    }
                    
                    if let details = section.details(for: userLanguage.rawValue) {
                        Text(details)
                            .fontWeight(.regular)
                            .tracking(1)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(6)
                            .id(displayInformation ?? "")
                            .transition(.opacity)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(28)
                .frame(maxWidth: 600)
                .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                
                // 🚦 Signs
                ForEach(Array(groupedSigns.enumerated()), id: \.offset) { groupIndex, group in
                    let subSection = group.key
                    let signs = group.value
                    
                    if let sub = subSection {
                        
                        VStack(alignment: .leading, spacing: 28) {
                            HStack(alignment: .center, spacing: 16) {
                                Image(systemName: expandedSubSectionIDs.contains(sub.id) ? "arrow.up.circle.dotted" : "arrow.down.circle.dotted")
                                    .font(.system(size: 30).weight(.semibold))
                                    .symbolRenderingMode(.palette)
                                    .contentTransition(.symbolEffect(.replace.magic(fallback: .replace)))
                                    .foregroundStyle(.white, .accent)
                                    .symbolEffect(.pulse, options: .repeat(.continuous))
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                                            if expandedSubSectionIDs.contains(sub.id) {
                                                expandedSubSectionIDs.remove(sub.id)
                                            } else {
                                                expandedSubSectionIDs.insert(sub.id)
                                            }
                                        }
                                    }
                                
                                Text(sub.name(for: userLanguage.rawValue))
                                    .font(.title3.weight(.bold))
                                    .tracking(1)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if let subDetails = sub.details(for: userLanguage.rawValue), !subDetails.isEmpty {
                                Text(subDetails)
                                    .fontWeight(.regular)
                                    .tracking(1)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(6)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                            }
                        }
//                        .frame(maxWidth: .infinity)
                        .padding(28)
                        .frame(maxWidth: 600)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
//                        .padding(.horizontal)
                        .padding(.top)
                        
                        // 🎯 Ad before each subsection (or before first group if no subsections)
                        
                        
                        if expandedSubSectionIDs.contains(sub.id) {
                            ForEach(Array(signs.enumerated()), id: \.element.id) { index, sign in
                                SignCardView(sign: sign, isPad: isPad, isSmall: isSmall, purchaseManager: purchaseManager, languageManager: languageManager, configuration: configuration, userLanguage: userLanguage, supportedLanguage: supportedLanguage)
//                                    .padding(.horizontal, isPad ? 32 : 16)
                                
                                if !purchaseManager.adFreeUnlocked && (index + 1) % 10 == 0 {
                                    AdNativeView()
                                        .shadow(color: .black.opacity(0.2), radius: 4)
                                        .frame(maxWidth: 600)
//                                        .padding(.horizontal, isPad ? 32 : 16)
                                }
                            }
                            
                            if !purchaseManager.adFreeUnlocked && signs.count < 10 {
                                AdNativeView()
                                    .shadow(color: .black.opacity(0.2), radius: 4)
                                    .frame(maxWidth: 600)
//                                    .padding(.horizontal, isPad ? 32 : 16)
                            }
                        }
                    } else {
                        ForEach(Array(signs.enumerated()), id: \.element.id) { index, sign in
                            SignCardView(sign: sign, isPad: isPad, isSmall: isSmall, purchaseManager: purchaseManager, languageManager: languageManager, configuration: configuration, userLanguage: userLanguage, supportedLanguage: supportedLanguage)
//                                .padding(.horizontal, isPad ? 32 : 16)
                            
                            if !purchaseManager.adFreeUnlocked && (index + 1) % 10 == 0 {
                                AdNativeView()
                                    .shadow(color: .black.opacity(0.2), radius: 4)
                                    .frame(maxWidth: 600)
//                                    .padding(.horizontal, isPad ? 32 : 16)
                            }
                        }
                        
                        if !purchaseManager.adFreeUnlocked && signs.count < 10 {
                            AdNativeView()
                                .shadow(color: .black.opacity(0.2), radius: 4)
                                .frame(maxWidth: 600)
//                                .padding(.horizontal, isPad ? 32 : 16)
                        }
                    }
                }
            }
            .padding(.bottom, isPad ? 32 : 16)
            .padding(.top, 32)
            .padding(.horizontal)
            
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Color("GameBackground").gradient)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .title) {
                Text(title)
                    .titleTextStyle(isSmall: isSmall, isPad: isPad)
            }
        }
    }
}

struct IncorrectSignsView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    
    let quizMode: QuizMode
    let incorrectSigns: [TrafficSignEntity]
    let languageManager: LanguageManager
    let configuration: TranslationSession.Configuration
    let userLanguage: Language
    let supportedLanguage: Language
    
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    
    private var sectionName: String {
        incorrectSigns.first?.sectionName(for: userLanguage.rawValue) ?? ""
    }
    
    private var subSectionName: String? {
        incorrectSigns.first?.subSectionName(for: userLanguage.rawValue)
    }
    
    private func makeInfoSummary() -> AttributedString {
        let total = incorrectSigns.count
        let section = sectionName.isEmpty ? sectionName : sectionName
        let sub = subSectionName
        
        let text: String
        
        switch quizMode {
        case .grandPrix, .beatTheClock, .flipAndMatch:
            let gameTitle = languageManager.localizedString(for: quizMode.rawValue)
            
            if total == 1 {
                text = String(format: languageManager.localizedString(for: "info_missed_one_section"), gameTitle)
            } else {
                text = String(format: languageManager.localizedString(for: "info_missed_many_section"), total, gameTitle)
            }
        default:
            if let sub = sub, !sub.isEmpty {
                if total == 1 {
                    text = String(format: languageManager.localizedString(for: "info_missed_one_sub"), sub, section)
                } else {
                    text = String(format: languageManager.localizedString(for: "info_missed_many_sub"), total, sub, section)
                }
            } else {
                if total == 1 {
                    text = String(format: languageManager.localizedString(for: "info_missed_one_section"), section)
                } else {
                    text = String(format: languageManager.localizedString(for: "info_missed_many_section"), total, section)
                }
            }
        }
        
        
        
        
        return try! AttributedString(markdown: text)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 16) {
                
                VStack(alignment: .leading, spacing: 28) {
                    HStack(alignment: .bottom, spacing: 16) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 30).weight(.semibold))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .accent)
                            .offset(y: 1)
                        
                        Text(languageManager.localizedString(for: "Overview"))
                            .font(.title3.weight(.bold))
                            .tracking(1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(makeInfoSummary())
                        .fontWeight(.medium)
                        .tracking(1)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(6)
                        .layoutPriority(2)
                }
                .padding(28)
                .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, isPad ? 25 : 0)
                .frame(maxWidth: 650)
                
                ForEach(incorrectSigns.indices, id: \.self) { idx in
                    let sign = incorrectSigns[idx]
                    SignCardView(
                        sign: sign,
                        isPad: isPad,
                        isSmall: isSmall,
                        purchaseManager: purchaseManager,
                        languageManager: languageManager,
                        configuration: configuration,
                        userLanguage: userLanguage,
                        supportedLanguage: supportedLanguage
                    )
                }
                
                if !purchaseManager.adFreeUnlocked {
                    AdNativeView()
                        .shadow(color: .black.opacity(0.2), radius: 4)
                        .frame(maxWidth: 600)
                }
            }
            .padding(.top, 32)
            .padding(.horizontal)
            .padding(.bottom, isSmall ? 16 : 0)
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Color("GameBackground").gradient)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .title) {
                Text(languageManager.localizedString(for: "Recorded Errors"))
                    .titleTextStyle(isSmall: isSmall, isPad: isPad)
            }
        }
    }
}

struct SignCardView: View {
    let sign: TrafficSignEntity
    let isPad: Bool
    let isSmall: Bool
    let purchaseManager: PurchaseManager
    let languageManager: LanguageManager
    let configuration: TranslationSession.Configuration
    let userLanguage: Language
    let supportedLanguage: Language
    
    let threeSigns = ["Hindermarkering (skråstriper)", "Kantstolpe", "Avstandsskilt", "Parkeringssone", "Kjørefelt begynner", "Kjørefeltinndeling", "Time-Restricted Parking", "No Parking Except Electric Vehicles / Charging Only", "Directional Object Marker"]
    
    @State private var displayTitle: String? = nil
    @State private var displayDescription: String? = nil
    
    var body: some View {
        VStack(spacing: 32) {
            // 📸 IMAGES
            let uiImages = sign.imageData.compactMap { UIImage(data: $0) }
            
            if uiImages.count == 1, let image = uiImages.first {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: isPad ? 220 : isSmall ? 120 : 140)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .shadow(color: .black.opacity(0.2), radius: 8)
                    .padding(.horizontal)
                
            } else if uiImages.count == 2 {
                HStack(spacing: 0) {
                    Spacer(minLength: 16)
                    ForEach(uiImages.indices, id: \.self) { idx in
                        Image(uiImage: uiImages[idx])
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: isPad ? 220 : isSmall ? 120 : 140)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .shadow(color: .black.opacity(0.2), radius: 8)
                        Spacer(minLength: 16)
                    }
                }
            }
            
            else if threeSigns.contains(sign.title(for: supportedLanguage.rawValue)) {
                HStack(spacing: 0) {
                    Spacer(minLength:isSmall ? 8 : 12)
                    ForEach(uiImages.indices, id: \.self) { idx in
                        Image(uiImage: uiImages[idx])
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: isPad ? 220 : isSmall ? 120 : 140)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .shadow(color: .black.opacity(0.2), radius: 8)
                        Spacer(minLength:isSmall ? 8 : 12)
                    }
                }
            }
            
            else if uiImages.count > 2 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(uiImages.indices, id: \.self) { idx in
                            Image(uiImage: uiImages[idx])
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: isPad ? 220 : isSmall ? 120 : 140)
                                .frame(maxWidth: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .shadow(color: .black.opacity(0.2), radius: 6)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            // 📝 TITLE + DESCRIPTION
            VStack(spacing: 16) {
                Text(sign.title(for: userLanguage.rawValue))
                    .font(.headline.bold())
                    .tracking(1)
                    .multilineTextAlignment(.center)
                    .id(displayTitle)
                    .transition(.opacity)
                
                Text(sign.description(for: userLanguage.rawValue))
                    .font(.subheadline)
                    .tracking(1)
                    .lineSpacing(2)
                    .multilineTextAlignment(.center)
                    .opacity(0.7)
                    .padding(.horizontal)
                    .id(displayDescription)
                    .transition(.opacity)
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 32)
        .frame(maxWidth: 600)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
    }
}
