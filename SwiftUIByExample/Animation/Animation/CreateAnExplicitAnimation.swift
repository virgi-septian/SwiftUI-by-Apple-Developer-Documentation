//
//  CreateAnExplicitAnimation.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct CreateAnExplicitAnimation: View {
    @State private var opacity = 1.0
    var body: some View {
        /// If you attach an animation modifier to a view, you end up with implicit animation – changing some state elsewhere in your view might use animation, even though you’re just incrementing an integer or toggling a Boolean.
        
        /// An alternative is to use explicit animation, where you don’t attach modifiers to the view in question but instead ask SwiftUI to animate the precise change you want to make. To do this, wrap your changes in a call to withAnimation().
        
        Button("Press Here !") {
            withAnimation {
                opacity -= 0.1
            }
        }
        .opacity(opacity)
        
        /// withAnimation() takes a parameter specifying the kind of animation you want, so you could create a three-second linear animation like this: withAnimation(.linear(duration: 3))
        Button("Press Here !") {
            withAnimation(.linear(duration: 3)) {
                opacity -= 0.1
            }
        }
        .opacity(opacity)

        /// Explicit animations are often helpful because they cause every affected view to animate, not just those that have implicit animations attached. For example, if view A has to make room for view B as part of the animation, but only view B has an animation attached, then view A will jump to its new position without animating unless you use explicit animations.
    }
}

#Preview {
    CreateAnExplicitAnimation()
}
