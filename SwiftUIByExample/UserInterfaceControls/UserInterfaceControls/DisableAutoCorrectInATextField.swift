//
//  DisableautocorrectInATextField.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 30/07/25.
//

import SwiftUI

struct DisableAutoCorrectInATextField: View {
    @State private var name = ""

    var body: some View {
        TextField("Enter your name", text: $name)
            .disableAutocorrection(true)
    }
}

#Preview {
    DisableAutoCorrectInATextField()
}
