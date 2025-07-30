//
//  DismissTheKeyboardForATextField.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 30/07/25.
//

import SwiftUI

struct DismissTheKeyboardForATextField: View {
//    @State private var name = ""
//    @FocusState private var nameIsFocused: Bool
    
    enum Field {
        case firstName
        case lastName
        case email
    }
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    @FocusState private var focusedField: Field?
    
    @State private var tipAmount = ""
    
    var body: some View {
//        TextField("Name", text: $name)
//            .focused($nameIsFocused)
//        
//        Button("click !"){
//            nameIsFocused.toggle()
//        }
        
        
//        VStack {
//            TextField("First Name", text: $firstName)
//                .focused($focusedField, equals: .firstName)
//                .textContentType(.givenName)
//                .submitLabel(.next)
//            
//            TextField("Last Name", text: $lastName)
//                .focused($focusedField, equals: .lastName)
//                .textContentType(.familyName)
//                .submitLabel(.next)
//            
//            TextField("Email", text: $email)
//                .focused($focusedField, equals: .email)
//                .textContentType(.emailAddress)
//                .submitLabel(.join)
//        }
//        .onSubmit {
//            switch focusedField {
//            case .firstName?:
//                focusedField = .lastName
//            case .lastName?:
//                focusedField = .email
//            default :
//                print("creating account")
//            }
//        }
        
        VStack {
            TextField("Tip Amount ", text: $tipAmount)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)

            Button("Submit") {
                print("Tip: \(tipAmount)")
                hideKeyboard()
            }
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

#Preview {
    DismissTheKeyboardForATextField()
}
