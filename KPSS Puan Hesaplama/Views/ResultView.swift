//
//  ResultView.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 30.01.2024.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(0 ..< 50) { item in
                    Text("Hesaplama \(item)")
                    
                }
            }
            .navigationTitle("Geçmiş Hesaplamalar")
        }
    }
}

#Preview {
    ResultView()
}
