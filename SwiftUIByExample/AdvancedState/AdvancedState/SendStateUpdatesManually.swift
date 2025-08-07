//
//  SendStateUpdatesManually.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

/// Although using @Published is the easiest way to control state updates, you can also do it by hand if you need something specific. For example, you might want the view to refresh only if you’re happy with the values you’ve been given.

// Create an observable object class that announces
// changes to its only property
class UserAuthentication: ObservableObject {
    var username = "Taylor" {
        willSet {
            if username != newValue {
                /// To set display changes
                objectWillChange.send()
            }
        }
    }
}

struct SendStateUpdatesManually: View {
    // Create an instance of our object
    @StateObject var user = UserAuthentication()
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter your name", text: $user.username)
            Text("Your username is: \(user.username)")
        }
    }
}

#Preview {
    SendStateUpdatesManually()
}

/// Tip: This example is no different from using @Published on the property, but now that we have a custom call to objectWillChange.send() we can add extra functionality – we could save the value to disk, for example.
