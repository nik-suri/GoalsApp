//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/17/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    ActionButton(button: .menu)
                    Spacer()
                    ActionButton(button: .addGoal)
                }
                VStack {
                    Text("Phrase of the Day:")
                        .font(.title)
                        .colorInvert()
                    Spacer()
                    Text("Total commitment to the action, total equanimity to the outcome.")
                        .font(.headline)
                        .colorInvert()
                    Spacer()
                }
                GeometryReader { geometry in
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
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                }
                ActionButton(button: .viewGoals)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
