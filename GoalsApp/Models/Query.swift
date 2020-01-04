//
//  Query.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/4/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class Query {
    static let goals = realm.objects(Goal.self)
    static let phrases = realm.objects(Phrase.self)
}
