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
    @State private var complete = false
    
    var body: some View {
        NavigationView {
            VStack {
                CustomTextField(placeholder: "Describe your goal...", text: $title)
                Toggle(isOn: $complete, label: {
                    Text("Complete")
                })
                Spacer()
            }
            .padding()
            .navigationBarTitle(Text("New Goal"), displayMode: .inline)
            .navigationBarItems(
                leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                     Text("Cancel")
                         .foregroundColor(.yellow)
                 },
                trailing:
                Button(action: {
                    do {
                        let newGoal = Goal()
                        newGoal.title = self.title
                        newGoal.creationDate = Date()
                        newGoal.complete = self.complete
                        print(self.complete)
                        print(newGoal)
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
            )
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
    }
}
