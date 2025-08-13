//
//  CreateManyColumnLayout.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI

struct CreateManyColumnLayout: View {
    var body: some View {
        /// SwiftUI’s NavigationSplitView allows us to create multi-column layouts on larger devices (iPadOS, macOS, and large iPhones in landscape), but automatically collapses to a NavigationStack-style layout when space is limited.
        
        /// In its simplest form, you should provide your sidebar as its first trailing closure, and your detail view as its second, like this:
//        NavigationSplitView {
//            Text("Sidebar")
//        } detail: {
//            Text("Detail View")
//        }
        
        
        ///Usually, though, you’ll want to add some kind of selection mechanism to the sidebar, then load that selection in the detail view, like this:
//        NavigationSplitView {
//            List(1..<50) { i in
//                NavigationLink("Row \(i)", value: i)
//            }
//            .navigationDestination(for: Int.self) {
//                Text("Selected row \($0)")
//            }
//            .navigationTitle("Split View")
//        } detail: {
//            Text("Please select a row")
//        }
        /// In that code, the “Please select a row” text is shown only when the user has yet to make a selection in the sidebar, but it will automatically be replaced when the user makes a selection - the navigationDestination() modifier displays its destination view in the detail area automatically. Even better, when space is limited you’ll see the whole thing flattens down to a regular NavigationStack, so you get the best of both worlds.
        
        
        
        /// If you want to go further, NavigationSplitView allows us to add a third view to its layout, which can be shown with a button tap:
//        NavigationSplitView {
//            Text("Sidebar")
//        } content: {
//            Text("Primary View")
//        } detail: {
//            Text("Detail View")
//        }
        
        /// If you’re targeting iPadOS 15 or earlier, you can get a sidebar by placing three views inside a NavigationView, like this:
//        NavigationView {
//            Text("Sidebar")
//            Text("Primary View")
//            Text("Detail View")
//        }
        
        /// If you’re presenting a list inside an iPadOS 15 sidebar, it’s a good idea to use the .listStyle() to give it the system-standard theme for sidebars, like this:
        List(1..<100) { i in
            Text("Row \(i)")
        }
        .listStyle(.sidebar)
    }
}

#Preview {
    CreateManyColumnLayout()
}
