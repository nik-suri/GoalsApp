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
}

struct ActionButton: View {
    var button: ActionButtonType
    
    var body: some View {
        switch button {
        case .menu:
            return Button(action: { print("menu tapped") }) {
                CircleImage(image: Image(systemName: "list.dash"))
            }
        case .addGoal:
            return Button(action: { print("add goal tapped") }) {
                CircleImage(image: Image(systemName: "plus"))
            }
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(button: .menu)
    }
}
