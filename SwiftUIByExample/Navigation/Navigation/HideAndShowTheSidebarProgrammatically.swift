//
//  HideAndShowTheSidebarProgrammatically.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI

/// When using NavigationSplitView on macOS and iPadOS, SwiftUI lets us toggle showing the sidebar, content view, and detail view using the NavigationSplitViewVisibility enum.
struct HideAndShowTheSidebarProgrammatically: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            Text("Sidebar")
        } content: {
           Text("Content")
        } detail: {
            VStack {
                Button("Detail Only") {
                    columnVisibility = .detailOnly
                }

                Button("Content and Detail") {
                    columnVisibility = .doubleColumn
                }

                Button("Show All") {
                    columnVisibility = .all
                }
            }
        }
    }
    
    /// There are four modes to choose from:
    
    /// - In .detailOnly mode, the detail view will take up all the available screen space for your app.
    /// - In .doubleColumn mode, you’ll see both the content and detail views.
    /// - In .all mode, the system will attempt to show all three views if they exist. In the case where you don’t have a content view (the middle view), it will only show two.
    /// - In .automatic mode, the system will do what it thinks is best based on the current device and orientation.
}


#Preview {
    HideAndShowTheSidebarProgrammatically()
}
