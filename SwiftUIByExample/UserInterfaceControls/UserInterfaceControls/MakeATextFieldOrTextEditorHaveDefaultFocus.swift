//
//  MakeATextFieldOrTextEditorHaveDefaultFocus.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 30/07/25.
//

import SwiftUI

struct MakeATextFieldOrTextEditorHaveDefaultFocus: View {
    enum FocusedField {
        case firstName, lastName
    }

    @State private var firstName = ""
    @State private var lastName = ""
    @FocusState private var focusedField: FocusedField?

    var body: some View {
        Form {
            TextField("First name", text: $firstName)
                .focused($focusedField, equals: .firstName)

            TextField("Last name", text: $lastName)
                .focused($focusedField, equals: .lastName)
        }
        .onAppear {
            focusedField = .firstName
        }
    }
    
    
    /// here’s the code using defaultFocus(), suitable for use on macOS:
//    enum FocusedField {
//        case firstName, lastName
//    }
//
//    @State private var firstName = ""
//    @State private var lastName = ""
//    @FocusState private var focusedField: FocusedField?
//
//    var body: some View {
//        Form {
//            TextField("First name", text: $firstName)
//                .focused($focusedField, equals: .firstName)
//
//            TextField("Last name", text: $lastName)
//                .focused($focusedField, equals: .lastName)
//        }
//        .defaultFocus($focusedField, .firstName)
//    }
}
