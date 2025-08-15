//
//  DrawABorderInsideAView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct DrawABorderInsideAView: View {
    var body: some View {
        /// SwiftUI gives us both stroke() and strokeBorder() modifiers for drawing borders around shapes, and they have subtly different behavior:
        
        /// The strokeBorder() modifier insets the view by half your border width then applies the stroke, meaning that the entire border is drawn inside the view.
        /// The stroke() modifier draws a border centered on the view’s edge, meaning that half the border is inside the view and half outside.
        
        /// Important: Both of these modifiers only apply to shapes – you can use stroke() and strokeBorder() with Circle, Rectangle, Capsule, and so on, but not with Text, Image or other non-shape views. If you want to draw a border around non-shape views, you should use the border() modifier instead
        Circle()
            .strokeBorder(.blue, lineWidth: 50)
            .frame(width: 200, height: 200)
            .padding()
        
        Circle()
            .stroke(.blue, lineWidth: 50)
            .frame(width: 200, height: 200)
            .padding()
    }
}

#Preview {
    DrawABorderInsideAView()
}
