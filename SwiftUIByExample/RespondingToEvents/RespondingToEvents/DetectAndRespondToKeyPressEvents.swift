//
//  DetectAndRespondToKeyPressEvents.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct DetectAndRespondToKeyPressEvents: View {
    @FocusState private var focused: Bool
    @State private var key = "test"

    var body: some View {
        Text(key)
            .focusable()
            .focused($focused)
//            .onKeyPress { press in
//                key += press.characters
//                return .handled
            /// Other forms of onKeyPress() include one to track which phase was triggered, so you could use this code to track only when a key has been released:
        
//            .onKeyPress(phases: .up) { press in
//                    print("Received \(press.characters)")
//                    return .handled
            /// There’s a variant that responds only to certain kinds of keys being pressed:
        
//            .onKeyPress(characters: .alphanumerics) { press in
//                    print("Received \(press.characters)")
//                    return .handled
//                }
            /// And there’s even a variant that responds to specific characters being pressed, provided either as a list of built-in constants or characters. So, this will listen for people frantically mashing keys to quit Vim:
        
            .onKeyPress(keys: [.escape, "w", "q"]) { press in
                    print("Received \(press.characters)")
                    return .handled
                
                /// The return .handled part tells SwiftUI the key press has been responded to in full by our action closure. If you send back .ignored instead, the key press will be passed on to whatever parent view is able to handle it next.
            }
            .onAppear {
                focused = true
            }
    }
}

#Preview {
    DetectAndRespondToKeyPressEvents()
}
