//
//  AdsManager.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 28.02.2024.
//

import Foundation
import SwiftUI
import Observation

@Observable
class AdsManager {
    
    @ObservationIgnored
    @AppStorage("bannerAdCounter") var bannerAdCounter = 0
    
    var interstitialAdCounter = 1
    
    func shouldShowBannerAd() -> Bool {
        return bannerAdCounter >= 5
    }
    
    func shouldShowInterstitialAd() -> Bool {
        return interstitialAdCounter % 5 == 0
    }
    
    func increaseBannerAdCounter(){
        bannerAdCounter += 1
        print("Banner Counter \(bannerAdCounter)")
    }
    
    func increaseInterstitialAdCounter(){
        interstitialAdCounter += 1
        print("Interstitial Counter \(interstitialAdCounter)")
    }
}
