//
//  let users CustomizeToolbarButtons.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct LetUsersCustomizeToolbarButtons: View {
    var body: some View {
        /// Note: Only some platforms support toolbar customization. This API will work best on iPadOS and macOS, where complicated toolbars are more common.
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(id: "options") {
                    // this is a primary action, so will always be visible
                    ToolbarItem(id: "settings", placement: .primaryAction) {
                        Button("Settings") { }
                    }

                    // this is a standard secondary action, so will be customizable
                    ToolbarItem(id: "help", placement: .secondaryAction) {
                        Button("Help") { }
                    }

                    // another customizable button
                    ToolbarItem(id: "email", placement: .secondaryAction) {
                        Button("Email Me") { }
                    }

                    // a third customizable button, but this one won't be in the toolbar by default
                    ToolbarItem(id: "credits", placement: .secondaryAction, showsByDefault: false) {
                        Button("Credits") { }
                    }
                }
                .toolbarRole(.editor)
        }
        
        /// By default this will make all the secondary action buttons individually customizable, but if you wrap two or more buttons in a ControlGroup they become attached for customization purposes – the user must add both or neither. ControlGroup is great for things like font adjustments, like this:
        
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar(id: "font") {
                    ToolbarItem(id: "font", placement: .secondaryAction) {
                        ControlGroup {
                            Button {
                                // decrease font
                            } label: {
                                Label("Decrease font size", systemImage: "textformat.size.smaller")
                            }

                            Button {
                                // increase font
                            } label: {
                                Label("Increase font size", systemImage: "textformat.size.larger")
                            }
                        } label: {
                            Label("Font Size", systemImage: "textformat.size")
                        }
                    }
                }
                .toolbarRole(.editor)
            
            /// Tip: If you don’t add a label for your ControlGroup, SwiftUI will use the labels for the buttons it contains.
        }
    }
}

#Preview {
    LetUsersCustomizeToolbarButtons()
}
