//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

private extension AnyTransition {
    static var mainViewTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
        let removal = AnyTransition.move(edge: .bottom)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var goalsViewTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .bottom)
        let removal = AnyTransition.move(edge: .top)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView: View {
    @State private var showGoals = false
    
    var body: some View {
        GeometryReader { geometry in
            if self.showGoals {
                GoalsView(showGoals: self.$showGoals)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .transition(.goalsViewTransition)
            } else {
                MainView(showGoals: self.$showGoals)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .transition(.mainViewTransition)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
