//
//  AddGoalView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
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
                    .foregroundColor(Color.white.opacity(0.6))
                    .font(.headline)
            }
            TextField("", text: $text)
                .foregroundColor(.white)
                .font(.headline)
                .lineLimit(nil)
        }
    }
}

struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

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
            CustomTextField(placeholder: "Describe your goal...",
                            text: self.$title)
            Spacer()
        }
        .padding()
        .background(Color.gray)
    }
}
