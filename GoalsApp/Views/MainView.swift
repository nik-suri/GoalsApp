//
//  MainView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI
import RealmSwift

private struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.white.opacity(0.7))
                    .font(.headline)
            }
            TextField("", text: $text)
                .foregroundColor(.white)
                .font(.headline)
        }
    }
}

private struct AddGoalView: View {
    var onDismiss: () -> ()
    
    @State private var title = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    ThemeText(content: "Add Goal")
                        .font(.title)
                    Spacer()
                }
                CustomTextField(placeholder: "Describe your goal...",
                                text: self.$title)
                Spacer()
                HStack {
                    Spacer()
                    Button(action: { self.onDismiss() }) {
                        Text("Cancel")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    Button(action: {
                        print("confirm")
                        do {
                            let realm = try Realm()
                            let newGoal = Goal()
                            newGoal.title = self.title
                            newGoal.creationDate = Date()
                            try realm.write({
                                realm.add(newGoal)
                                print("success")
                            })
                        } catch {
                            print(error.localizedDescription)
                        }
                    }) {
                        Text("Confirm")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
            }
            .padding()
            .frame(width: geometry.size.width * 3/4, height: geometry.size.height / 4)
            .background(Color.gray)
            .cornerRadius(20)
        }
    }
}

private struct HeaderView: View {
    @State private var addGoalDisplayed = false
    @Binding var showAddGoal: Bool
    
    var body: some View {
        HStack {
            Button(action: { print("menu tapped") }) {
                CircleImage(image: Image(systemName: "list.dash"))
            }
            Spacer()
            Button(action: { self.showAddGoal = true }) {
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
             .stroke(Color.yellow, lineWidth: 10)
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
    @State private var showAddGoal = false
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(showAddGoal: $showAddGoal)
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
            if self.showAddGoal {
                Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                AddGoalView(onDismiss: {
                    self.showAddGoal = false
                })
            }
        }
    }
}
