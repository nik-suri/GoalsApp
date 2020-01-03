//
//  GoalCircle.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/2/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI

struct CircleRing: Shape {
    var endAngle: Double
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2),
                 radius: rect.size.width / 2,
                 startAngle: .degrees(0),
                 endAngle: .degrees(endAngle),
                 clockwise: false)
        return p.rotation(.degrees(270), anchor: .center).path(in: rect)
    }
    
    var animatableData: Double {
        get { return endAngle }
        set { endAngle = newValue }
    }
}

struct GoalCircle: View {
    var endAngleTarget: Double
    
    @State private var endAngle: Double = 0
    
    var animation: Animation {
        Animation.easeInOut(duration: 1)
            .delay(0.5)
    }
    
    var body: some View {
        CircleRing(endAngle: endAngle)
            .stroke(Color.yellow, lineWidth: 10)
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .onAppear() {
                withAnimation(self.animation) {
                    self.endAngle = self.endAngleTarget
                }
            }
    }
}

struct GoalCircle_Previews: PreviewProvider {
    static var previews: some View {
        GoalCircle(endAngleTarget: 310)
    }
}
