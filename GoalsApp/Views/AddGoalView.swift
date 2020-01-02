//
//  AddGoalView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI
import RealmSwift

struct AddGoalView: View {
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
            CustomTextField(placeholder: "Describe your goal...", text: $title)
            Spacer()
        }
        .padding()
        .background(Theme.background)
    }
}
