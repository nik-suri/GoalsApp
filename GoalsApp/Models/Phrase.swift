//
//  Phrase.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import Foundation
import RealmSwift

final class Phrase: Object, Identifiable {
    @objc dynamic var content = ""
    @objc dynamic var author = ""
}
