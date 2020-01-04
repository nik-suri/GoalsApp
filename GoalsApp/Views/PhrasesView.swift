//
//  PhrasesView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI
import RealmSwift

private struct PhraseRow: View {
    var phrase: Phrase
    
    var body: some View {
        VStack(alignment: .leading) {
            Theme.ThemeText(content: phrase.content)
                .font(.headline)
            Theme.ThemeText(content: phrase.author)
                .font(.subheadline)
        }
    }
}

private struct PhrasesList: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none

        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        List(Query.phrases) { phrase in
            PhraseRow(phrase: phrase)
        }
    }
}

struct PhrasesView: View {
    var body: some View {
        NavigationView {
            VStack {
                PhrasesList()
                Spacer()
            }
            .padding()
            .navigationBarTitle("My Phrases")
        }
    }
}

struct PhrasesView_Previews: PreviewProvider {
    static var previews: some View {
        PhrasesView()
    }
}
