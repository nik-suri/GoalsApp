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
            CircleImage(image: Image(systemName: "plus"))
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
        }
    }
}

private struct ProgressView: View {
    @State private var showStroke = false
    
    var body: some View {
        HStack {
            GoalCircle(endAngleTarget: 310)
            Spacer()
            GoalCircle(endAngleTarget: 360)
//            Circle()
//                .stroke(Color.yellow, lineWidth: showStroke ? 10 : 0)
//                .onAppear() {
//                    withAnimation(.spring()) {
//                        self.showStroke.toggle()
//                    }
//                }
//                .overlay(
//                     VStack {
//                        Theme.ThemeText(content: "4")
//                             .font(.headline)
//                        Theme.ThemeText(content: "goals active")
//                             .font(.subheadline)
//                     })
//            Spacer()
//            Circle()
//                .stroke(Color.yellow, lineWidth: 10)
//                .overlay(
//                     VStack {
//                        Theme.ThemeText(content: "8")
//                             .font(.headline)
//                        Theme.ThemeText(content: "goals accomplished")
//                             .font(.subheadline)
//                     })
        }
        .padding()
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                PhraseView()
                ProgressView()
                Spacer()
                AddButton()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
