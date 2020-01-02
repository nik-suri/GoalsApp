//
//  MainView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

private struct AddButton: View {
    private enum ActiveSheet {
        case goal
        case phrase
    }
    
    @State private var showActionSheet: Bool = false
    @State private var showAddSheet: Bool = false
    @State private var activeSheet: ActiveSheet = .goal
    
    var body: some View {
        Button(action: { self.showActionSheet = true }) {
            Image(systemName: "plus")
                .font(.largeTitle)
                .foregroundColor(.yellow)
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Add New"), buttons: [
                .default(Text("Goal"), action: {
                    self.showAddSheet = true
                    self.activeSheet = .goal
                }),
                .default(Text("Phrase"), action: {
                    self.showAddSheet = true
                    self.activeSheet = .phrase
                }),
                .cancel(Text("Cancel"))
            ])
        }
        .sheet(isPresented: $showAddSheet) {
            if self.activeSheet == .goal {
                AddGoalView()
            } else {
                AddPhraseView()
            }
        }
    }
}

private struct PhraseView: View {
    var body: some View {
        VStack {
            Theme.ThemeText(content: "Total commitment to the action, total equanimity to the outcome.")
                .font(.headline)
            Spacer()
        }
    }
}

private struct ProgressView: View {
    var body: some View {
        Circle()
             .stroke(Color.yellow, lineWidth: 10)
             .shadow(radius: 10)
             .overlay(
                 VStack {
                    Theme.ThemeText(content: "8")
                         .font(.headline)
                    Theme.ThemeText(content: "goals accomplished")
                         .font(.subheadline)
                 })
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                PhraseView()
                GeometryReader { geometry in
                        ProgressView()
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                }
            }
            .padding()
            .navigationBarTitle(Text("Home"))
            .navigationBarItems(trailing: AddButton())
        }
    }
}
