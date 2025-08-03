//
//  UseRichTextEditing.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 03/08/25.
//

import SwiftUI

struct UseRichTextEditing: View {
//    @State private var text = AttributedString()
//    
//    var body: some View {
//        TextEditor(text: $text)
//    }
    
    //MARK: - Getting this to work means doing three things:
    

    /// Creating an AttributedTextSelection property and binding that to your TextEditor alongside its attributed string.
    /// Calling transformAttributes(in:) on your attributed string, passing an inout reference to your selection.
    /// Reading the current font for the selection.
    /// Resolving that against the current environment context.
    /// Adjusting your selection's property based on the resolved font.
    ///
    @Environment(\.fontResolutionContext) var fontResolutionContext
    @State var text = AttributedString("")
    @State var selection = AttributedTextSelection()

    var body: some View {
        VStack {
            TextEditor(text: $text, selection: $selection)

            HStack {
                Button("Bold", systemImage: "bold") {
                    text.transformAttributes(in: &selection) { container in
                        let currentFont = container.font ?? .default
                        let resolved = currentFont.resolve(in: fontResolutionContext)
                        container.font = currentFont.bold(!resolved.isBold)
                    }
                }

                Button("Italic", systemImage: "italic") {
                    text.transformAttributes(in: &selection) { container in
                        let currentFont = container.font ?? .default
                        let resolved = currentFont.resolve(in: fontResolutionContext)
                        container.font = currentFont.italic(!resolved.isItalic)
                    }
                }
            }
        }
        
        // As for why it works that way:

        // We need to use inout with transformAttributes(in:) because our transformation might adjust the selection. By using inout, SwiftUI will take care of adjusting the text selection as needed so that it updates correctly.
                
        // We need to resolve the current font using the \.fontResolutionContext environment key, which tells us how this font will be rendered for the current user – perhaps they have an increased Dynamic Type setting, for example.
                
        // Once we know the actual font that's being shown, we can flip its bold or italic state as appropriate.
        
        /// Some things are a little easier. For example, we can adjust the underline state without resolving anything:
        text.transformAttributes(in: &selection) { container in
            if container.underlineStyle == .single {
                container.underlineStyle = .none
            } else {
                container.underlineStyle = .single
            }
        }
        
        /// Or we could change alignment for the selected text:
        Button("Align Right", systemImage: "text.alignright") {
            text.transformAttributes(in: &selection) { container in
                container.alignment = .right
            }
        }
    }
}

#Preview {
    UseRichTextEditing()
}



/// Sadly, what is hard is storing all this in SwiftData. It is possible to store AttributedString in a SwiftData model, but sadly it's not trivial – Apple's sample code uses a fair amount of custom encoding and decoding, NotificationCenter, and @objc methods, so you should almost certainly use that. Perhaps they'll consider baking support into the framework in a future release…
