//
//  AddAPlaceholderToATextField.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 30/07/25.
//

import SwiftUI

struct AddAPlaceholderToATextField: View {
    @State private var name = ""
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
        }
    }
}

#Preview {
    AddAPlaceholderToATextField()
}
