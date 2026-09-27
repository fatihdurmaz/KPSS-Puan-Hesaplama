//
//  Result.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 12.02.2024.
//

import Foundation
import SwiftData

@Model
class Result: Identifiable {
    
    @Attribute(.unique) var id = UUID()
    var sinavAdi: String
    var gyNet: Double
    var gkNet: Double
    var ebNet: Double?
    var oabtNet: Double?
    var tarih = Date()
    var sonuc: Double
    
    init(sinavAdi: String, gyNet: Double, gkNet: Double, ebNet: Double? = nil, oabtNet: Double? = nil, sonuc: Double) {
        self.sinavAdi = sinavAdi
        self.gyNet = gyNet
        self.gkNet = gkNet
        self.ebNet = ebNet
        self.oabtNet = oabtNet
        self.sonuc = sonuc
    }
}
