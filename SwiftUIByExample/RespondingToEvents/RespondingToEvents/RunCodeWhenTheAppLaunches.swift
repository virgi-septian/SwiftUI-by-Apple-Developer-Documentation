//
//  RunCodeWhenTheAppLaunches.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI

struct RunCodeWhenTheAppLaunches: View {
    /// However, here it doesn’t matter: “Anonymous” will only be used for times when no value exists, and no initial defaults have been registered. We already called register(defaults:) in our app’s initializer, so this view will show “Your name is Taylor Swift.”
    @AppStorage("name") var name = "Anonymous"

    var body: some View {
        Text("Your name is \(name).")
    }
}

#Preview {
    RunCodeWhenTheAppLaunches()
}
