//
//  CreateAnimatableAnything.swift
//  Animation
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

/// Before iOS 26 this was a little tricky to use, because we needed to create an animatableData value to represent our animatable value, like this:
struct Wave: Shape {
    var amplitude: Double
    var frequency: Double
    var phase: Double

    var animatableData: Double {
        get { phase }
        set { phase = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        for x in stride(from: 0, through: rect.width, by: 1) {
            let angle = frequency * Double(x / rect.width) * 2 * .pi + phase
            let y = sin(angle) * amplitude + rect.midY
            let point = CGPoint(x: x, y: y)

            if x == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        return path
    }
}

/// If you're targeting iOS 26 or later, this becomes a lot easier thanks to the @Animatable macro, which automatically makes any properties animatable – you should delete animatableData entirely and let the macro do all the work for you.
//@Animatable
//struct Wave: Shape {
//    var amplitude: Double
//    var frequency: Double
//    var phase: Double
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for x in stride(from: 0, through: rect.width, by: 1) {
//            let angle = frequency * Double(x / rect.width) * 2 * .pi + phase
//            let y = sin(angle) * amplitude + rect.midY
//            let point = CGPoint(x: x, y: y)
//
//            if x == 0 {
//                path.move(to: point)
//            } else {
//                path.addLine(to: point)
//            }
//        }
//
//        return path
//    }
//}

/// Because the macro animates all stored properties by default, this can cause two small problems:

///You might have properties that you don't want to be animated.
///All properties in your type must be floating-point numbers, e.g. Double.

///Fortunately both of these are solved with another macro, which is attached to any properties you want to opt out of animation: @AnimatableIgnored.
/// @AnimatableIgnored var isUsingCosine = true

struct CreateAnimatableAnything: View {
    @State private var phase = 0.0
    var body: some View {
        Wave(amplitude: 50, frequency: 2, phase: phase)
            .stroke(.green, lineWidth: 4)
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    phase = .pi * 2
                }
            }
    }
}

#Preview {
    CreateAnimatableAnything()
}
