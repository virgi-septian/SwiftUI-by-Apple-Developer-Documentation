//
//  ApplyMultipleAnimationsToAView.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct ApplyMultipleAnimationsToAView: View {
    @State private var isEnabled = false
    var body: some View {
        /// There are two ways of doing this: A newer, clearer approach that’s available from iOS 17 and later, and an older alternative that also works in iOS 16 and earlier.
        
        /// First, the new approach. In this code we animate the background color over one second, and the clip shape over two seconds:
        Button("Press Me") {
            isEnabled.toggle()
        }
        .foregroundStyle(.white)
        .frame(width: 200, height: 200)
        .animation(.easeInOut(duration: 1)) { content in
            content
                .background(isEnabled ? .green : .red)
        }
        .animation(.easeInOut(duration: 2)) { content in
            content
                .clipShape(.rect(cornerRadius: isEnabled ? 100 : 0))
        }
        
        /// When using the older approach, you add multiple animation() modifiers wherever you want to adjust the animation stack for previous modifiers. For example, we could write code to create a button that animates between enabled and disabled states, making the corner rounding and background color changes. If we wanted the corner rounding to animate but not the color change, we’d use an animation such as animation(.default) after the clip shape, then animation(nil) after the background, like this:
        Button("Press Me") {
            isEnabled.toggle()
        }
        .foregroundStyle(.white)
        .frame(width: 200, height: 200)
        .background(isEnabled ? .green : .red)
        .animation(nil, value: isEnabled)
        .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
        .animation(.default, value: isEnabled)
    }
}

#Preview {
    ApplyMultipleAnimationsToAView()
}
