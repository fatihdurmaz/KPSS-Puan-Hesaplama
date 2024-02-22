//
//  CalculateViewModel.swift
//  KPSS Puan Hesaplama
//
//  Created by Fatih Durmaz on 22.02.2024.
//

import Foundation
import Observation
import SwiftUI

@Observable
class CalculateViewModel {
    
    @ObservationIgnored @AppStorage("calculateCount") var calculateCount = 1
    @ObservationIgnored @AppStorage("openCount") var openCount = 0
}
