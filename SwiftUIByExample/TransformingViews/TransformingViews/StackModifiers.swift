//
//  StackModifiers.swift
//  TransformingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct StackModifiers: View {
    var body: some View {
        /// Each modifier you add to a view adjusts whatever came before it, and you’re able to repeat modifiers more than once.
        
        /// For example, we could add padding and a background color around a text view, then add some more padding and a different background color, then add some more padding and a third background color, all to make a particular effect:
        Text("Forecast: Sun")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.red)
            .padding()
            .background(.orange)
            .padding()
            .background(.yellow)
    }
}

#Preview {
    StackModifiers()
}
