//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/17/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

private struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: { print("menu tapped") }) {
                CircleImage(image: Image(systemName: "list.dash"))
            }
            Spacer()
            Button(action: { print("add goal tapped") }) {
                CircleImage(image: Image(systemName: "plus"))
            }
        }
    }
}

private struct PhraseView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Phrase of the Day:")
                .font(.title)
                .colorInvert()
            Spacer()
            Text("Total commitment to the action, total equanimity to the outcome.")
                .font(.headline)
                .colorInvert()
            Spacer()
        }
    }
}

private struct ProgressView: View {
    var body: some View {
        Circle()
             .stroke(Color.yellow, lineWidth: 4)
             .shadow(radius: 10)
             .overlay(
                 VStack {
                     Text("8")
                         .font(.headline)
                         .colorInvert()
                     Text("goals accomplished")
                         .font(.subheadline)
                         .colorInvert()
                 })
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
            GeometryReader { g in
                ScrollView {
                    VStack {
                        HeaderView()
                        PhraseView()
                        GeometryReader { geometry in
                                ProgressView()
                                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                        }
                        Button(action: { print("view goals tapped") }) {
                            Text("See your goals")
                                .padding()
                                .font(.headline)
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .cornerRadius(40)
                                .shadow(radius: 10)
                        }
                    }
                    .padding()
                    .frame(width: g.size.width, height: g.size.height)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
