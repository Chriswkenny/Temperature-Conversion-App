//
//  ContentView.swift
//  Temperature Conversion
//
//  Created by Christopher W. Kenny on 9/17/26.
//

import SwiftUI

struct ContentView:View {
    
    @State private var tempF = ""
    @State private var tempC = ""
    
    enum TemperatureUnits {
        case fahrenheit
        case celsius
    }
    
    func convert(inputTemperature: String, to: TemperatureUnits) -> String {
        switch (to){
        case .celsius:
            if let temperature =
                Double(inputTemperature){
                let celsius = (temperature - 32) * 5/9
                let result = String(format: "%.2f", celsius)
                return result
            }
        case .fahrenheit:
            if let temperature =
                Double(inputTemperature){
                let fahrenheit = (temperature * 9/5) + 32
                let result = String(format: "%.2f", fahrenheit)
                return result
            }
        }
        return "???"
    }
    
    var body: some View {
        VStack {
            Text("Temperature Conversion").font(.largeTitle).bold()
            HStack{
                Text("Fahrenheit: ")
                TextField("", text: $tempF)
                Button("To ºC") {
                    tempC = convert(inputTemperature: tempF, to: .celsius)
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            HStack {
                Text("Celsius: ")
                TextField("", text: $tempC)
                Button("To ºF"){
                    tempF = convert(inputTemperature: tempC, to: .fahrenheit)
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}
    
    #Preview {
        ContentView()
    }

