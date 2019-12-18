//
//  GoalsView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct GoalsView: View {
    @Binding var showGoals: Bool
    
    var body: some View {
        VStack {
            Text("This is the goals view").colorInvert()
            Text("this is another line in the goals view").colorInvert()
            MainTransitionButton(bind: self.$showGoals,
                                 showGoals: false,
                                 text: "Go back")
            Spacer()
        }
        .padding()
    }
}
