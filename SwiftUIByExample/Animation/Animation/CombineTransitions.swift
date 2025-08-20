//
//  CombineTransitions.swift
//  Animation
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

/// When adding or removing a view, SwiftUI lets you combine transitions to make new animation styles using the combined(with:) method.
struct CombineTransitions: View {
    @State private var show = false
    var body: some View {
        /// you can make a view move (one transition) and fade (a second transition) at the same time like this:
        Button("Show Text"){
            withAnimation(.linear(duration: 0.1)) {
                show.toggle()
            }
        }
        
        if show {
            Text("Ini textnya")
//                .transition(AnyTransition.scale.combined(with: .slide))
                .transition(.moveAndScale)
        }
        
    }
}

/// To make combined transitions easier to use and re-use, you can create them as extensions on AnyTransition. For example, we could define a custom moveAndScale transition and try it out straight away:
extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}

#Preview {
    CombineTransitions()
}
