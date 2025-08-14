//
//  ShowMultipleAlertsInASingleView.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct ShowMultipleAlertsInASingleView: View {
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    var body: some View {
        /// we can write some code to define two @State properties that each control an alert being shown. Rather than attaching both alert() modifiers to the same VStack, this attaches them each to whichever button is responsible for showing that alert:
        VStack {
            Button("Show 1") {
                showingAlert1 = true
            }
            .alert(isPresented: $showingAlert1) {
                Alert(title: Text("One"), message: nil, dismissButton: .cancel())
            }

            Button("Show 2") {
                showingAlert2 = true
            }
            .alert(isPresented: $showingAlert2) {
                Alert(title: Text("Two"), message: nil, dismissButton: .cancel())
            }
        }
    }
    
    /// If you try moving both alert() modifiers to the VStack, you’ll find that only one works, which is why the above approach is so useful.
}

#Preview {
    ShowMultipleAlertsInASingleView()
}
