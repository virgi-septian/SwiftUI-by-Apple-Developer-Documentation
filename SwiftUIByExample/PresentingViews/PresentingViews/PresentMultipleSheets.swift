//
//  PresentMultipleSheets.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct PresentMultipleSheets: View {
    @State private var showingFirst = false
    @State private var showingSecond = false
    var body: some View {
        /// If you want to show multiple sheets in SwiftUI, it’s only possible by triggering the second sheet from inside the first – you shouldn’t attach both sheet() modifiers to the same parent view.
        
        /// Instead, place one sheet() modifier inside the view being used as your first sheet, like this:
        VStack {
            Button("Show First Sheet") {
                showingFirst = true
            }
        }
        .sheet(isPresented: $showingFirst) {
            Button("Show Second Sheet") {
                showingSecond = true
            }
            .sheet(isPresented: $showingSecond) {
                Text("Second Sheet")
            }
        }
        
        /// If you do place both sheet() modifiers in the same parent, SwiftUI will display a warning: “Currently, only presenting a single sheet is supported. The next sheet will be presented when the currently presented sheet gets dismissed.” That might be exactly what you want, but the warning suggests that this behavior might change in the future.
    }
}

#Preview {
    PresentMultipleSheets()
}
