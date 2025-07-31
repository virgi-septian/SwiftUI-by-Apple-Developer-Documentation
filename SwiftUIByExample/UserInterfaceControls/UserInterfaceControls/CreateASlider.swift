//
//  CreateASlider.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 31/07/25.
//

import SwiftUI

struct CreateASlider: View {
    @State private var celsius: Double = 0
    var body: some View {
        /// For example, this code creates a slider bound to a Celsius property, then updates a text view as the slider moves so that it converts between Celsius and Fahrenheit:
        VStack {
            Slider(value: $celsius, in: -100...100)
            Text("\(celsius, specifier: "%.1f") Celsius is \(celsius * 9 / 5 + 32, specifier: "%.1f") Fahrenheit")
        }
    }
}

#Preview {
    CreateASlider()
}
