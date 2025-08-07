//
//  CreateConstantBindings.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

struct CreateConstantBindings: View {
    var body: some View {
        ///  if you want to create a toggle switch you would normally have to create an @State property to store the Boolean, then send that into the toggle switch when you create it. However, if you’re just prototyping your user interface you can use a constant binding instead, like this:
        
        Toggle(isOn: .constant(true)) {
            Text("Show advanced options")
        }
    }
}

#Preview {
    CreateConstantBindings()
}
