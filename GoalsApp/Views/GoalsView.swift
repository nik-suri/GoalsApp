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
                goal.creationDate.map({
                    ThemeText(content: "Created \($0.shortDateTime)")
                })
                Spacer()
                goal.creationDate.map({
                    ThemeText(content: "Active \(Date().offsetString(from: $0))")
                })
            }
        }
    }
}

private struct GoalsList: View {
    var showActive: Bool
    
    init(showActive: Bool) {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        self.showActive = showActive
    }
    
    var goals: Results<Goal>? {
        do {
            let realm = try Realm()
            let result = realm.objects(Goal.self)
            print(result)
            return result
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    var body: some View {
        goals.map({
            List($0) { goal in
               if self.showActive && !goal.complete {
                    GoalRow(goal: goal)
                } else if !self.showActive && goal.complete {
                    GoalRow(goal: goal)
                }
            }
        })
    }
}

struct GoalsView: View {
    @State private var showActive = true
        
    var body: some View {
        VStack {
            HeaderView(showActive: $showActive)
            GoalsList(showActive: showActive)
            Spacer()
        }
        .padding()
    }
}
