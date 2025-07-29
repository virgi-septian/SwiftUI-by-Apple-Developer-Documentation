//
//  ActionWhenTheUserSubmitsATextField.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 29/07/25.
//

import SwiftUI

struct ActionWhenTheUserSubmitsATextField: View {
    @State private var password = ""
    @State private var username = ""
    var body: some View {
        /// SwiftUI has an onSubmit() modifier that can be attached to any view in your hierarchy, and will run a function of your choice when the user has finished entering text into a TextField or SecureField.
        
        /// For example, we could ask the user to enter their password, then run some code when they press return:
//        SecureField("Password", text: $password)
//                    .onSubmit {
//                        print("Authenticating…")
//                    }
        
        Divider()
        
        /// For simple examples like that, both TextField and SecureField accept a dedicated onCommit parameter where we can attach our function directly to them. However, the advantage to using onSubmit() is that it captures all text values submitted in its context, which makes completing forms easier:
        
        Form {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
        }
        .onSubmit {
            guard username.isEmpty == false && password.isEmpty == false else { return }
            print("Authenticating…")
        }
    }
}

#Preview {
    ActionWhenTheUserSubmitsATextField()
}
