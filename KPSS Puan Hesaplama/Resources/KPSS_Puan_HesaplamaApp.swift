//
//  KPSS_Puan_HesaplamaApp.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI
import SwiftData
import GoogleMobileAds
import StoreKit

@main
struct KPSS_Puan_HesaplamaApp: App {
    
    init() {
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
        UITabBar.appearance().standardAppearance = appearanceTab
        
        // Admob SDK
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "c458ae01182d2fad3701091c1e7991e0"]
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for:Result.self)
        
    }
}
