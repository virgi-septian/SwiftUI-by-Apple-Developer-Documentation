//
//  DrawABorderAroundAView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct DrawABorderAroundAView: View {
    var body: some View {
        Text("Testing")
            .border(.green)
        
        /// If you want to make the border so that it doesn’t sit right on the edges of your view, add some padding first:
        Text("Testing 2")
            .padding()
            .border(.green)
        
        /// This adds a 4-point red border:
        Text("Testing 3")
            .padding()
            .border(.red, width: 4)
        
        /// If you want anything more advanced – e.g., if you want to round the corners of your border – you need to use the overlay() modifier instead.
        Text("Testing 4")
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.blue, lineWidth: 5)
            }
        /// Tip: Use stroke() or strokeBorder() with shapes, and border() with other view types.
    }
}

#Preview {
    DrawABorderAroundAView()
}
