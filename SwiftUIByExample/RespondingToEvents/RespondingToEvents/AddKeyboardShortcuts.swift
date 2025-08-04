//
//  DddKeyboardShortcuts.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI

struct AddKeyboardShortcuts: View {
    var body: some View {
        /// For example, if we had a log in button and wanted to trigger its behavior when the user pressed Cmd+L we could do this:
        Button("Log in") {
            print("Authenticating…")
        }
        .keyboardShortcut("l")
        
        /// The second way to use keyboardShortcut() is to specify which modifier keys you actually want. As an example, this creates two more buttons, one using Shift+R to trigger a Run button, and another for Ctrl+Opt+Cmd+H to trigger a Home button:
        VStack {
            Button("Run") {
                print("Running…")
            }
            .keyboardShortcut("r", modifiers: .shift)

            Button("Home") {
                print("Going home")
            }
            .keyboardShortcut("h", modifiers: [.control, .option, .command])
        }
        
        /// The third and final way to use keyboardShortcut() is with one of its built-in keys, which are useful for hard to type keys such as Escape and arrows, and also for semantic keys, such as a cancellation action and a default action. Semantic keys are really useful – every time you’ve pressed Return to accept the default action of an alert, or pressed Escape to cancel an action, you’ve used semantic keys.
        Button("Confirm Launch") {
            print("Launching drone…")
        }
        .keyboardShortcut(.defaultAction)
    }
}

#Preview {
    AddKeyboardShortcuts()
}
