//
//  ContentView.swift
//  Converter sliders
//
//  Created by Tim Randall on 23/4/22.
//

import SwiftUI

struct ContentView: View {
    @State var celsius: Double = 0
    @State var meters: Double = 0
    @State var meters2: Double = 0
    @State var kilometers: Double = 0
    @State var litres: Double = 0
    @State var kilograms: Double = 10
    var body: some View {
        ScrollView{
            ZStack{
                Background()
                VStack{
                    HeadingWidget(words: "Measurement Converter")
                    Group{
                        Slider(value: $celsius, in: -100...100)
                        HStack{
                            TextWidget(words: String(format: "%.2f", celsius) + " Celsius")
                            Spacer()
                            TextWidget(words: String(format: "%.2f", celsius * 1.8 + 32.0) + " Fahrenheit")
                        }
                    }
                    Group{
                        Slider(value: $meters, in: 0...50)
                        HStack{
                            TextWidget(words: String(format: "%.2f", meters) + " Meters")
                            Spacer()
                            TextWidget(words: String(format: "%.2f", meters * 0.9144) + " Yards")
                        }
                    }
                    Group{
                        Slider(value: $meters2, in: 0...10)
                        HStack{
                            TextWidget(words: String(format: "%.2f", meters2) + " Meters")
                            Spacer()
                            TextWidget(words: meters2Feet(input: meters2))
                        }
                    }
                    Group{
                        Slider(value: $kilometers, in: 0...100)
                        HStack{
                            TextWidget(words: String(format: "%.2f", kilometers) + " Kilometers")
                            Spacer()
                            TextWidget(words: String(format: "%.2f", kilometers * 1.609344) + " Miles.")
                        }
                    }
                    Group{
                        Slider(value: $litres, in: 0...10)
                        HStack{
                            TextWidget(words: String(format: "%.2f", litres) + " Litres")
                            Spacer()
                            TextWidget(words: litresToOld(input: litres))
                        }
                    }
                    Group{
                        Slider(value: $kilograms, in: 0...100)
                        HStack{
                            TextWidget(words: String(format: "%.2f", kilograms) + " Kilograms")
                            Spacer()
                            TextWidget(words: kilosToOld(input: kilograms))
                        }
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    func meters2Feet(input: Double) -> String {
        let num = input * 3.280839895
        let remainder = num.truncatingRemainder(dividingBy: 1)
        let inches: Double = remainder * 12
        return String(format: "%.0f", num) + " Feet and " + String(format: "%.0f", inches) + " Inches"
    }
    
    func litresToOld(input: Double) -> String {
        let gallons = input / 3.785
        let gallonsRemainder = gallons.truncatingRemainder(dividingBy: 3.785)
        let quarts = gallonsRemainder / 0.946353
        return String(format: "%.0f", gallons) + " Gallons, " + String(format: "%.2f", quarts) + " Quarts"
    }
    func kilosToOld(input: Double) -> String {
        let stone = input / 6.35
        let stoneRemainder = stone.truncatingRemainder(dividingBy: 6.35)
        let pounds = stoneRemainder / 0.453592
        return String(format: "%.0f", stone) + " Stone " + String(format: "%.2f", pounds) + " Pounds"
    }
}

struct Background: View {
    var body: some View {
        Color("bgcolor")
    }
}

struct HeadingWidget: View {
    var words: String
    var body: some View {
        Text(words).padding(EdgeInsets(top: 50, leading: 10, bottom: 10, trailing: 10))
            .foregroundColor(.black)
            .font(.system(size: 24, weight: .bold))
    }
}

struct TextWidget: View {
    var words: String
    var body: some View {
        Text(words).padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .foregroundColor(.black)
            .font(.system(size: 14))
    }
}
