//
//  OrtaogretimView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    
    @State private var gyDogruSayisi:Double = 30
    @State private var gyYanlisSayisi: Double = 0
    @State private var gkDogruSayisi: Double = 30
    @State private var gkYanlisSayisi: Double = 0
    
    @State private var sonuc: Double = 0
    
    var body: some View {
        VStack {
            
            Form {
                Section {
                    Stepper(value: $gyDogruSayisi,in: 1...60) {
                        Label("Doğru Sayısı: \(gyDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }                   
                    .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    
                    Stepper(value: $gyYanlisSayisi,in: 1...60) {
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
                    Stepper(value: $gkDogruSayisi,in: 1...60) {
                        Label("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                    .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    
                    Stepper(value: $gkYanlisSayisi,in: 1...60) {
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
                            .transition(/*@START_MENU_TOKEN@*/.identity/*@END_MENU_TOKEN@*/)
                    }
                }
                
                Section {
                    Text("2022 KPSS Puanı: \(sonuc, specifier: "%.3f")")
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        
                        withAnimation {
                            sonuc = 55.839 + gyNet * 0.348 + gkNet * 0.431
                        }
                        
                    }
                    .disabled(formKonrol)
                    .sensoryFeedback(.success, trigger: sonuc)
                } header: {
                    Text("Sonuç")
                        .bold()
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Ortaöğretim")
    }
    
    var formKonrol: Bool {
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi) > 60){
            return true
        }
        return false
    }
}

#Preview {
    OrtaogretimView()
}


