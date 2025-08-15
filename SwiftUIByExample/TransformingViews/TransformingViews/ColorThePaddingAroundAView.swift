//
//  ContentView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct ColorThePaddingAroundAView: View {
    var body: some View {
        /// The padding() modifier lets us add some spacing around a view, and the background() modifier lets us set a background color. However, the way you use them matters, so it’s important to be clear about your goal in order to get the best results.
        
        /// As an example, this creates a text view with a red background and white foreground, then adds system default padding to it:
        Text("Hacking with Swift")
            .background(.red)
            .foregroundStyle(.white)
            .padding()
        
        /// And this adds system default padding then sets a red background color and a white foreground:
        Text("Hacking with Swift")
            .padding(3)
            .background(.red)
            .foregroundStyle(.white)
        
        /// Those two pieces of code might look similar, but they yield different results because the order in which you apply modifiers matters. In the second example the view is padded then colored, which means the padding also gets colored red. In contrast, the first example colors then pads, so the padding remains uncolored.
    }
}

#Preview {
    ColorThePaddingAroundAView()
}
