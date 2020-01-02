//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Text("Home")
            }
            GoalsView().tabItem {
                Text("Goals")
            }
            PhrasesView().tabItem {
                Text("Phrases")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
