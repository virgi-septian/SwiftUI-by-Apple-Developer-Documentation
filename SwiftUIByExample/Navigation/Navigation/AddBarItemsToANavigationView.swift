//
//  AddBarItemsToANavigationView .swift
//  Navigation
//
//  Created by Virgi Septian on 12/08/25.
//

import SwiftUI

struct AddBarItemsToANavigationView: View {
    var body: some View {
//        NavigationStack {
//            Text("SwiftUI")
//                .navigationTitle("Welcome")
//                .toolbar {
//                    Button("About") {
//                        print("About tapped!")
//                    }
//
//                    Button("Help") {
//                        print("Help tapped!")
//                    }
//                }
//        }
        
        /// If you want to control the exact position of your button, you can do so by wrapping it in a ToolbarItem and specifying the placement you want. For example, this will create a button and force it be on the leading edge of the navigation bar:
//        NavigationStack {
//            Text("SwiftUI")
//                .navigationTitle("Welcome")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button("Help") {
//                            print("Help tapped!")
//                        }
//                    }
//                }
//        }
        
        /// If you want to place multiple bar buttons in different locations, you can just repeat ToolbarItem as many times as you need and specify a different placement each time.
        
        /// To put multiple bar buttons in the same locations, you should wrap them in a ToolbarItemGroup, like this:
//        NavigationStack {
//            Text("SwiftUI")
//                .navigationTitle("Welcome")
//                .toolbar {
//                    ToolbarItemGroup(placement: .primaryAction) {
//                        Button("About") {
//                            print("About tapped!")
//                        }
//
//                        Button("Help") {
//                            print("Help tapped!")
//                        }
//                    }
//                }
//        }
        /// That uses the .primaryAction placement, which will position the buttons depending on where the platform thinks the most important buttons go.
        
        /// There’s also a .secondaryAction placement designed for actions that are useful but not required, and on iOS that will cause buttons in that group to be collapsed down to a single details button.
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("About") {
                            print("About tapped!")
                        }

                        Button("Help") {
                            print("Help tapped!")
                        }
                    }

                    ToolbarItemGroup(placement: .secondaryAction) {
                        Button("Settings") {
                            print("Credits tapped")
                        }

                        Button("Email Me") {
                            print("Email tapped")
                        }
                    }
                }
        }
    }
}

#Preview {
    AddBarItemsToANavigationView()
}
