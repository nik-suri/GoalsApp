//
//  GoalsView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

private struct HeaderView: View {
    @Binding var showActive: Bool
    
    init(showActive: Binding<Bool>) {
        UISegmentedControl.appearance().selectedSegmentTintColor = .gray
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor.yellow],
            for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .normal)
        
        self._showActive = showActive
    }
    
    var body: some View {
        VStack {
            HStack {
                ThemeText(content: "My Goals")
                    .font(.title)
                Spacer()
            }
            Picker("Test", selection: $showActive) {
                Text("Active").font(.headline).tag(true)
                Text("Complete").font(.headline).tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
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
                ThemeText(content: "Created \(goal.creationDate.shortDateTime)")
                Spacer()
                ThemeText(content: "Active \(Date().offsetString(from: goal.creationDate))")
            }
        }
    }
}

private let goalData = [
    Goal(id: 0,
         title: "Pip A",
         creationDate: Date(),
         complete: false),
    Goal(id: 1,
         title: "Complete themelab with Sean",
         creationDate: Date(),
         complete: false),
    Goal(id: 2,
         title: "Pip B",
         creationDate: Date(),
         complete: true),
    Goal(id: 3,
         title: "Cricket/women's squash mixer",
         creationDate: Date(),
         complete: true)
]

private struct GoalsList: View {
    var showActive: Bool
    
    init(showActive: Bool) {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        self.showActive = showActive
    }
    
    var body: some View {
        List {
            ForEach(goalData) { goal in
                if self.showActive && !goal.complete {
                    GoalRow(goal: goal)
                } else if !self.showActive && goal.complete {
                    GoalRow(goal: goal)
                }
            }
        }
    }
}

struct GoalsView: View {
    @State private var showActive = true
    
    @Binding var showGoals: Bool
    
    var body: some View {
        VStack {
            MainTransitionButton(bind: $showGoals,
                                 showGoals: false,
                                 text: "Go back")
            HeaderView(showActive: $showActive)
            GoalsList(showActive: showActive)
            Spacer()
        }
        .padding()
    }
}
