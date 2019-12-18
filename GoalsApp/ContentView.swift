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
                    Button(action: {
                        print("menu tapped")
                    }) {
                        Image(systemName: "list.dash")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    Spacer()
                    Button(action: {
                        print("add goal tapped")
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                }
                VStack {
                    Text("Phrase of the Day:")
                        .font(.title)
                        .colorInvert()
                    Text("Total commitment to the action, total equanimity to the outcome.")
                        .font(.headline)
                        .colorInvert()
                    Spacer()
                }
                HStack {
                    Circle().stroke(Color.yellow, lineWidth: 4).shadow(radius: 10)
                    Circle().stroke(Color.yellow, lineWidth: 4).shadow(radius: 10)
                }
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
