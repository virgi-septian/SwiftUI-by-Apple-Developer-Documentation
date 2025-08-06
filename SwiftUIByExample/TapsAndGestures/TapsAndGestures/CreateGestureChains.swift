//
//  CreateGestureChains.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct CreateGestureChains: View {
    @State private var message = "Long press then drag"
    var body: some View {
        /// sequenced views need to be able to reference each other, you can’t really create them as properties of your view. Instead, create them directly inside your body property, then use firstGesture.sequenced(before: secondGesture) to chain the two together into a single gesture.
        
        /// As an example, this next code requires you to long press on the text view before dragging it:
        
        let longPress = LongPressGesture()
            .onEnded { _ in
                message = "Now Drag Me"
            }
        
        let drag = DragGesture()
            .onChanged { _ in
                message = "Dragging..."
            }
        
        Text(message)
            .gesture(longPress.sequenced(before: drag))
    }
}

#Preview {
    CreateGestureChains()
}
