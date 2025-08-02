//
//  ButtonsThatRepeatTheirActionWhenPressed.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 02/08/25.
//

import SwiftUI

struct MakeButtonsThatRepeatTheirActionWhenPressed: View {
    @State private var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        .buttonRepeatBehavior(.enabled)
        
        Divider()
        /// This repeating behavior also works with keyboard shortcuts, although there its limited by whatever keyboard repeat rate your user has.

        /// For example, this allows the user to hold down Shift+Return to trigger our button repeatedly:
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
        .buttonRepeatBehavior(.enabled)
        .keyboardShortcut(.return, modifiers: .shift)
    }
}

#Preview {
    MakeButtonsThatRepeatTheirActionWhenPressed()
}

