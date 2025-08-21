//
//  InsertImagesIntoText.swift
//  ComposingViews
//
//  Created by Virgi Septian on 21/08/25.
//

import SwiftUI

struct InsertImagesIntoText: View {
    var body: some View {
        Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
        
        /// The images inside your text will automatically adjust to match whatever font or foreground color you’ve chosen, but make sure you apply your modifiers to the whole joined text rather than simply the last item.
        
        /// For example, this will make the whole combined text large and blue:
        (Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!"))
            .foregroundStyle(.blue)
            .font(.largeTitle)
        
        /// Whereas this – without the extra parentheses – will make only the “World” text large and blue:
        Text("Goodbye ") + Text(Image(systemName: "star")) + Text(" World!")
            .foregroundStyle(.blue)
            .font(.largeTitle)
    }
}

#Preview {
    InsertImagesIntoText()
}
