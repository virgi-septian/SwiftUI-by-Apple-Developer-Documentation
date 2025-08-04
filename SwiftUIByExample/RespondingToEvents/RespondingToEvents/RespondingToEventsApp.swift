//
//  RespondingToEventsApp.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI

@main
struct RespondingToEventsApp: App {
    
    /// run code when the app launches
    init() {
        UserDefaults.standard.register(defaults: [
            "name": "Taylor Swift",
            "highScore": 10
        ])
    }
    
    var body: some Scene {
        WindowGroup {
//            DetectWhenYourAppMoves()
//            RespondToViewLifecycleEvents()
//            AddKeyboardShortcuts()
            RunCodeWhenTheAppLaunches()
        }
    }
}
