//
//  elayAnAnimation.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct DelayAnAnimation: View {
    @State private var rotation: Double = 0.0
    var body: some View {
        Rectangle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(rotation))
            .animation(.easeInOut(duration: 3).delay(1), value: rotation)
            .onTapGesture {
                rotation += 360
            }
    }
}

#Preview {
    DelayAnAnimation()
}
