//
//  GoalsView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

private struct HeaderView: View {
    var body: some View {
        HStack {
            ThemeText(content: "My Goals")
                .font(.title)
            Spacer()
            Button(action: { print("show active tapped") }) {
                Text("Active")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            ThemeText(content: "|")
            Button(action: { print("show completed tapped") }) {
                Text("Complete")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

private struct GoalRow: View {
    var goal: Goal
    
    var body: some View {
        VStack(alignment: .leading) {
            ThemeText(content: goal.title)
                .font(.headline)
            HStack {
                ThemeText(content: "Created \(goal.creationDate)")
                    .font(.headline)
                ThemeText(content: "Active \(20) days")
            }
        }
    }
}

private struct GoalsList: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List {
            GoalRow(goal: Goal(id: 0, title: "Pip A", creationDate: Date()))
            GoalRow(goal: Goal(id: 1, title: "Complete themelab with Sean", creationDate: Date()))
        }
    }
}

struct GoalsView: View {
    @Binding var showGoals: Bool
    
    var body: some View {
        VStack {
            MainTransitionButton(bind: self.$showGoals,
                                 showGoals: false,
                                 text: "Go back")
            HeaderView()
            GoalsList()
            Spacer()
        }
        .padding()
    }
}
