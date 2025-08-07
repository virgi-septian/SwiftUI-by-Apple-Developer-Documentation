//
//  CreateCustomBindings.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

struct CreateCustomBindings: View {
    @State private var username = ""
    @State private var firstToggle = false
    @State private var secondToggle = false
    var body: some View {
        /// When we use SwiftUI’s @State property wrapper it does a huge amount of work on our behalf to allow two-way bindings for user interface controls. However, we can also create bindings by hand using the Binding type, which can be provided with custom get and set closures to run when the value is read or written.
        let binding = Binding(
            get: { self.username },
            set: { self.username = $0 }
        )
        
        
        /// Custom bindings are useful when you want to add extra logic to a binding being read or written – you might want to perform some calculations before sending a value back, or you might want to take some extra actions when the value is changed.
        
        /// we could create a stack of two toggle switches where both can be off and either one can be on, but both can’t be on at the same time – enabling one will always disable the other. Here’s how that looks in code:
        let firstBinding = Binding(
            get: { self.firstToggle },
            set: {
                self.firstToggle = $0

                if $0 == true {
                    self.secondToggle = false
                }
            }
        )

        let secondBinding = Binding(
            get: { self.secondToggle },
            set: {
                self.secondToggle = $0

                if $0 == true {
                    self.firstToggle = false
                }
            }
        )

        return VStack {
            /// Tip: When binding to a custom Binding instance, you don’t need to use the dollar sign before the binding name – you’re already reading the two-way binding.
            TextField("Enter your name", text: binding)
            
            
            Toggle(isOn: firstBinding) {
                Text("First toggle")
            }

            Toggle(isOn: secondBinding) {
                Text("Second toggle")
            }
        }
    }
}

#Preview {
    CreateCustomBindings()
}
