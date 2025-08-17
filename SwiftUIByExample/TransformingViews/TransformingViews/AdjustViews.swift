//
//  AdjustViews.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct AdjustViews: View {
    var body: some View {
        /// SwiftUI lets us finely control the way views look by adjusting their brightness, tint, hue, saturation, and more, all by using various modifiers.
        
        ///For example, this creates an image view and tints the whole thing red:
        Image("pic 1")
            .resizable()
            .colorMultiply(.red)
        
        /// You can adjust the saturation of views to any amount, where 0.0 is fully gray and 1.0 is its original color:
        Image("pic 2")
            .resizable()
            .saturation(0.1)
        
        /// You can even dynamically adjust the contrast of a view by using the contrast() modifier. A value of 0.0 yields no contrast (a flat gray image), 1.0 gives you the original image, and everything above 1.0 adds contrast.
        
        Image("pic 2")
            .resizable()
            .contrast(0.9)
    }
}

#Preview {
    AdjustViews()
}
