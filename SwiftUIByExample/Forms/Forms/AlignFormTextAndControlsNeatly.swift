//
//  AlignFormTextAndControlsNeatly.swift
//  Forms
//
//  Created by Virgi Septian on 10/08/25.
//

import SwiftUI

struct AlignFormTextAndControlsNeatly: View {
    @State private var brightness = 0.5
    var body: some View {
        /// SwiftUI’s forms do a great job of making many views look good out of the box, but sometimes you need a little extra control to get exactly the right result – aligning text correctly, labelling custom views, or aligning controls that don’t carry labels such as Slider.
        
        /// In its simplest form, using LabeledContent is similar to using the badge() modifier:
        Form {
            LabeledContent("This is important", value: "Value goes here")
            
            /// On iOS this use of LabeledContent gives the same result as using Text("This is important").badge("Value goes here"), but the real power of LabeledContent is that it can take any view, whereas badges accepts only text and numbers.
            Text("This is important").badge("Value goes here")
            
            /// So, we could use LabeledContent to show an image by passing a custom content closure:
            LabeledContent("This is important") {
                Image(systemName: "exclamationmark.triangle")
            }
            
            /// But more importantly, we can also use it with any views that would not normally have a label, such as Slider:
            LabeledContent {
                Slider(value: $brightness)
            } label: {
                Text("Brightness")
            }
            
            /// If the title of your LabeledContent includes two pieces of text, iOS will automatically render the second text in a smaller, lighter font, making it look like a subtitle:
            LabeledContent {
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
            }
            
            /// In fact, it supports up to four pieces of text using this approach, with each one rendered smaller and lighter:
            LabeledContent {
                Text("Value")
            } label: {
                Text("Title")
                Text("Subtitle")
                Text("Subsubtitle")
                Text("Subsubsubtitle")
            }
        }
        
        /// Important: At the time of writing, some SwiftUI views such as Stepper will not use the title of your LabeledContent for VoiceOver. This makes them rather opaque in terms of accessibility support, so you should use them carefully.
        
        /// Tip: If you apply the labelsHidden() modifier to any LabeledContent, the label title will be hidden while leaving the content visible.
    }
}

#Preview {
    AlignFormTextAndControlsNeatly()
}
