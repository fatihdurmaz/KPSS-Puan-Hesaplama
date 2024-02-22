//
//  ResultView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI
import SwiftData
import Lottie

struct ResultView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Result.tarih, order: .reverse) private var results: [Result]
    @Binding var selectionTabItem: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        ForEach(results){ result in
                            VStack(alignment: .leading) {
                                Text(result.sinavAdi)
                                    .bold()
                                    .font(.headline)
                                HStack {
                                    HStack(alignment: .top){
                                        Text("Genel Yetenek:")
                                        Text(result.gyNet.formatted())
                                    }
                                    Spacer()
                                    HStack(alignment: .top){
                                        Text("ÖABT:")
                                        Text((result.oabtNet ?? 0).formatted())
                                    }
                                }
                                
                                HStack {
                                    HStack{
                                        Text("Genel Kültür:")
                                        Text(result.gyNet.formatted())
                                    }
                                    Spacer()
                                    HStack{
                                        Text("Eğitim Bilimleri:")
                                        Text((result.ebNet ?? 0).formatted())
                                    }
                                }
                                
                                HStack {
                                    Text("Puan:")
                                    Text(result.sonuc.formatted())
                                        .bold()
                                        .italic()
                                }
                                
                                HStack {
                                    Spacer()
                                    Text(result.tarih.formatted(date:.complete, time:.omitted))
                                        .italic()
                                        .font(.footnote)
                                }
                                
                            }
                        }
                        .onDelete{ indexSet in
                            for index in indexSet{
                                modelContext.delete(results[index])
                            }
                        }
                    } header: {
                        Text("")
                    }
                    
                }
                .overlay{
                    if results.isEmpty {
                        ContentUnavailableView {
                            Label("Sonuç Bulunamadı", systemImage: "magnifyingglass")
                                .labelStyle(.titleOnly)
                        } description: {
                            VStack {
                                Text("Puan hesaplamaya başlamak için lütfen başlangıç sekmesini kullanın.")
                                    .italic()
                                
                                LottieView(animation: .named("notfound"))
                                    .looping()
                                    .frame(width: 250, height: 250)
                                    .shadow(radius: 10)
                                
                            }
                            
                        } actions: {
                            Button("KPSS Puan Hesaplaması Yap"){
                                selectionTabItem = 0
                            }
                            .bold()
                            .font(.title3)
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Hesaplamalar")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    ResultView(selectionTabItem: .constant(1))
}
