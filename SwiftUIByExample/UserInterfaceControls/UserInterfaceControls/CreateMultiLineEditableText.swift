//
//  CreateMultiLineEditableText.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct CreateMultiLineEditableText: View {
    @State private var profileText = """
        SwiftUI has a TextEditor view for handling multi-line, scrolling text. You can set the font, change the colors as needed, and even adjust line spacing and how many lines can be created.
        
        You need to store the current value of your text field somewhere, using @State or similar. For example, we could create a text view to let the user enter profile data like this:
    """

    var body: some View {
        NavigationStack {
            TextEditor(text: $profileText)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
                .navigationTitle("About you")
        }
    }
}

#Preview {
    CreateMultiLineEditableText()
}
