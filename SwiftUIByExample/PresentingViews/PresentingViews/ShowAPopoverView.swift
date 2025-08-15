//
//  ShowAPopoverView.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct ShowAPopoverView: View {
    @State private var showingPopover = false
    var body: some View {
        /// SwiftUI has a dedicated modifier for showing popovers, which on iPadOS appear as floating balloons and on iOS slide onto the screen like a sheet.
        /// To show a popover you need some state that determines whether the popover is currently visible, but that’s about it – unlike alerts and action sheets, popovers can contain any kind of view you want. So, just place whatever you need inside the popover and SwiftUI will take care of the rest.
        Button("Show Menu") {
           showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
            Text("Your content here")
               .font(.headline)
               .padding()
        }
    }
}

#Preview {
    ShowAPopoverView()
}
