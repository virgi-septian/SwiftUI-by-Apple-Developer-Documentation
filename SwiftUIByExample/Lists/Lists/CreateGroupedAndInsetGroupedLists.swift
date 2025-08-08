//
//  CreateGroupedAndInsetGroupedLists.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct ExampleRow: View {
    var body: some View {
        Text("Example Row")
    }
}

struct CreateGroupedAndInsetGroupedLists: View {
    var body: some View {
        /// SwiftUI’s List views have a listStyle() modifier to control how the list looks, and there are two options you’re likely to want: .grouped (or GroupedListStyle() for Xcode 12) to get the old-style grouping of items, and .insetGrouped (or InsetGroupedListStyle() for Xcode 12) to get the newer style grouping of items.
        List {
            Section(header: Text("Examples")) {
                ExampleRow()
                ExampleRow()
                ExampleRow()
            }
        }
        .listStyle(.grouped)
        
        // Alternatively, this will create a list of 100 rows with the new inset style of grouping:
        
        List(1..<100) { i in
            Text("Exmaples")
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    CreateGroupedAndInsetGroupedLists()
}
