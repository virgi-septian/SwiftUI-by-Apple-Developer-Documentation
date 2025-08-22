//
//  AdjustAppleIntelligenceWritingToolsForTextViews.swift
//  ComposingViews
//
//  Created by Virgi Septian on 22/08/25.
//

import SwiftUI

struct AdjustAppleIntelligenceWritingToolsForTextViews: View {
    @State private var text = ""
    var body: some View {
        /// SwiftUI provides two modifiers for controlling the way writing tools are shown for Text, TextField, and TextEditor views – these are the tools that let users proofread or rewrite text using AI. However, only one of these modifiers works on iOS, so it's a bit limited at this time.
        
        /// The modifier that works on all platforms is writingToolsBehavior(), which allows us to adjust the level of writing tool support for a particular text box. It's used like this:
        TextField("Enter some text", text: $text)
            .writingToolsBehavior(.disabled)
        
        /// That disables writing tools entirely, but you can also try .limited to get reduce support based on the platform.
        
        /// This modifier works on TextField and TextEditor out of the box, but also works on Text when it's marked as being selectable.

        /// The second modifier on offer only works on macOS, and is called writingToolsAffordanceVisibility(). This shows or hides the affordance for writing tools, but what that actually means is down to Apple –sometimes you might see a small icon shown next to selected text, for example, giving users a prompt that writing tools are available.
    }
}

#Preview {
    AdjustAppleIntelligenceWritingToolsForTextViews()
}
