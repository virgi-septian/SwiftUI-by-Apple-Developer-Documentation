//
//  CustomizeTheSubmitButton.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 30/07/25.
//

import SwiftUI

struct CustomizeTheSubmitButton: View {
    @State private var username = ""

    var body: some View {
        TextField("Username", text: $username)
            .submitLabel(.join)
    }
    
    /// There are lots of different button options you choose from by passing different values to submitLabel():

    /// continue
    /// done
    /// go
    /// join
    /// next
    /// return
    /// route
    /// search
    /// send
    
    /// All those work equally well with TextField, SecureField, and TextView.
}

#Preview {
    CustomizeTheSubmitButton()
}
