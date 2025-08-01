//
//  CreateAStepper.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct CreateAStepper: View {
    @State private var age: Int = 18
    var body: some View {
        Stepper("Your Age", value: $age, in: 1...50)
        
        Text("\(age)")
    }
}

#Preview {
    CreateAStepper()
}
