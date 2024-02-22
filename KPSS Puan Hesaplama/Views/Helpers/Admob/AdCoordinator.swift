//
//  AdCoordinator.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 19.02.2024.
//

import Foundation
import GoogleMobileAds

class AdCoordinator: NSObject,GADFullScreenContentDelegate {
    private var ad: GADInterstitialAd?
    
    override init() {
        super.init()
        loadAd()
    }
    
    
    
    func loadAd() {
        let request = GADRequest()
        request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        GADInterstitialAd.load(
            withAdUnitID: Constants.interstitialUnitID, request: request
        ) { ad, error in
            if let error = error {
                return print("Failed to load ad with error: \(error.localizedDescription)")
            }
            
            self.ad = ad
            self.ad?.fullScreenContentDelegate = self
            
        }
    }
    
    func presentAd() {
        guard let fullScreenAd = ad else {
            return print("Ad wasn't ready")
        }
        
        // View controller is an optional parameter. Pass in nil.
        fullScreenAd.present(fromRootViewController: nil)
    }
    
    // MARK: - GADFullScreenContentDelegate methods

    func adDidRecordImpression(_ ad: GADFullScreenPresentingAd) {
      print("\(#function) called")
    }

    func adDidRecordClick(_ ad: GADFullScreenPresentingAd) {
      print("\(#function) called")
    }

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
      print("\(#function) called")
    }

    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("\(#function) called")
    }


    func adWillDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("\(#function) called")
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("\(#function) called")
        loadAd()
    }
}
