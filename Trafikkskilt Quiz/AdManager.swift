//
//  AdManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 29/9/25.
//

import Combine
import GoogleMobileAds

final class AdManager: NSObject, ObservableObject, FullScreenContentDelegate {
    static let shared = AdManager()
    private var interstitialAd: InterstitialAd?
    private var completionHandler: (() -> Void)?
    
    func loadInterstitial() {
        Task {
            do {
                let request = Request()
                let ad = try await InterstitialAd.load(
                    with: "ca-app-pub-3940256099942544/4411468910",
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
            return print("Ad wasn't ready.")
        }
        
        self.completionHandler = completion
        interstitialAd.present(from: nil)
        self.interstitialAd = nil
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


