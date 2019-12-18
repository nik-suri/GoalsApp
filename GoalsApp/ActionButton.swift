//
//  ActionButton.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/17/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

enum ActionButtonType {
    case menu
    case addGoal
    case viewGoals
}

struct ActionButton: View {
    var button: ActionButtonType
    
    var body: some View {
        switch button {
        case .menu:
            return AnyView(Button(action: { print("menu tapped") }) {
                CircleImage(image: Image(systemName: "list.dash"))
            })
        case .addGoal:
            return AnyView(Button(action: { print("add goal tapped") }) {
                CircleImage(image: Image(systemName: "plus"))
            })
        case .viewGoals:
            return AnyView(Button(action: { print("view goals tapped") }) {
                Text("See your goals")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(40)
                    .shadow(radius: 10)
            })
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(button: .menu)
    }
}
