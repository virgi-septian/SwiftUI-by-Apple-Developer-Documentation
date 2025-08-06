//
//  ControlTheTappableAreaOfAView.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct ControlTheTappableAreaOfAView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle").resizable().frame(width: 50, height: 50)
            Spacer().frame(height: 50)
            Text("Paul Hudson")
        }
        /// For example, this code creates a VStack containing an image, a spacer, and some text, then uses the contentShape() modifier to make the whole stack tappable rather than just the image and text:
        .contentShape(Rectangle())
        .onTapGesture {
            print("Show details for user")
        }
    }
}

#Preview {
    ControlTheTappableAreaOfAView()
}
