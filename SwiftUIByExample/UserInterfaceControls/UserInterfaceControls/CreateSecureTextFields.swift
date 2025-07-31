//
//  CreateSecureTextFields.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 31/07/25.
//

import SwiftUI

struct CreateSecureTextFields: View {
    @State private var password: String = ""

    var body: some View {
        VStack {
            SecureField("Enter a password", text: $password)
            Text("You entered: \(password)")
        }
    }
}

#Preview {
    CreateSecureTextFields()
}
