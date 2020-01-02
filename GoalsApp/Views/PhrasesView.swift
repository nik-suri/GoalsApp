//
//  PhrasesView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct PhrasesView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Phrases")
                Spacer()
            }
            .padding()
            .navigationBarTitle("My Phrases")
        }
    }
}
