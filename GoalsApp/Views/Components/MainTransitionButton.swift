//
//  MainTransitionButton.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct MainTransitionButton: View {
    @Binding var bind: Bool
    
    var showGoals: Bool
    var text: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 1)) {
                self.bind = self.showGoals
            }
        }) {
            Text(text)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(40)
                .shadow(radius: 10)
        }
    }
}
