//
//  PreventASheetFromBeingDismissed.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct ExampleSheet: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Sheet view")

            Button("Dismiss", action: close)
        }
        .interactiveDismissDisabled()
    }

    func close() {
        dismiss()
    }
}

struct ExampleSheet2: View {
    @Environment(\.dismiss) var dismiss
    @State private var termsAccepted = false

    var body: some View {
        VStack {
            Text("Terms and conditions")
                .font(.title)
            Text("Lots of legalese here.")
            Toggle("Accept", isOn: $termsAccepted)
        }
        .padding()
        .interactiveDismissDisabled(!termsAccepted)
    }

    func close() {
        dismiss()
    }
}

struct PreventASheetFromBeingDismissed: View {
    @State private var showingSheet = false
    var body: some View {
        /// SwiftUI provides the interactiveDismissDisabled() modifier to control whether the user can swipe downwards to dismiss a sheet. Although swipe to dismiss is usually nice to have, sometimes that’s something you can’t allow – if the user must accept some terms and conditions, for example, then they must take some sort of action before the sheet can be dismissed.
//        Button("Show Sheet") {
//            showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet, content: ExampleSheet.init)
        
        /// If you prefer, you can bind a Boolean to the modifier to allow swipe to dismiss only when some criteria is successfully met. So, our terms and conditions example might look like this:
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: ExampleSheet2.init)
    }
}

#Preview {
    PreventASheetFromBeingDismissed()
}
