//
//  add ActionsToAlertButtons.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct AddActionsToAlertButtons: View {
    @State private var showingAlert = false
    var body: some View {
        /// you will often want to attach actions to buttons to perform specific actions when they are tapped. To do that, attach a closure to your button that will be called when it’s tapped, like this:
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented:$showingAlert) {
            Alert(
                title: Text("Are you sure you want to delete this?"),
                message: Text("There is no undo"),
                primaryButton: .destructive(Text("Delete")) {
                    print("Deleting...")
                },
                secondaryButton: .cancel()
            )
        }
        
        /// There is no way to add more than two buttons to an alert – if you’re looking to do that you should use an action sheet instead.
    }
}

#Preview {
    AddActionsToAlertButtons()
}
