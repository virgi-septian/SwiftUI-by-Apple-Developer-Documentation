//
//  CreateAPicker.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct CreateAPicker: View {
    var colors: [String] = ["Red", "Green", "Blue"]
    @State private var selectedColor: String = "Red"
    var body: some View {
        Picker("Please chose a color", selection: $selectedColor) {
            ForEach(colors, id: \.self) { color in
                Text(color).tag(color)
            }
        }.padding()
        
        Text("You selected: \(selectedColor)")
    }
}

#Preview {
    CreateAPicker()
}
