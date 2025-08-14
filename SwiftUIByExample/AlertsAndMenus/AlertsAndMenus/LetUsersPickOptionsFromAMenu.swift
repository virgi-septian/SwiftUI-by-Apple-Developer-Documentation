//
//  LetUsersPickOptionsFromAMenu.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct LetUsersPickOptionsFromAMenu: View {
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]
    var body: some View {
        /// SwiftUI’s Picker view has a dedicated style called .menu that shows a popup menu of its options, with the label for the picker being shown as a tappable button. The menu itself will automatically show a checkmark next to the currently selected option, and can display upwards or downwards depending on the position of the picker on-screen.
        VStack {
            Picker("Select a paint color", selection: $selection) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)

            Text("Selected color: \(selection)")
        }
    }
}

#Preview {
    LetUsersPickOptionsFromAMenu()
}
