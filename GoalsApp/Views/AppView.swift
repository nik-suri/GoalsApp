//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/17/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                ContentView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
