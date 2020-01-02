//
//  ContentView.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 12/18/19.
//  Copyright © 2019 Nikhil Suri. All rights reserved.
//

import SwiftUI

private extension AnyTransition {
    static var inBottomOutTop: AnyTransition {
        let insertion = AnyTransition.move(edge: .bottom)
        let removal = AnyTransition.move(edge: .top)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var inTopOutBottom: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
        let removal = AnyTransition.move(edge: .bottom)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

private enum ContentState {
    case main
    case goals
    case phrases
}

struct ContentView: View {
    @State private var contentState: ContentState = .main
    @State private var mainViewTransition: AnyTransition = .inBottomOutTop
    
    var body: some View {
        GeometryReader { geometry in
            if self.contentState == .main {
                MainView()
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                if value.translation.height > 0 {
                                    // swipe down
                                    print("swipe down finish")
                                    withAnimation(.easeInOut(duration: 1)) {
                                        self.mainViewTransition = .inBottomOutTop
                                        self.contentState = .phrases
                                    }
                                } else {
                                    // swipe up
                                    print("swipe up finish")
                                    withAnimation(.easeInOut(duration: 1)) {
                                        self.mainViewTransition = .inTopOutBottom
                                        self.contentState = .goals
                                    }
                                }
                            })
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .transition(self.mainViewTransition)
            } else if self.contentState == .goals {
                GoalsView()
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                if value.translation.height > 0 {
                                    // swipe down
                                    print("swipe down finish")
                                    withAnimation(.easeInOut(duration: 1)) {
                                        self.contentState = .main
                                    }
                                }
                            })
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .transition(.inBottomOutTop)
            } else {
                PhrasesView()
                    .gesture(
                        DragGesture()
                            .onEnded({ value in
                                if value.translation.height < 0 {
                                    // swipe up
                                    print("swipe up finish")
                                    withAnimation(.easeInOut(duration: 1)) {
                                        self.contentState = .main
                                    }
                                }
                            })
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .transition(.inTopOutBottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
