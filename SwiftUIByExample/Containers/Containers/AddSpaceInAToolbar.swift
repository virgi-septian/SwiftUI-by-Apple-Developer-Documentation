//
//  AddSpaceInAToolbar.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct AddSpaceInAToolbar: View {
    var body: some View {
        /// SwiftUI provides a dedicated ToolbarSpacer() view for creating gaps in your toolbars. This is important to use when you have two items in the same location that aren't related – for example add and delete buttons both in the default location.
        
        /// It's important to get this right, because without spacers in place it will look like your buttons are attached. This wasn't a problem before iOS 26 because we didn't have button shapes, whereas now the shapes are part of the liquid glass look and feel.

        /// For example, we could place two unrelated toolbar items in the default position like this:
        NavigationStack {
            Text("Example")
                .toolbar {
                    ToolbarItem {
                        Button("Delete", systemImage: "trash", role: .destructive) { }
                    }

//                    ToolbarSpacer(.fixed)
                    /// The .fixed size ensures just enough of a gap for the two buttons to be visually distinct on the screen. If you try removing it you'll see the two buttons appear with a single outline shape, making them more of a toolbar item group.
                    ToolbarItem {
                        Button("Add", systemImage: "plus") { }
                    }
                }
        }
    }
}

#Preview {
    AddSpaceInAToolbar()
}
