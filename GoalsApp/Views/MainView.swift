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
    @Environment(\.presentationMode) private var presentationMode
    @State private var title = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Text("Cancel")
                        .foregroundColor(.yellow)
                }
                Spacer()
                ThemeText(content: "New Goal")
                    .font(.headline)
                Spacer()
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
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Save")
                        .foregroundColor(.yellow)
                }
            }
            CustomTextField(placeholder: "Describe your goal...",
                            text: self.$title)
            Spacer()
        }
        .padding()
        .background(Color.gray)
    }
}

private struct HeaderView: View {
    private enum ActiveSheet {
        case goal
        case phrase
    }
    
    @State private var showActionSheet: Bool = false
    @State private var showAddSheet: Bool = false
    @State private var activeSheet: ActiveSheet = .goal
    
    var body: some View {
        HStack {
            Spacer()
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
                    Text("Phrase View")
                }
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
