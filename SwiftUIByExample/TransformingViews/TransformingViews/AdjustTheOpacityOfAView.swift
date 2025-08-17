//
//  AdjustTheOpacityOfAView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct AdjustTheOpacityOfAView: View {
    @State private var opacity : Double = 0.3
    var body: some View {
        Text("Now you see me")
        .padding()
        .background(.red)
        .opacity(0.3)
        
        /// Modifying opacity is extremely fast – certainly something you can do as often as you need. To demonstrate that, the following code adjusts text opacity using a slider, and you’ll see you can move it around as fast and as much as you like without any performance hit:
        VStack {
            Text("Now you see me")
                .padding()
                .background(.red)
                .opacity(opacity)

            Slider(value: $opacity, in: 0...1)
                .padding()
        }
    }
}

#Preview {
    AdjustTheOpacityOfAView()
}
