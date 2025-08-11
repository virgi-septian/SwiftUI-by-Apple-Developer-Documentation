//
//  CreateAToolbar.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct CreateAToolbar: View {
    var body: some View {
        /// SwiftUI’s toolbar() modifier lets us place bar button items anywhere in the top or bottom space, but only when our view is embedded inside a NavigationStack.
        
        /// If you want to place buttons into a toolbar at the bottom of the screen, use toolbar() then create a ToolbarItem with the placement of .bottomBar, like this:
        NavigationStack {
            Text("Hello, World!").padding()
                .navigationTitle("SwiftUI")
//                .toolbar {
//                    ToolbarItem(placement: .bottomBar) {
//                        Button("Press Me") {
//                            print("Pressed")
//                        }
//                    }
//                }
                /// To get more than one button, use ToolbarItemGroup instead of a simple ToolbarItem, then place multiple buttons inside there:
//                .toolbar {
//                    ToolbarItemGroup(placement: .bottomBar) {
//                        Button("First") {
//                            print("Pressed")
//                        }
//
//                        Button("Second") {
//                            print("Pressed")
//                        }
//                    }
//                }
                /// If you want to separate buttons inside a ToolbarItemGroup, add a spacer view wherever you want it. For example, this will place one button on the left edge of the toolbar, and one on the right edge:
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button("First") {
                            print("Pressed")
                        }

                        Spacer()

                        Button("Second") {
                            print("Pressed")
                        }
                    }
                }
        }
    }
}

#Preview {
    CreateAToolbar()
}
