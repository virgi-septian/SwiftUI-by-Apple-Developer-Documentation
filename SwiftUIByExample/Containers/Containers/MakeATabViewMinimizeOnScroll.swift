//
//  MakeATabViewMinimizeOnScroll.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct MakeATabViewMinimizeOnScroll: View {
    var body: some View {
        /// SwiftUI’s TabView can be configured to minimize itself when the user scrolls – it will collapse down to show only the icon for the currently selected tab, then hide its text to take up even less space.
        
        /// It's all done through the tabBarMinimizeBehavior() modifier, which you attach to the TabView you're adjusting, like this:
         TabView {
            Tab("Tab 1", systemImage: "1.circle", content: ExampleView.init)
            Tab("Tab 2", systemImage: "2.circle", content: ExampleView.init)
            Tab("Tab 3", systemImage: "3.circle", content: ExampleView.init)
            Tab("Tab 4", systemImage: "4.circle", content: ExampleView.init)
        }
//         .tabBarMinimizeBehavior(.onScrollDown)
    }
}


struct ExampleView: View {
    var body: some View {
        Text("Example Text")
    }
}

#Preview {
    MakeATabViewMinimizeOnScroll()
}

/// This technique is particularly effect when you have a tab configured with the .search role, where the collapsed tab view and search tab both stay visible even when minimized.
