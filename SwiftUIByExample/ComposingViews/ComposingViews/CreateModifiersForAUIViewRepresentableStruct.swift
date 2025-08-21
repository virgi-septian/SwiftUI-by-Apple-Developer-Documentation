//
//  CreateModifiersForAUIViewRepresentableStruct.swift
//  ComposingViews
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

/// As an example, you could create a UIViewRepresentable to bridge UISearchBar into SwiftUI, but you might want some aspect of it to be customizable, such as its placeholder text. First you create the representable with an extra private property for its placeholder:
struct SearchField: UIViewRepresentable {
    @Binding var text: String

    private var placeholder = ""

    init(text: Binding<String>) {
        _text = text
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        return searchBar
    }

    // Always copy the placeholder text across on update
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
    }
}

// Any modifiers to adjust your search field – copy self, adjust, then return.
extension SearchField {
    func placeholder(_ string: String) -> SearchField {
        var view = self
        view.placeholder = string
        return view
    }
}

struct CreateModifiersForAUIViewRepresentableStruct: View {
    @State private var text = ""
    @State private var placeHolder = "Hello, world!"
    var body: some View {
        /// And now you’re all set to use it. For example, this creates a SearchField view with our placeholder() modifier, but every time the button is clicked we randomize the placeholder so you can see everything in action:
        VStack {
            SearchField(text: $text)
                .placeholder(placeHolder)

            Button("Tap me") {
                // randomize the placeholder every press, to
                // prove this works
                placeHolder = UUID().uuidString
            }
        }
    }
}

#Preview {
    CreateModifiersForAUIViewRepresentableStruct()
}
