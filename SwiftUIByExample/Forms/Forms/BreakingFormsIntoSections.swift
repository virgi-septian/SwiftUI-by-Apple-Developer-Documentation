//
//  BreakingFormsIntoSections.swift
//  Forms
//
//  Created by Virgi Septian on 09/08/25.
//

import SwiftUI

struct BreakingFormsIntoSections: View {
    @State private var enableLogging = false
    @State private var selectedColor = "Red"
    @State private var colors = ["Red", "Green", "Blue"]

    var body: some View {
        Form {
            Section(footer: Text("Note: Enabling logging may slow down the app")) {
                Picker("Select a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)

                Toggle("Enable Logging", isOn: $enableLogging)
            }

            Section {
                Button("Save changes") {
                    // activate theme!
                }
            }
        }
    }}

#Preview {
    BreakingFormsIntoSections()
}
