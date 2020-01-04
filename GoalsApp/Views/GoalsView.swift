//
//  GoalsView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI
import RealmSwift

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
            Picker("Test", selection: $showActive) {
                Text("Active").tag(true)
                Text("Complete").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

private struct GoalRow: View {
    var goal: Goal
    
    var body: some View {
        VStack(alignment: .leading) {
            Theme.ThemeText(content: goal.title)
                .font(.headline)
            goal.creationDate.map({
                Theme.ThemeText(content: "Created \($0.shortDateTime)")
            })
            goal.creationDate.map({
                    Theme.ThemeText(content: "Active \(Date().offsetString(from: $0))")
            })
        }
    }
}

private struct GoalsList: View {
    @Binding var showActive: Bool
    
    init(showActive: Binding<Bool>) {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        
        UITableViewCell.appearance().backgroundColor = .clear
        
        self._showActive = showActive
    }
    
    var body: some View {
        List(Query.goals) { goal in
           if self.showActive && !goal.complete {
                GoalRow(goal: goal)
            } else if !self.showActive && goal.complete {
                GoalRow(goal: goal)
            }
        }
    }
}

struct GoalsView: View {
    @State private var showActive = true
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(showActive: $showActive)
                GoalsList(showActive: $showActive)
                Spacer()
            }
            .padding()
            .navigationBarTitle(Text("My Goals"))
        }
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
