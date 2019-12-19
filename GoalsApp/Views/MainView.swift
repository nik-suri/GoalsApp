//
//  MainView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
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
            ThemeText(content: "Phrase of the Day:")
                .font(.title)
            Spacer()
            ThemeText(content: "Total commitment to the action, total equanimity to the outcome.")
                .font(.headline)
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
                    ThemeText(content: "8")
                         .font(.headline)
                    ThemeText(content: "goals accomplished")
                         .font(.subheadline)
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
