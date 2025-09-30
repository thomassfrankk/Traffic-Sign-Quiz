//
//  SettingsView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 22/9/25.
//

import SwiftUI
import SwiftData
import StoreKit


struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @StateObject private var purchaseManager = PurchaseManager()
    @Query private var settings: [GameSettings]
    
    var body: some View {
        NavigationStack {
            if let gameSettings = settings.first {
                @Bindable var gameSettings = gameSettings
                let country = gameSettings.selectedCountry
                
                Form {
                    // MARK: - Region
                    Section(LocalizationHelper.localizedString(for: "Region", country: country)) {
                        Picker(
                            LocalizationHelper.localizedString(for: "Country", country: country),
                            selection: $gameSettings.selectedCountry
                        ) {
                            Text(LocalizationHelper.localizedString(for: "Norway", country: country)).tag("Norway")
                            Text(LocalizationHelper.localizedString(for: "Sweden", country: country)).tag("Sweden")
                            Text(LocalizationHelper.localizedString(for: "Denmark", country: country)).tag("Denmark")
                        }
                    }
                    
                    Section(LocalizationHelper.localizedString(for: "Display Mode", country: country)) {
                        Picker(LocalizationHelper.localizedString(for: "Display Mode", country: country), selection: $gameSettings.displayMode.animation()) {
                            Text(LocalizationHelper.localizedString(for: "System", country: country)).tag(0)
                            Text(LocalizationHelper.localizedString(for: "Light", country: country)).tag(1)
                            Text(LocalizationHelper.localizedString(for: "Dark", country: country)).tag(2)
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(LocalizationHelper.localizedString(for: "Game Effects", country: country)) {
                        Toggle(
                            LocalizationHelper.localizedString(for: "Sound Effects", country: country),
                            isOn: $gameSettings.soundEnabled
                        )
                        Toggle(
                            LocalizationHelper.localizedString(for: "Haptics", country: country),
                            isOn: $gameSettings.hapticsEnabled
                        )
                    }
                    
                    
                    
                    // MARK: - Premium
                    Section(LocalizationHelper.localizedString(for: "Premium", country: country)) {
                        if purchaseManager.adFreeUnlocked {
                            VStack(spacing: 8) {
                                Text(LocalizationHelper.localizedString(for: "You have Premium access", country: country))
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                
                                Text(LocalizationHelper.localizedString(for: "Enjoy an ad-free experience. Thank you for supporting the app.", country: country))
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        } else
                        if let product = purchaseManager.adFreeProduct {
                            VStack(spacing: 8) {
                                Text(LocalizationHelper.localizedString(for: "Upgrade to Premium", country: country))
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                
                                Text(LocalizationHelper.localizedString(for: "Support the app and enjoy an ad-free experience", country: country))
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom)
                                
                                Button {
                                    Task { await purchaseManager.purchaseAdFree() }
                                } label: {
                                    Text("\(LocalizationHelper.localizedString(for: "Remove Ads", country: country)) – \(product.displayPrice)")
                                        .padding(.horizontal)
                                }
                                .tint(.primary)
                                .foregroundStyle(Color(UIColor.systemBackground))
                                .buttonStyle(.borderedProminent)
                                .controlSize(.large)
                                
                                Button(LocalizationHelper.localizedString(for: "Restore Purchases", country: country)) {
                                    Task { await purchaseManager.restorePurchases() }
                                }
                                .buttonStyle(.plain)
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                                .padding(.vertical, 2)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        } else {
                            ProgressView(LocalizationHelper.localizedString(for: "Loading…", country: country))
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                }
                .navigationTitle(LocalizationHelper.localizedString(for: "Settings", country: country))
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                        }
                    }
                }
            } else {
                ProgressView(LocalizationHelper.localizedString(for: "Loading Settings…", country: "Norway"))
                    .onAppear {
                        // Create default settings on first launch
                        modelContext.insert(GameSettings())
                    }
            }
        }
    }
    
    private func purchaseAdFree() {
        // Placeholder function for purchasing ad removal
    }
}

#Preview {
    SettingsView()
        .modelContainer(for: GameSettings.self, inMemory: true)
}
