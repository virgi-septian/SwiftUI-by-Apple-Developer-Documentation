//
//  PickersInForms.swift
//  Forms
//
//  Created by Virgi Septian on 10/08/25.
//

import SwiftUI

struct PickersInForms: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]
    var body: some View {
        /// SwiftUI’s picker views take on special behavior when inside forms, automatically adapting based on the platform you’re using them with. On iOS, the picker will be collapsed down to a single list row that presents all the available options as a popup menu.
        
        /// For example, this creates a form with a picker using an array for its items:
        NavigationStack {
            Form {
                Section {
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            
            /// If you want to disable this behavior, you can force the picker to adopt its regular style by using the .pickerStyle(.wheel) modifier, like this:
            Form {
                Section {
                    Picker("Strength", selection: $selectedStrength) {
                        ForEach(strengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .navigationTitle("Select your cheese")
        }
    }
}

#Preview {
    PickersInForms()
}
