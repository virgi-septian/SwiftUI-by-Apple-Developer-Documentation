//
//  AddAToolbarToTheKeyboard.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct AddAToolbarToTheKeyboard: View {
    @State private var name = "Taylor"
    @FocusState private var isInputActive
    var body: some View {
//        TextField("Enter your name", text: $name)
//            .textFieldStyle(.roundedBorder)
//            .toolbar {
//                ToolbarItemGroup(placement: .keyboard) {
//                    Button("Click me!") {
//                        print("Clicked")
//                    }
//                }
//            }
    
        /// In practice this is a great place to use something like @FocusState to move between input fields in your UI, or to hide the keyboard altogether, like this:
        NavigationStack {
           TextField("Enter your name", text: $name)
               .textFieldStyle(.roundedBorder)
               .focused($isInputActive)
               .toolbar {
                   ToolbarItemGroup(placement: .keyboard) {
                       Spacer()

                       Button("Done") {
                           isInputActive = false
                       }
                   }
               }
       }
        
    }
}

#Preview {
    AddAToolbarToTheKeyboard()
}
