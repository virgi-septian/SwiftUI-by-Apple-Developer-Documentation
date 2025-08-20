//
//  CreateCustomModifiers.swift
//  ComposingViews
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.red)
            .foregroundStyle(.white)
            .font(.largeTitle)
    }
}

struct CreateCustomModifiers: View {
    var body: some View {
        /// If you find yourself constantly attaching the same set of modifiers to a view – e.g., giving it a background color, some padding, a specific font, and so on – then you can avoid duplication by creating a custom view modifier that encapsulates all those changes. So, rather than say “make it red, make it use a large font” and so on, you can just say “make it look like a warning,” and apply a pre-made set of modifiers.
        Text("Hello, SwiftUI")
            .modifier(PrimaryLabel())
    }
}

#Preview {
    CreateCustomModifiers()
}
