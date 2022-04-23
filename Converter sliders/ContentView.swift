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
                }
            }
        }
    }
    func meters2Feet(input: Double) -> String {
        let num = input * 3.280839895
        let remainder = num.truncatingRemainder(dividingBy: 1)
        let inches: Double = remainder * 12
        return String(format: "%.0f", num) + " Feet and " + String(format: "%.0f", inches) + " Inches"
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
        Text(words).padding()
            .foregroundColor(.black)
            .font(.system(size: 24, weight: .bold))
    }
}

struct TextWidget: View {
    var words: String
    var body: some View {
        Text(words).padding()
            .foregroundColor(.black)
            .font(.system(size: 14))
    }
}
