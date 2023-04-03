//
//  calculatorView.swift
//  bmi-calculator
//
//  Created by Kevin Christanto on 20/03/23.
//

import SwiftUI

struct calculatorView: View {
    
    @Binding var weight: Double
    @Binding var height: Double
    @Binding var savedHistories: [bmi]
    
    var body: some View {
        VStack{
            HStack{
                Text("Weight (kg)")
                    .font(.title3)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g kg", weight.rounded()))")
                    //remove trailing zeroes and rounded
                    .font(.title)
                    .bold()
            }
            
            //$ artinya dipinjemin datanya ke view lain
            //contoh: weight -> content view tapi ditampilkan di view slider
            
            Slider(value: $weight, in: 45...100){
                
            }
            
            HStack{
                Text("Height (cm)")
                    .font(.title3)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(String(format: "%g cm", height.rounded()))")
                    .font(.title)
                    .bold()
            }.padding(.top, 20)

            Slider(value: $height, in: 120...200){
            }
            
            HStack{
                
                Text("Your Body Mass Index")
                    .padding(.top, 30)
                    .foregroundColor(.gray)
                    .font(.title3)
                
                Spacer()
                    
                VStack{
                    
                    Text(String(format: "%.2f", calculate(weight: weight, height: height)))
                        .font(.title)
                        .bold()
                     Text("\(colorBMI(weight: weight, height: height))")
                        .font(.body)
                        .foregroundColor(.green)
                }.padding(.top, 20)
            }
    
            Button {
                print("save")
                let rslt = calculate(weight: weight, height: height)
                print("\(rslt)")
                let newBMI = bmi(date: Date(), result: rslt)
                savedHistories.append(newBMI)
                
            } label: {
                Text("Save to history")
                    .frame(maxWidth: .infinity, maxHeight: 32)
            }
            .background(.blue)
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .cornerRadius(11)
            .padding(.top, 20)
                
            Spacer()
        }
        .padding()
    }
    

    
}
func calculate (weight: Double, height: Double) -> Double {
    return weight * 10_000 / (height * height)
}

func colorBMI (weight: Double, height: Double) -> Text {
    var bmiColor: Color = .black
    let bmiIndex = calculate(weight: weight, height: height)
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

struct calculatorView_Previews: PreviewProvider {
    static var previews: some View {
        calculatorView(weight: .constant(70), height: .constant(120), savedHistories: .constant([
            bmi(date: Date(), result: 20.0),
            bmi(date: Date(), result: 20.0),
            bmi(date: Date(), result: 20.0),
                ]))
    }
}
