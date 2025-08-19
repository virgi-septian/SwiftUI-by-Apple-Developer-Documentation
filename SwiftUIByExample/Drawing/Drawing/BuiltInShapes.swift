//
//  ContentView.swift
//  Drawing
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct BuiltInShapes: View {
    var body: some View {
        /// SwiftUI gives us five built-in shapes that are commonly used: rectangle, rounded rectangle, circle, ellipse, and capsule. The last three in particular are subtly different in how they behave based on what sizes you provide, but we can demonstrate all the options with a single example:
        List {
            Rectangle()
                .fill(.gray)
                .frame(width: 200, height: 200)

            RoundedRectangle(cornerRadius: 25)
                .fill(.red)
                .frame(width: 200, height: 200)

            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
                .fill(.orange)
                .frame(width: 200, height: 200)

            Capsule()
                .fill(.green)
                .frame(width: 100, height: 50)

            Ellipse()
                .fill(.blue)
                .frame(width: 100, height: 50)

            Circle()
                .fill(.black)
                .frame(width: 100, height: 50)
        }
    }
}

#Preview {
    BuiltInShapes()
}
