//
//  StoreViewsAsProperties.swift
//  ComposingViews
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct StoreViewsAsProperties: View {
    let title = Text("Vi")
                        .bold()
    let subtitle = Text("Author")
                    .foregroundStyle(.secondary)
    var body: some View {
        /// If you have several views nested inside another view, you might find it useful to create properties for some or all of them to make your layout code easier. You can then reference those properties inline inside your view code, helping to keep it clear.
        VStack {
            title
            subtitle
        }
    }
}

#Preview {
    StoreViewsAsProperties()
}
