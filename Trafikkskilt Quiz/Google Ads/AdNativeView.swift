//
//  AdNativeView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 14/10/25.
//

import SwiftUI
import GoogleMobileAds

struct AdNativeView: View {
    @EnvironmentObject var purchaseManager: PurchaseManager
    @ObservedObject var adManager = AdManager.shared
    @State private var nativeAdHeight: CGFloat = 0
    @State private var cachedAd: NativeAd?
    
    let adId: String = UUID().uuidString  // ✅ Unique ID per view instance
    
    var body: some View {
        GeometryReader { geometry in
            if let ad = cachedAd {
                AdMobNativeAdView(
                    nativeAd: ad,
                    maxWidth: geometry.size.width,
                    measuredHeight: $nativeAdHeight
                )
                .frame(width: geometry.size.width, height: nativeAdHeight)
                .onDisappear {
//                    print("Ad \(adId) disappeared - loading new ad")
                    cachedAd = nil
                    adManager.loadNativeAd()  // ✅ This now triggers for each ad
                }
            }
        }
        .frame(height: nativeAdHeight)
        .onAppear {
            if cachedAd == nil {
//                print("Ad \(adId) appeared - getting cached ad")
                cachedAd = adManager.nativeAds.last
            }
        }
    }
}
