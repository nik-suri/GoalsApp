//
//  MainView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI
import RealmSwift

private struct AddButton: View {
    private enum ActiveSheet {
        case goal
        case phrase
    }
    
    @State private var showActionSheet: Bool = false
    @State private var showAddSheet: Bool = false
    @State private var activeSheet: ActiveSheet = .goal
    
    var body: some View {
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
                AddPhraseView()
            }
        }
    }
}

private struct PhraseView: View {
    @EnvironmentObject var appData: AppData
    @State private var textOpacity: Double = 0
    
    private var animation: Animation {
        Animation.easeInOut(duration: 1)
            .delay(0.3)
    }
    
//    private let _dayResult = DailyLazyBox<Phrase> {
//        let count = appData.phrases.count
//        if count == 0 {
//            let defaultPhrase = Phrase()
//            defaultPhrase.content = "Daily Quotes will keep you motivated"
//            defaultPhrase.author = "GoalsApp"
//            return defaultPhrase
//        } else {
//            let index = Int.random(in: 0...count - 1)
//            return appData.phrases[index]
//        }
//    }
    
    private var dayResult: Phrase {
//        _dayResult.value
        let count = appData.phrases.count
        if count == 0 {
            let defaultPhrase = Phrase()
            defaultPhrase.content = "Daily Quotes will keep you motivated"
            defaultPhrase.author = "GoalsApp"
            return defaultPhrase
        } else {
            let index = Int.random(in: 0...count - 1)
            return appData.phrases[index]
        }
    }
    
    var body: some View {
        VStack {
            Theme.ThemeText(content: dayResult.content)
                .font(.headline)
                Spacer().frame(height: 20)
            Theme.ThemeText(content: "- \(dayResult.author)")
                .font(.subheadline)
        }
        .opacity(self.textOpacity)
        .onAppear() {
            withAnimation(self.animation) {
                self.textOpacity = 1
            }
        }
    }
}

private struct ProgressView: View {
    @EnvironmentObject var appData: AppData
    
    private var numActive: Int {
        appData.goals.filter("complete = 0").count
    }
    
    private var numComplete: Int {
        appData.goals.filter("complete = 1").count
    }
    
    var body: some View {
        HStack {
            GoalCircle(endAngle: 320,
                       upperText: "\(numActive)",
                       lowerText: "Active")
            Spacer()
            GoalCircle(endAngle: 360,
                       upperText: "\(numComplete)",
                       lowerText: "Accomplished")
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                PhraseView()
                Spacer()
                ProgressView()
                AddButton()
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
