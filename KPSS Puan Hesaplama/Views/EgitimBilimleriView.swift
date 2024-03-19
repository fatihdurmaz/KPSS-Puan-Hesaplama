//
//  EgitimBilimleriView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    @Environment(\.modelContext) private var modelContext
    
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
    
    private let adCoordinator = AdCoordinator.shared
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper( value: $gyDogruSayisi, in: 1...60){
                        Label("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    Stepper(value: $gyYanlisSayisi, in: 0...60){
                        Label("Yanlış Sayısı: \(gyYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                    
                } header: {
                    Text("Genel Yetenek")
                        .bold()
                        .textCase(.none)
                } footer: {
                    if(gyDogruSayisi + gyYanlisSayisi > 60){
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper(value: $gkDogruSayisi, in: 1...60){
                        Label("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    
                    Stepper(value: $gkYanlisSayisi, in: 0...60){
                        Label("Yanlış Sayısı: \(gkYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                } header: {
                    Text("Genel Kültür")
                        .bold()
                        .textCase(.none)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60){
                        Text("Toplam doğru ve yanlış sayıları 60'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper(value: $ebDogruSayisi, in: 1...80){
                        Label("Doğru Sayısı: \(ebDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                    
                    Stepper(value: $ebYanlisSayisi, in: 0...80){
                        Label("Yanlış Sayısı: \(ebYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        
                        sonucEB2022   = Constants.eb2022Puan + gyNet * Constants.eb2022GYKatsayi + gkNet * Constants.eb2022GKKatsayi + ebNet * Constants.eb2022Katsayi
                        sonuc2022     = Constants.lisans2022Puan + gyNet * Constants.lisans2022GYKatsayi + gkNet * Constants.lisans2022GKKatsayi
                        sonucEB2023   = Constants.eb2023Puan + gyNet * Constants.eb2023GYKatsayi + gkNet * Constants.eb2023GKKatsayi + ebNet * Constants.eb2023Katsayi
                        sonuc2023     = Constants.lisans2023Puan + gyNet * Constants.lisans2023GYKatsayi + gkNet * Constants.lisans2023GKKatsayi
                        
                        isShowingSheet.toggle()
                        
                        // SwiftData
                        let result2022EB = Result(sinavAdi: "2022 Eğitim Bilimleri", gyNet: gyNet, gkNet: gkNet, ebNet: ebNet, sonuc: sonucEB2022)
                        let result2023EB = Result(sinavAdi: "2023 Eğitim Bilimleri", gyNet: gyNet, gkNet: gkNet, ebNet: ebNet, sonuc: sonucEB2023)
                        
                        modelContext.insert(result2022EB)
                        modelContext.insert(result2023EB)
                        
                        // Admob
                        
                    }
                    .disabled(formKonrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: nil, sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil)
                    }
                    
                } header: {
                    Text("Eğitim Bilimleri")
                        .bold()
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

