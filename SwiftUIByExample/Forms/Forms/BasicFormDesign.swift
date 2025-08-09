//
//  ContentView.swift
//  Forms
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct BasicFormDesign: View {
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]
    var body: some View {
        /// SwiftUI’s forms work as containers, just like HStack and VStack, which means you can add other views inside them as needed. However, they automatically adapt the behavior and styling of some controls so they fit better in the form environment.

        /// For example, this creates a form with a toggle, a segmented control, and a button:
        Form {
            Picker("Select a color", selection: $selectedColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)

            Toggle("Enable Logging", isOn: $enableLogging)

            Button("Save changes") {
                // activate theme!
            }
        }
    }
}

#Preview {
    BasicFormDesign()
}
