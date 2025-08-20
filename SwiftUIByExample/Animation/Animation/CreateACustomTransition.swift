//
//  CreateACustomTransition.swift
//  Animation
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct ScaledCircle: Shape {
    // This controls the size of the circle inside the
    // drawing rectangle. When it's 0 the circle is
    // invisible, and when it’s 1 the circle fills
    // the rectangle.
    var animatableData: Double

    func path(in rect: CGRect) -> Path {
        let maximumCircleDiameter = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleDiameter = maximumCircleDiameter * animatableData

        let x = rect.midX - circleDiameter / 2
        let y = rect.midY - circleDiameter / 2

        let circleRect = CGRect(x: x, y: y, width: circleDiameter, height: circleDiameter)

        return Circle().path(in: circleRect)
    }
}

// A general modifier that can clip any view using a any shape.
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

// A custom transition combining ScaledCircle and ClipShapeModifier.
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}

// An example view move showing and hiding a red
// rectangle using our transition.
struct CreateACustomTransition: View {
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            Color.blue
                .frame(width: 690, height: 902)
//                .ignoresSafeArea()
            
            if isShowingRed {
                Color.red
                    .frame(width: 690, height: 700)
                    .transition(.iris)
                    .zIndex(1)
            }
        }
        .padding(50)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    CreateACustomTransition()
}
