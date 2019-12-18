//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/17/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

private struct HeaderView: View {
    var body: some View {
        HStack {
            Button(action: { print("menu tapped") }) {
                CircleImage(image: Image(systemName: "list.dash"))
            }
            Spacer()
            Button(action: { print("add goal tapped") }) {
                CircleImage(image: Image(systemName: "plus"))
            }
        }
    }
}

private struct PhraseView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Phrase of the Day:")
                .font(.title)
                .colorInvert()
            Spacer()
            Text("Total commitment to the action, total equanimity to the outcome.")
                .font(.headline)
                .colorInvert()
            Spacer()
        }
    }
}

private struct ProgressView: View {
    var body: some View {
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
    }
}

struct MainView: View {
    @Binding var showGoals: Bool
    
    var body: some View {
        VStack {
            HeaderView()
            PhraseView()
            GeometryReader { geometry in
                    ProgressView()
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
            }
            MainTransitionButton(bind: self.$showGoals,
                                 showGoals: true,
                                 text: "See your goals")
        }
        .padding()
    }
}

struct GoalsView: View {
    @Binding var showGoals: Bool
    
    var body: some View {
        VStack {
            Text("This is the goals view").colorInvert()
            Text("this is another line in the goals view").colorInvert()
            MainTransitionButton(bind: self.$showGoals,
                                 showGoals: false,
                                 text: "Go back")
            Spacer()
        }
        .padding()
    }
}

extension AnyTransition {
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
