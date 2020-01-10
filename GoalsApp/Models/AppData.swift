//
//  AppData.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/4/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class AppData: ObservableObject {
    @Published var goals: Results<Goal>
    @Published var phrases: Results<Phrase>
    
    private var goalsToken: NotificationToken?
    private var phrasesToken: NotificationToken?

    init() {
        let realm = try! Realm()
        goals = realm.objects(Goal.self)
        phrases = realm.objects(Phrase.self)
        
        let goals = realm.objects(Goal.self)
        let phrases = realm.objects(Phrase.self)
        
        goalsToken = goals.observe { _ in
            self.goals = goals
        }
        phrasesToken = phrases.observe { _ in
            self.phrases = phrases
        }
    }
    
    deinit {
        goalsToken?.invalidate()
        phrasesToken?.invalidate()
    }
}
