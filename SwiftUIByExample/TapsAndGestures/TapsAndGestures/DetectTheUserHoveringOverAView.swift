//
//  DdetectTheUserHoveringOverAView.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct DetectTheUserHoveringOverAView: View {
    @State private var overText: Bool = false
    var body: some View {
        /// In SwiftUI, any macOS app or any iPadOS app where a mouse is connected can detect when the user is hovering their pointer over a view, and respond to it appropriately.
        
        /// There are two modifiers you’ll want to use: onHover(), and hoverEffect(). The first of these allows you to track whether the pointer is currently hovering over the view, and is passed a Boolean reflecting that state. For example, this will color some text red or green depending on whether the pointer is hovering over it or not:
        Text("Hello, World!")
            .foregroundStyle(overText ? .green : .red)
            .onHover { over in
                overText = over
            }
        
        Divider()
        
        Text("Tap me!")
            .font(.largeTitle)
            .hoverEffect(.lift)
            .onTapGesture {
                print("Text tapped")
            }
    }
}

#Preview {
    DetectTheUserHoveringOverAView()
}
