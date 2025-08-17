//
//  BlueAView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct BlurAview: View {
    @State private var blurAmount: CGFloat = 3
    var body: some View {
        Image("pic 2")
            .resizable()
            .frame(width: 200, height: 200)
            .blur(radius: 30)
        
        Text("Welcome to my SwiftUI app")
            .blur(radius: 2)
        
        /// Blurring is extremely efficient, and you can adjust it dynamically just like any other kind of state. For example, this lets you try adjusting the blur of our text dynamically by dragging around a slider:
        VStack {
            Text("Drag the slider to blur me")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

#Preview {
    BlurAview()
}

