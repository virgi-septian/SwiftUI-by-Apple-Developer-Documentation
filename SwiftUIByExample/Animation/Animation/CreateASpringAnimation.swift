//
//  CreateASpringAnimation.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct CreateASpringAnimation: View {
    @State private var angle = 0.0
    @State private var scale = 1.0
    var body: some View {
        /// If you just use .spring() by itself, with no parameters, you get a sensible default. So, this creates a spring animation that rotates a button by 45 degrees every time it’s tapped:
        Button("Tap Me !") {
            angle += 45
        }
        .rotationEffect(Angle(degrees: angle))
        .animation(.spring, value: angle)
        
        
        /// this creates an iOS 16-compatible button with a moderate amount spring damping, which means it will bounce back and forth a few times time before reaching its target angle:
        Button("Press here") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 10), value: angle)
        /// Note: This is an interpolating spring, which means if you trigger the animation several times the spring effect will get stronger and stronger as the springs combine.
    
        
        /// This code does more or less the same, using code compatible with iOS 17 and later:
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.spring(duration: 1, bounce: 0.75), value: scale)
    }
}

#Preview {
    CreateASpringAnimation()
}
