//
//  AdManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 29/9/25.
//

import Combine
import GoogleMobileAds
import OSLog

final class AdManager: NSObject, ObservableObject, FullScreenContentDelegate {
    static let shared = AdManager()
    
    // Interstitial ad
    private var interstitialAd: InterstitialAd?
    private var completionHandler: (() -> Void)?
    
    // Native ads
    @Published var nativeAds: [NativeAd] = []
    private var adLoaders: [AdLoader] = []
    private let logger = Logger(subsystem: "com.yourapp.TrafikkskiltQuiz", category: "AdMob")
    
    private var isDebugMode: Bool {
#if DEBUG
        return true
#else
        return false
#endif
    }
    
    // MARK: - Interstitial Ad
    func loadInterstitial() {
        Task {
            do {
                let request = Request()
#if DEBUG
                let adUnitID = "ca-app-pub-3940256099942544/4411468910"
#else
                let adUnitID = "ca-app-pub-6754023084784599/1604772701"
#endif
                let ad = try await InterstitialAd.load(
                    with: adUnitID,
                    request: request
                )
                ad.fullScreenContentDelegate = self
                self.interstitialAd = ad
                print("✅ Interstitial loaded")
            } catch {
                print("❌ Failed to load interstitial ad: \(error.localizedDescription)")
            }
        }
    }
    
    func showAd(completion: (() -> Void)? = nil) {
        guard let interstitialAd = interstitialAd else {
            print("Ad wasn't ready.")
            completion?()
            return
        }
        
        self.completionHandler = completion
        interstitialAd.present(from: nil)
        self.interstitialAd = nil
    }
    
    // MARK: - Native Ad
    func loadNativeAd() {
        loadNativeAd(for: nativeAds.count)
    }
    
    private func loadNativeAd(for index: Int) {
        let testAdUnitID = "ca-app-pub-3940256099942544/3986624511"
        let productionAdUnitID = "ca-app-pub-6754023084784599/5302098680"
        
        let adUnitID = isDebugMode ? testAdUnitID : productionAdUnitID
        
        let adLoaderOptions = NativeAdMediaAdLoaderOptions()
        adLoaderOptions.mediaAspectRatio = isDebugMode ? .any : .landscape
        
        let loader = AdLoader(
            adUnitID: adUnitID,
            rootViewController: nil,
            adTypes: [.native],
            options: [adLoaderOptions]
        )
        
        loader.delegate = self
        loader.accessibilityLabel = "main-\(index)"
        loader.load(Request())
        
        adLoaders.append(loader)
        
        logger.info("📡 Native ad load requested for index \(index) (\(self.isDebugMode ? "test" : "live") mode)")
    }
    
    // MARK: - FullScreenContentDelegate
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("ℹ️ Ad dismissed")
        completionHandler?()
        completionHandler = nil
    }
    
    func ad(_ ad: FullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("❌ Failed to present ad: \(error.localizedDescription)")
        loadInterstitial()
        completionHandler?()
        completionHandler = nil
    }
}

// MARK: - NativeAdLoaderDelegate
extension AdManager: NativeAdLoaderDelegate {
    func adLoader(_ adLoader: AdLoader, didReceive nativeAd: NativeAd) {
        DispatchQueue.main.async {
            if self.nativeAds.count > 0 {
                self.nativeAds.removeFirst()
            }
            self.nativeAds.append(nativeAd)
            self.logger.info("✅ Native ad loaded and replaced in nativeAds")
        }
    }
    
    func adLoader(_ adLoader: AdLoader, didFailToReceiveAdWithError error: Error) {
        guard let indexString = adLoader.accessibilityLabel else { return }
        logger.error("❌ Failed to load native ad for index \(indexString): \(error.localizedDescription)")
    }
}

// MARK: - NativeAdDelegate
extension AdManager: NativeAdDelegate {
    func nativeAdDidRecordClick(_ nativeAd: NativeAd) {
        logger.info("ℹ️ Native ad clicked")
    }
    
    func nativeAdDidRecordImpression(_ nativeAd: NativeAd) {
        logger.info("ℹ️ Native ad impression recorded")
    }
}

