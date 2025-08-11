//
//  hide AndShowTheStatusBar.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct HideAndShowTheStatusBar: View {
    @State private var hideStatusBar = false
    var body: some View {
        /// Important: This modifier is available only on iOS.

        /// If you want status bar visibility to be dependent on some program state, use an @State Boolean in place of a hard-coded value. For example, this creates a hideStatusBar Boolean that gets toggled when a button is tapped, which in turn controls whether the status bar is showing or not:
        Button("Toggle Status Bar") {
            withAnimation {
                hideStatusBar.toggle()
            }
        }
        .statusBar(hidden: hideStatusBar)
    }
}

#Preview {
    HideAndShowTheStatusBar()
}
