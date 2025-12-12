//
//  CountryInfoView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 5/10/25.
//

import SwiftUI
import SwiftData
import Translation

struct CountryInfoView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    
    let country: Country
    let languageManager: LanguageManager
    let userLanguage: Language
    
    @Query private var countryEntities: [CountryDataEntity]
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    
    @State var displayInformation: String? = nil
    @State var displayDrivingRules: [String: String] = [:]
    
    init(country: Country, languageManager: LanguageManager, userLanguage: Language) {
        self.country = country
        self.languageManager = languageManager
        self.userLanguage = userLanguage
        // ✅ Fetch from SwiftData using predicate
        _countryEntities = Query(
            filter: #Predicate { $0.country == country.rawValue },
            sort: \.country
        )
    }
    
    var usesTwoLines: Bool {
        if isPad {
            return false
        }
        if isSmall {
            return true
        }
        if country == .usa {
            return true
        }
        return false
    }
    
    
    var body: some View {
        if let data = countryEntities.first {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 16) {
                    // Header Info Cards
                    HStack(spacing: 16) {
                        InfoCard(
                            symbol: "arrowshape.\(data.drivingSide.lowercased()).circle",
                            title: isPad ? "Driving_Side_pad" : isSmall ? "Driving_Side_small" : "Driving_Side",
                            value: data.drivingSide.capitalized,
                            usesTwoLines: usesTwoLines,
                            languageManager: languageManager
                        )
                        
                        InfoCard(
                            symbol: "hand.raised.circle",
                            title: isPad ? "Alcohol_Limit_pad" : isSmall ? "Alcohol_Limit_small" : "Alcohol_Limit",
                            value: "\(data.alcoholLimit)\(data.alcoholUnit)",
                            usesTwoLines: usesTwoLines,
                            languageManager: languageManager
                        )
                        
                        InfoCard(
                            symbol: "phone.circle",
                            title: isPad ? "Emergency_Number_pad" : isSmall ? "Emergency_Number_small" : "Emergency_Number",
                            value: data.emergencyNumber,
                            usesTwoLines: usesTwoLines,
                            languageManager: languageManager
                        )
                    }
                    .padding(.top)
                    .padding(.horizontal, isPad ? 25 : 0)
                    .frame(maxWidth: 650)
                    
                    // 📝 General Information
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
                        Text(data.generalInformation(for: userLanguage.rawValue))
                            .fontWeight(.regular)
                            .tracking(1)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(6)
                            .transition(.opacity)
                    }
                    .frame(minHeight: 300, alignment: .topLeading)
                    .padding(28)
                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, isPad ? 50 : 0)
                    .frame(maxWidth: 700)
                    
                    if !purchaseManager.adFreeUnlocked {
                        AdNativeView()
                            .shadow(color: .black.opacity(0.2), radius: 4)
                            .frame(maxWidth: 600)
                    }
                    
                    // 📜 Common Rules
                    if !data.trafficRules(for: userLanguage.rawValue).isEmpty {
                        VStack(alignment: .leading, spacing: 28) {
                            HStack(alignment: .bottom, spacing: 16) {
                                Image(systemName: "exclamationmark.triangle")
                                    .font(.system(size: 30).weight(.semibold))
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.white, .accent)
                                    .offset(y: 1)
                                
                                Text(languageManager.localizedString(for: "Traffic Rules"))
                                    .font(.title3.weight(.bold))
                                    .tracking(1)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            ForEach(data.trafficRules(for: userLanguage.rawValue), id: \.self) { rule in
                                Text(rule)
                                    .fontWeight(.regular)
                                    .tracking(1)
                                    .multilineTextAlignment(.leading)
                                    .lineSpacing(6)
                            }
                        }
                        .frame(minHeight: 300, alignment: .topLeading)
                        .frame(maxWidth: .infinity)
                        .padding(28)
                        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, isPad ? 25 : 0)
                        .frame(maxWidth: 650)
                    }
                    
                    SpeedLimitsCard(speedUnit: data.speedUnit, speedLimits: data.speedLimits, languageManager: languageManager)
                }
                .padding(.vertical)
                .padding(.horizontal)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .title) {
                    Text(languageManager.localizedString(for: country.rawValue))
                        .titleTextStyle(isSmall: isSmall, isPad: isPad)
                }
            }
            .scrollBounceBehavior(.basedOnSize)
            .frame(maxWidth: .infinity)
            .background(Color("GameBackground").gradient)
        } else {
            // No data found — maybe syncing or offline
            VStack {
                ContentUnavailableView(
                    "No data available",
                    systemImage: "icloud.slash",
                    description: Text("Please connect to the internet to download \(country.localizedName) data.")
                )
                .navigationTitle("\(country.flag) \(country.localizedName)")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("GameBackground").gradient)
        }
    }
}

// MARK: - InfoCard
struct InfoCard: View {
    let symbol: String
    let title: String
    let value: String
    let usesTwoLines: Bool
    let languageManager: LanguageManager
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: symbol)
                .font(.system(size: 34).weight(.semibold))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .accent)
                .padding(.bottom, 4)
            
            Text(languageManager.localizedString(for: value))
                .font(.headline.weight(.bold))
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .tracking(1)
            
            Text(languageManager.localizedString(for: title))
                .font(.caption.weight(.medium))
                .opacity(0.7)
                .lineLimit(2, reservesSpace: usesTwoLines ? true : false)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct SpeedLimitsCard: View {
    let speedUnit: String
    let speedLimits: SpeedLimits
    let languageManager: LanguageManager
    
    var body: some View {
        VStack(spacing: 28) {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: "gauge.with.needle")
                    .font(.system(size: 30).weight(.semibold))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .accent)
                
                Text(languageManager.localizedString(for: "Speed Limits"))
                    .font(.title3.weight(.bold))
                    .tracking(1)
                
                Text(languageManager.localizedString(for: speedUnit))
                    .font(.title3.weight(.regular))
                    .opacity(0.7)
                    .tracking(1)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(languageManager.localizedString(for: "These speed limits apply where no other limits are posted. It's important to follow the speed limits and adjust your driving to conditions such as poor visibility or slippery roads."))
                .fontWeight(.regular)
                .tracking(1)
                .multilineTextAlignment(.leading)
                .lineSpacing(6)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(alignment: .top, spacing: 28) {
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .stroke(Color.accent, lineWidth: 9)
                            .frame(width: 60, height: 60)
                        Text("\(speedLimits.urban)")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                    }
                    Text(languageManager.localizedString(for: "Urban"))
                        .font(.subheadline.weight(.medium))
                        .allowsTightening(true)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .opacity(0.7)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .stroke(Color.accent, lineWidth: 8)
                            .frame(width: 60, height: 60)
                        Text("\(speedLimits.rural)")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                    }
                    Text(languageManager.localizedString(for: "Rural"))
                        .font(.subheadline.weight(.medium))
                        .allowsTightening(true)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .opacity(0.7)
                }
                .frame(maxWidth: .infinity)
                
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .stroke(Color.accent, lineWidth: 8)
                            .frame(width: 60, height: 60)
                        Text("\(speedLimits.motorway)")
                            .foregroundColor(.white)
                            .bold()
                            .font(.title2)
                    }
                    Text(languageManager.localizedString(for: "Motorway"))
                        .font(.subheadline.weight(.medium))
                        .allowsTightening(true)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .opacity(0.7)
                }
                .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 8)
        }
        .foregroundStyle(.white)
        .padding(28)
        .frame(maxWidth: 600)
        .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
    }
}

