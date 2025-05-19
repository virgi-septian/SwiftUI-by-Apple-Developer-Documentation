//
//  TextfieldUppercase.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 10/05/25.
//

import SwiftUI

struct TextfieldUppercase: View {
    @State private var name = "Virgi"
    var body: some View {
        TextField("Shout your name at me", text: $name)
            .textFieldStyle(.roundedBorder)
            .textCase(.lowercase)
            .padding(.horizontal)
    }
}

#Preview {
    TextfieldUppercase()
}
