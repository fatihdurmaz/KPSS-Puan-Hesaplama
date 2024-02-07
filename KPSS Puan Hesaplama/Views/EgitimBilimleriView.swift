//
//  EgitimBilimleriView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi: Double = 0
    @State private var gkDogruSayisi: Double = 30
    @State private var gkYanlisSayisi: Double = 0
    @State private var ebDogruSayisi: Double = 40
    @State private var ebYanlisSayisi: Double = 0
    
    @State private var sonuc2022: Double = 0
    @State private var sonucEB2022: Double = 0
    @State private var sonuc2023: Double = 0
    @State private var sonucEB2023: Double = 0
    @State private var isShowingSheet = false

    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", value: $gyDogruSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(gyYanlisSayisi, specifier: "%.0f")", value: $gyYanlisSayisi, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                    
                } header: {
                    Text("Genel Yetenek")
                        .bold()
                        .foregroundStyle(.main)
                        .textCase(.none)
                } footer: {
                    if(gyDogruSayisi + gyYanlisSayisi > 60){
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", value: $gkDogruSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", value: $gkYanlisSayisi, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                    
                } header: {
                    Text("Genel Kültür")
                        .bold()
                        .foregroundStyle(.main)

                        .textCase(.none)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60){
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper("Doğru Sayısı: \(ebDogruSayisi, specifier: "%.0f")", value: $ebDogruSayisi, in: 1...80)
                        .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(ebYanlisSayisi, specifier: "%.0f")", value: $ebYanlisSayisi, in: 0...80)
                        .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        
                        sonucEB2022   = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                        sonuc2022     = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                        sonucEB2023   = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                        sonuc2023     = 51.209 + gyNet * 0.537 + gkNet * 0.418
                        
                        isShowingSheet.toggle()
                    }
                    .disabled(formKonrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: nil, sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil)
                    }
                    
                } header: {
                    Text("Eğitim Bilimleri")
                        .bold()
                        .foregroundStyle(.main)
                        .textCase(.none)
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 80){
                        Text("Toplam doğru ve yanlış sayıları 80'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .navigationTitle("Eğitim Bilimleri")
    }
    
    var formKonrol: Bool {
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60 || (ebDogruSayisi + ebYanlisSayisi) > 80){
            return true
        }
        return false
    }
}

#Preview {
    EgitimBilimleriView()
}

