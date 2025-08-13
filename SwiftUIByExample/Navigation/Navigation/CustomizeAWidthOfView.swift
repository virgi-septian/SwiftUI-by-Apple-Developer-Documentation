//
//  CustomizeAView’sWidth.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI

struct CustomizeAWidthOfView: View {
    var body: some View {
        /// In its simplest form, sending a single value to navigationSplitViewColumnWidth() causes it to use a fixed size, no smaller or larger:
//        NavigationSplitView {
//            Text("Sidebar")
//                .navigationSplitViewColumnWidth(100)
//        } content: {
//           Text("Content")
//                .navigationSplitViewColumnWidth(200)
//        } detail: {
//            Text("Detail")
//        }
        
        /// However, if you’re happy to allow flexibility – and if you’re platform supports it, which right now might just be macOS – you an provide minimum, ideal, and maximum sizes instead, like this:
        NavigationSplitView {
            Text("Sidebar")
                .navigationSplitViewColumnWidth(min: 100, ideal: 200, max: 300)
        } content: {
           Text("Content")
                .navigationSplitViewColumnWidth(min: 100, ideal: 200, max: 300)
        } detail: {
            Text("Detail")
        }
    }
}

#Preview {
    CustomizeAWidthOfView()
}
