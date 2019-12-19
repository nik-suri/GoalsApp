//
//  ThemeText.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct ThemeText: View {
    var content: String
    
    var body: some View {
        Text(content).colorInvert()
    }
}
