//
//  bmi.swift
//  bmi-calculator
//
//  Created by Kevin Christanto on 20/03/23.
//

import Foundation


struct bmi: Identifiable {
    let id = UUID()
    let date: Date
    let result: Double
}


//identifieable bikin dia unik tersendiri dalam setiap list -> contoh nya di history (protocol in swift)
