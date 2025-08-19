//
//  tartAnAnimationImmediately.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct StartAnAnimationImmediately: View {
    @State private var scale: CGFloat = 1.0
    var body: some View {
//        Circle()
//            .frame(width: 200, height: 200)
//            .scaleEffect(scale)
//            .onAppear {
//                let baseAnimation = Animation.easeInOut(duration: 0.4)
//                let repeated = baseAnimation.repeatForever(autoreverses: true)
//
//                withAnimation(repeated) {
//                    scale = 0.5
//                }
//            }
        
        
        Circle()
            .frame(width: 200, height: 200)
            .scaleEffect(scale)
            .animate() { scale = 0.5 }
//            .animateForever(autoreverses: true) { scale = 0.5 }
        
    }
}

/// f you intend to add initial animations frequently, it’s a smart idea to add some extensions to the View protocol to make it easier.
/// To demonstrate this, the two extensions below add animate() and animateForever() modifiers that let you customize the animation you want and also wrap up the whole behavior neatly:

// Create an immediate animation.
extension View {
    func animate(using animation: Animation = .easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}

// Create an immediate, looping animation
extension View {
    func animateForever(using animation: Animation = .easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)

        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}
#Preview {
    StartAnAnimationImmediately()
}
