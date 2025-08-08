//
//  AdjustListRowSeparatorVisibilityAndColor.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct AdjustListRowSeparatorVisibilityAndColor: View {
    var body: some View {
        List {
            ForEach(1..<5) { i in
                Text("index - \(i)")
                    /// if you wanted to hide the separators for all rows in your list you could write this:
//                    .listRowSeparator(.hidden)
                    /// To adjust the color of the separator, use listRowSeparatorTint() like this:
                    .listRowSeparatorTint(.red)
            }
        }
    }
}

#Preview {
    AdjustListRowSeparatorVisibilityAndColor()
}
