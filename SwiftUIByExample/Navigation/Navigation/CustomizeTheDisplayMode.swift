//
//  CustomizeTheDisplayMode.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI

struct CustomizeTheDisplayMode: View {
    var body: some View {
        /// The first is .prominentDetail, which tells SwiftUI you want the detail view to retain its full size at all times – the sidebar and content view will slide over the detail view, rather than pushing it to one side or squeezing it smaller:
//        NavigationSplitView {
//            Text("Sidebar")
//        } content: {
//            Text("Content")
//        } detail: {
//            Text("Detail")
//        }
//        .navigationSplitViewStyle(.prominentDetail)
        
        /// The second option is .balanced, which will reduce the size of your detail view as the sidebar or content bar are shown – just switch .prominentDetail to .balanced, like this:
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text("Content")
        } detail: {
            Text("Detail")
        }
        .navigationSplitViewStyle(.balanced)
        
        /// The default is .automatic, which will vary according to the platform – at the time of writing, on iPhone it becomes prominentDetail, and on iPad it becomes .balanced.
    }
}

#Preview {
    CustomizeTheDisplayMode()
}
