//
//  LetTheUserPasteData.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct LetTheUserPasteData: View {
    @State private var username = "@twostraws"

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)

            PasteButton(payloadType: String.self) { strings in
                guard let first = strings.first else { return }
                username = first
            }
            .buttonBorderShape(.capsule)
        }
        .padding()
    }
}

#Preview {
    LetTheUserPasteData()
}

/// Notice how we specify String.self as the payload type, but the input into the closure is an array of strings.

/// Given that TextField has its own cut, copy, and paste menu options, I think PasteButton will be much more useful in places where you aren’t handling text, e.g. when the user wants to paste a picture into your app.
