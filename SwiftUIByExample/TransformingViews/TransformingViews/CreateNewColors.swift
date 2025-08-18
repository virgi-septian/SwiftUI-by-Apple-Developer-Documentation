//
//  CreateNewColors.swift
//  TransformingViews
//
//  Created by Virgi Septian on 18/08/25.
//

import SwiftUI

struct CreateNewColors: View {
    @State private var firstColor = Color.red
    @State private var secondColor = Color.indigo
    @State private var blendAmount = 0.5
    var body: some View {
        /// SwiftUI's Color view has a mix(with:by:) modifier that lets us blend two colors dynamically. This can be as simple as putting two colors together, like this:
        Rectangle()
            .fill(Color.red.mix(with: .indigo, by: 0.5))
        
        
        /// However, you can also customize the colorspace. It's set to .perceptual by default, meaning that humans perceive the colors to blend smoothly – it's not strictly accurate to exact color values, but it feels accurate to our eyes. We could also the .device colorspace, which means the blending is more mathematically accurate as a value between 0 and 1:
        /// .perceptual
        Rectangle()
            .fill(Color.red.mix(with: .indigo, by: 0.5, in: .device))
        
        
        /// With this API, we can create a whole color picker and blender layout like this:
        VStack {
            ColorPicker("From", selection: $firstColor)
            ColorPicker("To", selection: $secondColor)
            Slider(value: $blendAmount)

            Rectangle()
                .fill(firstColor.mix(with: secondColor, by: blendAmount))
        }
        .padding()
    }
}

#Preview {
    CreateNewColors()
}
