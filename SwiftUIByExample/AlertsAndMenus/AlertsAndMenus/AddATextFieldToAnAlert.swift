//
//  AddATextFieldToAnAlert.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct AddATextFieldToAnAlert: View {
    @State private var showingAlert = false
    @State private var name = ""
    
    @State private var isAuthenticating = false
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        /// SwiftUI’s alerts can have one or more TextField or SecureField fields alongside their buttons, allowing you to prompt the user for input directly.
        
        /// For example, we could add a TextField to let the user enter their name into an alert:
        Button("Enter name") {
            showingAlert.toggle()
        }
        .alert("Enter your name", isPresented: $showingAlert) {
            TextField("Enter your name", text: $name)
            Button("OK", action: submit)
        } message: {
            Text("Xcode will print whatever you type.")
        }
        
        Text("Your name: \(name)")
        
        /// You can add as many fields as you want, mixing TextField and SecureText depending on your goal. For example, this shows a login prompt asking the user to enter their username and password into an alert:
        Button("Log in") {
            isAuthenticating.toggle()
        }
        .alert("Log in", isPresented: $isAuthenticating) {
            TextField("Username", text: $username)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            Button("OK", action: authenticate)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please enter your username and password.")
        }
    }
    
    func submit() {
        print("You entered \(name)")
    }

    func authenticate() {
        if username == "test" && password == "test122" {
            print("You're in!")
        } else {
            print("Who are you?")
        }
    }
}

#Preview {
    AddATextFieldToAnAlert()
}
