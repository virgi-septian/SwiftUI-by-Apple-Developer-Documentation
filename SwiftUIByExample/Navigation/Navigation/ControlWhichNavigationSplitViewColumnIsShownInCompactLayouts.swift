//
//  ControlWhichNavigationSplitViewColumnIsShownInCompactLayouts.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI

struct ControlWhichNavigationSplitViewColumnIsShownInCompactLayouts: View {
    @State private var preferredColumn = NavigationSplitViewColumn.detail
    var body: some View {
        /// When you have a NavigationSplitView running in a compact size class – iPhones, Apple Watch, and any iPad when your app has been resized down to a small size – SwiftUI attempts to guess which of your split view columns is the best one to show. This guess is often correct, but you can control it by setting a preferred compact column for your Split View.
        
        /// For example, this code forces the detail view to be preferred, which overrides SwiftUI’s default selection:
        NavigationSplitView(preferredCompactColumn: $preferredColumn) {
            Text("Sidebar View")
        } detail: {
            Text("Detail View")
        }
    }
    
    /// If you provide a value that doesn’t exist – i.e., if you ask it to prefer the content view when you only have sidebar and detail – then SwiftUI will just choose the sidebar.
}

#Preview {
    ControlWhichNavigationSplitViewColumnIsShownInCompactLayouts()
}
