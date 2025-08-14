//
//  ShowAnActionSheet.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct ShowAnActionSheet :View {
    @State private var showingOptions = false
    @State private var selection = "None"
    
    var body: some View {
        /// To create your action sheet using confirmationDialog(), provide some title text, a binding to determine when the sheet should be shown, and optionally also whether you want the title text to appear – if you don’t specify this, SwiftUI will decide for you based on context.
//        
//        VStack {
//            Text(selection)
//
//            Button("Confirm paint color") {
//                showingOptions = true
//            }
//            .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
//                /// Tip: This API uses a standard SwiftUI Button for each action, so you can attach a role such as .destructive to have SwiftUI color it appropriately.
//                Button("Red", role: .destructive) {
//                    selection = "Red"
//                }
//
//                Button("Green") {
//                    selection = "Green"
//                }
//
//                Button("Blue") {
//                    selection = "Blue"
//                }
//            }
//        }
        
        /// Because this new API is more flexible, we can actually collapse down those actions into a simple loop using ForEach:
        VStack {
            Text(selection)

            Button("Confirm paint color") {
                showingOptions = true
            }
            .confirmationDialog("Select a color", isPresented: $showingOptions, titleVisibility: .visible) {
                ForEach(["Red", "Green", "Blue"], id: \.self) { color in
                    Button(color) {
                        selection = color
                    }
                }
            }
        }
        
        
        /// Important: Although you can attach the confirmationDialog() modifier anywhere, in iOS 26 and later it is critical to attach it to whatever view is triggering the dialog – the liquid glass effect will animate out from that view, so if you attach the modifier somewhere else it will be confusing for users.
        
        /// If you need to target iOS 14 or below you should use the older ActionSheet approach to achieve the same result. This also works by defining a property to track whether the action sheet should be visible or not.
        
        VStack {
            Text(selection)

            Button("Show Options") {
                showingOptions = true
            }
            .actionSheet(isPresented: $showingOptions) {
                ActionSheet(
                    title: Text("Select a color"),
                    buttons: [
                        .default(Text("Red")) {
                            selection = "Red"
                        },

                        .default(Text("Green")) {
                            selection = "Green"
                        },

                        .default(Text("Blue")) {
                            selection = "Blue"
                        },
                    ]
                )
            }
        }
        
        
    }
}

#Preview {
    ShowAnActionSheet()
}
