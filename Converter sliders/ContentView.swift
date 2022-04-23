//
//  ContentView.swift
//  Converter sliders
//
//  Created by Tim Randall on 23/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            ZStack{
                Background()
                VStack{
                    
                }
            }
        }
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
