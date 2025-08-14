//
//  ShowAContextMenu.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct ShowAContextMenu: View {
    var body: some View {
        /// if we wanted a context menu to be attached to some text, we could provide two buttons for the menu like this:
        Text("Options")
            .contextMenu {
                Button {
                    print("Change country setting")
                } label: {
                    Label("Choose Country", systemImage: "globe")
                }

                Button {
                    print("Enable geolocation")
                } label: {
                    Label("Detect Location", systemImage: "location.circle")
                }
            }
    }
}

#Preview {
    ShowAContextMenu()
}
