//
//  GoalDetail.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/9/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct GoalDetail: View {
    var goal: Goal
    
    var body: some View {
        VStack {
            Theme.ThemeText(content: "\(goal.title)")
            Theme.ThemeText(content: "\(String(describing: goal.creationDate))")
            Theme.ThemeText(content: "\(String(describing: goal.completionDate))")
            Theme.ThemeText(content: "\(goal.complete)")
        }
        .navigationBarTitle(Text("Goal"), displayMode: .inline)
    }
}

struct GoalDetail_Previews: PreviewProvider {
    static var previews: some View {
        GoalDetail(goal: Goal())
    }
}
