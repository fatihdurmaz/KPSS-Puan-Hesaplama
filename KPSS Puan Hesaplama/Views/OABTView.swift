//
//  OABTView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI

struct OABTView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi: Double = 0
    @State private var gkDogruSayisi: Double = 30
    @State private var gkYanlisSayisi: Double = 0
    @State private var ebDogruSayisi: Double = 40
    @State private var ebYanlisSayisi: Double = 0
    @State private var oabtDogruSayisi: Double = 40
    @State private var oabtYanlisSayisi: Double = 0
    
    @State private var sonuc2022: Double = 0
    @State private var sonucEB2022: Double = 0
    @State private var sonucOABT2022: Double = 0
    @State private var sonuc2023: Double = 0
    @State private var sonucEB2023: Double = 0
    @State private var sonucOABT2023: Double = 0
    
    @State private var oabtKatsayi  = 0.4334
    @State private var oabtPuan     = 43.805
    
    @State private var selectedOption = 0
    let options = [
        (0.4334,43.805, "Beden Eğitimi"),
        (0.3666,41.071, "Biyoloji"),
        (0.4301,39.060, "Coğrafya"),
        (0.4052,34.908, "Din Kültürü"),
        (0.3679,42.156, "Edebiyat"),
        (0.5388,39.313, "Fen Bilgisi"),
        (0.3817,41.604, "Fizik"),
        (0.5225,36.309, "İlköğretim Matematik"),
        (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
        (0.3791,40.920, "İngilizce"),
        (0.4542,42.157, "Kimya"),
        (0.4247,41.759, "Lise Matematik"),
        (0.4944,33.292, "Okul Öncesi"),
        (0.4883,29.014, "Rehberlik "),
        (0.6184,33.598, "Sınıf Öğretmenliği"),
        (0.6142,34.101, "Sosyal Bilgiler"),
        (0.3521,41.418, "Tarih"),
        (0.4565,34.329, "Türkçe")
    ]
    
    @State private var isShowingSheet = false
    
    private let adCoordinator = AdCoordinator.shared

    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper(value: $gyDogruSayisi, in: 1...60){
                        Label("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    
                    Stepper(value: $gyYanlisSayisi, in: 0...60) {
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
                
                Section {
                    Picker("Bölüm Seçiniz", selection: $selectedOption) {
                        ForEach(0..<options.count, id: \.self){ index in
                            Text(options[index].2)
                        }
                    }
                    .onChange(of: selectedOption) {
                        oabtKatsayi = options[selectedOption].0
                        oabtPuan = options[selectedOption].1
                    }
                    
                    Stepper(value: $oabtDogruSayisi, in: 1...75){
                        Label("Doğru Sayısı: \(oabtDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: oabtDogruSayisi)
                    
                    Stepper(value: $oabtYanlisSayisi, in: 0...75){
                        Label("Yanlış Sayısı: \(oabtYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: oabtYanlisSayisi)
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        let oabtNet = oabtDogruSayisi - (oabtYanlisSayisi / 4)
                        
                        sonuc2022     = Constants.lisans2022Puan + gyNet * Constants.lisans2022GYKatsayi + gkNet * Constants.lisans2022GKKatsayi
                        sonucEB2022   = Constants.eb2022Puan + gyNet * Constants.eb2022GYKatsayi + gkNet * Constants.eb2022GKKatsayi + ebNet * Constants.eb2022Katsayi
                        sonucOABT2022 = oabtPuan + gyNet * Constants.oabt2022GYKatsayi + gkNet * Constants.oabt2022GKKatsayi + ebNet * Constants.oabt2022GKKatsayi + oabtNet * oabtKatsayi
                        sonuc2023     = Constants.lisans2023Puan + gyNet * Constants.lisans2023GYKatsayi + gkNet * Constants.lisans2023GKKatsayi
                        sonucEB2023   = Constants.eb2023Puan + gyNet * Constants.eb2023GYKatsayi + gkNet * Constants.eb2023GKKatsayi + ebNet * Constants.eb2023Katsayi
                        isShowingSheet.toggle()
                        
                        // SwiftData
                        let result2022OABT = Result(sinavAdi: "2022 ÖABT", gyNet: gyNet, gkNet: gkNet, ebNet: ebNet, oabtNet: oabtNet, sonuc: sonuc2022)
                        modelContext.insert(result2022OABT)
                        
                        // Admob

                    }
                    .disabled(formKonrol)
                    .sensoryFeedback(.success, trigger: sonucOABT2022)
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: sonucOABT2022, sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil)
                    }
                    
                } header: {
                    Text("ÖABT")
                        .bold()
                        .textCase(.none)
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 75){
                        Text("Toplam doğru ve yanlış sayıları 75'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .navigationTitle("ÖABT")
    }
    
    var formKonrol: Bool {
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60 || (ebDogruSayisi + ebYanlisSayisi)  > 80 || (oabtDogruSayisi + oabtYanlisSayisi) > 75){
            return true
        }
        return false
    }
}

#Preview {
    OABTView()
}

