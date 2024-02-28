//
//  RootView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI
import AppTrackingTransparency

struct RootView: View {
    @AppStorage("showingOnboarding") private var showingOnboarding = true
    @State var adsManager = AdsManager()
    @State private var selectionItem = 0


    var body: some View {
        TabView(selection: $selectionItem){
            MainView(selectionTabItem: $selectionItem)
                .tabItem {
                    Label("Başlangıç", systemImage: "house")
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill : .none)
                }
                .tag(0)
            
            ResultView(selectionTabItem: $selectionItem)
                .tabItem {
                    Label("Hesaplamalar", systemImage:     "arrow.counterclockwise.circle")
                        .environment(\.symbolVariants, selectionItem == 1 ? .fill : .none)
                }
                .tag(1)
        }
        .fullScreenCover(isPresented: $showingOnboarding, content: {
            OnboardingView.init()
                .edgesIgnoringSafeArea(.all)
                .onDisappear{
                    showingOnboarding = false
                    ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in })
                }
        })
        .onAppear{
            adsManager.increaseBannerAdCounter()
        }
        .tint(.main)
    }
}

#Preview {
    RootView()
}
