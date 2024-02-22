//
//  MainView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI
import GoogleMobileAds

struct MainView: View {
    
    @State private var viewModel = CalculateViewModel()

    var width: CGFloat = UIScreen.main.bounds.width
    var size: CGSize {
        return GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(width).size
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        NavigationLink(destination: OrtaogretimView()) {
                            HStack {
                                Image(systemName: "1.circle")
                                    .resizable()
                                    .foregroundStyle(.main)
                                    .frame(width: 40, height: 40)
                                
                                Text("Ortaöğretim")
                                    .badge(
                                        Text("P94")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: OnlisansView()) {
                            HStack {
                                Image(systemName: "2.circle")
                                    .resizable()
                                    .foregroundStyle(.main)
                                    .frame(width: 40, height: 40)
                                
                                Text("Önlisans")
                                    .badge(
                                        Text("P93")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: LisansView()) {
                            HStack {
                                Image(systemName: "3.circle")
                                    .resizable()
                                    .foregroundStyle(.main)
                                    .frame(width: 40, height: 40)
                                
                                Text("Lisans (B Grubu)")
                                    .badge(
                                        Text("P3")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: EgitimBilimleriView()) {
                            HStack {
                                Image(systemName: "4.circle")
                                    .resizable()
                                    .foregroundStyle(.main)
                                    .frame(width: 40, height: 40)
                                
                                Text("Eğitim Bilimleri")
                                    .badge(
                                        Text("P10")
                                            .italic()
                                    )
                            }
                        }
                        
                        NavigationLink(destination: OABTView()) {
                            HStack {
                                Image(systemName: "5.circle")
                                    .resizable()
                                    .foregroundStyle(.main)
                                    .frame(width: 40, height: 40)
                                
                                Text("ÖABT")
                                    .badge(
                                        Text("P121")
                                            .italic()
                                    )
                            }
                        }
                        
                        
                    } header: {
                        Text("Bölüm Seçiniz")
                            .bold()
                            .textCase(.none)
                    }
                    
                }
                if viewModel.openCount > 5 {
                    BannerView()
                        .frame(height: size.height)
                }
            }
            .navigationTitle("KPSS Puan Hesaplama")
            .onAppear{
                print(viewModel.openCount)
                viewModel.openCount += 1
            }
        }
    }
}

#Preview {
    MainView()
}
