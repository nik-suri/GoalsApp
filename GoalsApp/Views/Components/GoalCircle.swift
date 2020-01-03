//
//  GoalCircle.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/2/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

import SwiftUI

private struct CircleRing: Shape {
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
    var endAngle: Double
    var upperText: String
    var lowerText: String
    
    @State private var endAngleValue: Double = 0
    @State private var textOpacity: Double = 0
    
    var strokeAnimation: Animation {
        Animation.easeInOut(duration: 1)
            .delay(1.5)
    }
    
    var textAnimation: Animation {
        Animation.easeInOut(duration: 1)
            .delay(2)
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Circle()
                    .stroke(lineWidth: 0)
                    .overlay(
                        VStack {
                            Theme.ThemeText(content: self.upperText)
                                .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.3: geometry.size.height * 0.3))
                            Theme.ThemeText(content: self.lowerText)
                                .font(.system(size: geometry.size.height > geometry.size.width ? geometry.size.width * 0.1: geometry.size.height * 0.1))
                        }
                    )
                    .opacity(self.textOpacity)
                    .onAppear() {
                        withAnimation(self.textAnimation) {
                            self.textOpacity = 1
                        }
                    }
            }
            CircleRing(endAngle: endAngleValue)
                .stroke(Color.yellow, lineWidth: 10)
                .aspectRatio(1, contentMode: .fit)
                .onAppear() {
                    withAnimation(self.strokeAnimation) {
                        self.endAngleValue = self.endAngle
                    }
                }
        }
        .padding()
    }
}

struct GoalCircle_Previews: PreviewProvider {
    static var previews: some View {
        GoalCircle(endAngle: 310,
                   upperText: "8",
                   lowerText: "Accomplished")
    }
}
