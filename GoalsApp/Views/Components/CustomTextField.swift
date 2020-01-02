//
//  CustomTextField.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/1/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Theme.tertiary)
                    .font(.headline)
            }
            TextField("", text: $text)
                .foregroundColor(Theme.primary)
                .font(.headline)
        }
    }
}
