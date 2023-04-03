//
//  ContentView.swift
//  bmi-calculator
//
//  Created by Kevin Christanto on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    //private biar digunain dalam content view doang, ga ngeganggu view lain
    
    //wrapper
    //state, kalau values nya berubah, maka data nya akan di renew -> nilai nya milik content view
    //binding, static -> nilai nya diambil dari view yang manggil (dipass dari view lain)
    
    @State private var index = 0
    @State private var weight = 70.0
    @State private var height = 120.0
    @State private var savedHistories = [
        bmi(date: Date(), result: 24.22)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("index", selection: $index) {
                    Text("Calculator").tag(0)
                    Text("History").tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
                
                if index == 0 {
                    calculatorView(weight: $weight, height: $height, savedHistories: $savedHistories)
                }
                
                else {
                    historyView(savedHistories: $savedHistories)
                }
            } .navigationTitle("Body Mass Index")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
