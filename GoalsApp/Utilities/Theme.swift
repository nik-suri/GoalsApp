//
//  Theme.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI

final class Theme {
    static let primary = Color.black.opacity(0.8)
    static let tertiary = Color.gray.opacity(0.6)
    
    struct ThemeText: View {
        var content: String
        
        var body: some View {
            Text(content).foregroundColor(primary)
        }
    }
}
