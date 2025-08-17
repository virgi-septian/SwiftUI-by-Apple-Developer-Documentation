//
//  MaskOneViewWithAnother.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct MaskOneViewWithAnother: View {
    var body: some View {
        /// SwiftUI gives us the mask() modifier for masking one with another, which means you can mask an image using text or an image using an image, or more.

        /// For example, this creates a 300x300 image of stripes, then masks it using the text “SWIFT!” so that the letters act as a cut out for the image:
        Image(.pic2)
            .resizable()
            .frame(width: 300, height: 300)
            .mask {
                Text("Virgi")
                    .font(.system(size: 90))
            }
    }
}

#Preview {
    MaskOneViewWithAnother()
}
