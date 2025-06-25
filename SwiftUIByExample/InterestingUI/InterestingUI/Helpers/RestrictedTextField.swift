//
//   Restricted TextField.swift
//  InterestingUI
//
//  Created by Virgi Septian on 25/06/25.
//

import SwiftUI

struct RestrictedTextField<Content: View>: View {
    var hint: String
    var characters: CharacterSet
    @Binding var value: String
    @ViewBuilder var content: (TextField<Text>, String) -> Content
    /// View Properties
    @State private var errorMessage: String = ""
    var body: some View {
        content(
            TextField(hint, text: $value),
            errorMessage
        )
        .onChange(of: value) { oldValue, newValue in
            /// Checking if any characters are there in the value
            let restrictedCharacters = newValue.unicodeScalars.filter({ characters.contains($0) })

            if !restrictedCharacters.isEmpty {
                /// Removing Restricted Characters!
                value.unicodeScalars.removeAll(where: { characters.contains($0) })
                /// Updating Error Message
                errorMessage = "\(restrictedCharacters)"
            } else {
                /// Clearing Error Message when new appropriate character is typed!
                if !oldValue.unicodeScalars.contains(where: { characters.contains($0) }) {
                    errorMessage = ""
                }
            }
        }
    }
}

#Preview {
    ContentRestrictedTextField()
}
