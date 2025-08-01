//
//  LetUsersSelectAColor.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct LetUsersSelectAColor: View {
    @State private var selectBgColor: Color = .blue
    var body: some View {
        /// By default ColorPicker supports opacity in the color selection, but you can disable that with a slightly different initializer:
        ColorPicker("Select Color", selection: $selectBgColor, supportsOpacity: false)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(selectBgColor)
    }
}

#Preview {
    LetUsersSelectAColor()
}
