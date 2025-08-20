//
//  MultiStepAnimationsUsingPhaseAnimators.swift
//  Animation
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

enum AnimationPhase: Double, CaseIterable {
    case fadingIn = 0
    case middle = 1
    case zoomingOut = 3
}

enum AnimationPhase2: CaseIterable {
    case start, middle, end
}

struct MultiStepAnimationsUsingPhaseAnimators: View {
    @State private var animationStep = 0
    var body: some View {
        /// For example, this next example creates a simple animation that makes some text start small and invisible, scale up to natural size and be fully opaque, then scale up to be very large and invisible. It uses an array of the numbers 0, 1, and 3 to represent the various scaling sizes we’ll be using (0%, 100%, and 300%), and it makes the text opaque when the size is 1:
        List {
            Text("Hello, world!")
                .font(.largeTitle)
                .phaseAnimator([0, 1, 3]) { view, phase in
                    view
                        .scaleEffect(phase)
                        .opacity(phase == 1 ? 1 : 0)
                }
            
            /// If you prefer, you can write that using a wrapping PhaseAnimator view, which has the advantage that multiple views can move between phases together:
            PhaseAnimator([0, 1, 3]) { value in
                Text("Hello, world!")
                    .font(.largeTitle)
                    .scaleEffect(value)
                    .opacity(value == 1 ? 1 : 0)

                Text("Goodbye, world!")
                    .font(.largeTitle)
                    .scaleEffect(3 - value)
                    .opacity(value == 1 ? 1 : 0)
            }
            
            /// This might have meaningful raw values attached, but it doesn’t need to. Here’s the same thing rewritten using an enum:
            Text("Hello, world!")
                .font(.largeTitle)
                .phaseAnimator(AnimationPhase.allCases) { view, phase in
                    view
                        .scaleEffect(phase.rawValue)
                        .opacity(phase.rawValue == 1 ? 1 : 0)
                }
            
            /// tapping the button triggers a three-step animation using enum cases. First, we define the various animation phases we want, then we move through them whenever a property changes:
            Button("Tap Me!") {
                        animationStep += 1
                    }
                    .font(.largeTitle)
                    .phaseAnimator(AnimationPhase2.allCases, trigger: animationStep) { content, phase in
                        content
                            .blur(radius: phase == .start ? 0 : 10)
                            .scaleEffect(phase == .middle ? 3 : 1)
                    }
            
            
            /// For even more control, you can specify exactly which animation to use for each phase. For example, this moves between quick .bouncy and a slow .easeInOut animations to get a more varied movement:
            Button("Tap Me!") {
                animationStep += 1
            }
            .font(.largeTitle)
            .phaseAnimator(AnimationPhase2.allCases, trigger: animationStep) { content, phase in
                content
                    .blur(radius: phase == .start ? 0 : 10)
                    .scaleEffect(phase == .middle ? 3 : 1)
            } animation: { phase in
                switch phase {
                case .start, .end: .bouncy
                case .middle: .easeInOut(duration: 2)
                }
            }
            
            /// One approach I’ve found useful is to add extra computed properties to the animation phases to make the rest of the code easier to read, like this:
            Text("Hello, world!")
                .font(.largeTitle)
                .phaseAnimator(AnimationPhase3.allCases) { content, phase in
                    content
                        .scaleEffect(phase.scale)
                        .opacity(phase.opacity)
                }
        }
    }
}

enum AnimationPhase3: CaseIterable {
    case fadingIn, middle, zoomingOut

    var scale: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 3
        }
    }

    var opacity: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 0
        }
    }
}

#Preview {
    MultiStepAnimationsUsingPhaseAnimators()
}
