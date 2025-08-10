//
//  ShowingAndHidingFormRows.swift
//  Forms
//
//  Created by Virgi Septian on 10/08/25.
//

import SwiftUI

struct ShowingAndHidingFormRows: View {
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false
    var body: some View {
        /// SwiftUI lets us add and remove items from a form as needed, which is particularly helpful when you want to adjust the list of options that are visible based on previous choices.
        
        /// For example, this shows a single toggle that prompts the user whether they want to show more advanced options. When that toggle is enabled, a second toggle appears allowing them to enable logging:
        Form {
            Section {
                Toggle("Show advanced options", isOn: $showingAdvancedOptions.animation())

                if showingAdvancedOptions {
                    Toggle("Enable logging", isOn: $enableLogging)
                }
            }
        }
        
        /// Notice how I attached animation() to the $showingAdvancedOptions binding, to enable implicit animations for view changes made as a result of any binding change.
    }
}

#Preview {
    ShowingAndHidingFormRows()
}
