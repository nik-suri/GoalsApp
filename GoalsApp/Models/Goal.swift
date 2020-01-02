//
//  Goal.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import Foundation
import RealmSwift

class Goal: Object, Identifiable {
    @objc dynamic var title = ""
    @objc dynamic var creationDate: Date? = nil
    @objc dynamic var complete = false
}
