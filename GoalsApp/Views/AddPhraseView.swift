//
//  AddPhraseView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI
import RealmSwift

struct AddPhraseView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var content = ""
    @State private var author = ""
    
    var body: some View {
        NavigationView {
            VStack {
                CustomTextField(placeholder: "Quote...", text: $content)
                CustomTextField(placeholder: "Author...", text: $author)
                Spacer()
            }
            .padding()
            .navigationBarTitle(Text("New Phrase"), displayMode: .inline)
            .navigationBarItems(
                leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Text("Cancel")
                        .foregroundColor(.yellow)
                },
                trailing:
                Button(action: {
                    do {
                        let newPhrase = Phrase()
                        newPhrase.content = self.content
                        newPhrase.author = self.author
                        try realm.write({
                            realm.add(newPhrase)
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

struct AddPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhraseView()
    }
}
