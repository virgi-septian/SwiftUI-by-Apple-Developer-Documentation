//
//  EnabLingAndDisablingElements.swift
//  Forms
//
//  Created by Virgi Septian on 10/08/25.
//

import SwiftUI

struct EnablingAndDisablingElements: View {
    @State private var agreedToTerms = false
    var body: some View {
        /// SwiftUI lets us disable any part of its forms or even the whole form, all by using the disabled() modifier. This takes a single Boolean that defines whether the element should be disabled or not. The form element’s style automatically gets updated to reflect its status – buttons and toggles get grayed out, for example.
        
        /// For example, this creates a form with two sections: one containing a toggle, and one containing a button that is enabled only when the toggle is on:
        Form {
            Section {
                Toggle("Agree to terms and conditions", isOn: $agreedToTerms)
            }

            Section {
                Button("Continue") {
                    print("Thank you!")
                }
                .disabled(agreedToTerms == false)
            }
        }
    }
}

#Preview {
    EnablingAndDisablingElements()
}
