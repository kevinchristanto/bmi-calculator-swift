//
//  historyView.swift
//  bmi-calculator
//
//  Created by Kevin Christanto on 20/03/23.
//

import SwiftUI

struct historyView: View {
    
    @Binding var savedHistories: [bmi]
    
    
    var body: some View {
        List(savedHistories) {
            bmi in
            VStack (alignment: .leading) {
                Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                    .foregroundColor(.gray)
                
                HStack{
                    colorBMI(bmiIndex: bmi.result)
//                    Text("\(bmi.result)")
//                        .font(.title)
//                        .bold()
//                    Spacer()
//                    Text("")
//                        .font(.title2)
                }
                .padding(.top, 4)
            }
        }
    }
}

struct historyView_Previews: PreviewProvider {
    static var previews: some View {
        historyView(
            savedHistories: .constant([bmi(date: Date(), result: 12.52)])
        )
    }
}

func colorBMI (bmiIndex: Double) -> Text {
    var bmiColor: Color = .black
    var status: String = ""
    
    if bmiIndex < 18.5 {
        bmiColor = .gray
        status = "Underweight"
    } else if bmiIndex >= 18.5 && bmiIndex <= 25 {
        bmiColor = .green
        status = "Normal"
    } else if bmiIndex >= 25 && bmiIndex <= 30 {
        bmiColor = .orange
        status = "Overweight"
    } else if bmiIndex > 30 {
        bmiColor = .red
        status = "Obese"
    }
    
    return Text(status)
        .foregroundColor(bmiColor)
}

