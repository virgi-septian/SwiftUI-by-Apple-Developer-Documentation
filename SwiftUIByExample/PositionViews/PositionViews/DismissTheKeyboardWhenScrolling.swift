//
//  DismissTheKeyboardWhenScrolling.swift
//  PositionViews
//
//  Created by Virgi Septian on 24/07/25.
//

import SwiftUI

struct DismissTheKeyboardWhenScrolling: View {
    @State private var username = "Anonymous"
    @State private var bio = ""

    var body: some View {
        ScrollView {
            VStack {
                TextField("Name", text: $username)
                    .textFieldStyle(.roundedBorder)
                TextEditor(text: $bio)
                    .frame(height: 400)
                    .border(.quaternary, width: 1)
            }
            .padding(.horizontal)
        }
        .scrollDismissesKeyboard(.interactively)
    }
    
    
    /// The scrollDismissesKeyboard() modifier can be given one of four values, all of which are useful in their own way:
    
    /// Use .automatic to let SwiftUI judge what’s the best thing to do based on the context of the scroll.
    /// Use .immediately to make the keyboard dismiss fully as soon as any scroll happens.
    /// Use .interactively to make the keyboard dismiss inline with the user’s gesture – they need to scroll further to make it dismiss fully.
    /// Use .never if you want the keyboard to remain present during scrolling.
}

#Preview {
    DismissTheKeyboardWhenScrolling()
}
