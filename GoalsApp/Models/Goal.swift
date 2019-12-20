//
//  Goal.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct Goal: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var creationDate: Date
    var complete: Bool
}
