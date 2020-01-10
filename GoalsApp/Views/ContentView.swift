//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            GoalsView().tabItem {
                Image(systemName: "list.dash")
                Text("Goals")
            }.environmentObject(appData)
            PhrasesView().tabItem {
                Image(systemName: "quote.bubble")
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
