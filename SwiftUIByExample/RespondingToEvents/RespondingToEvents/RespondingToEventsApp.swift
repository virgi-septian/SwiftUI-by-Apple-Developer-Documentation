//
//  RespondingToEventsApp.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI

@main
struct RespondingToEventsApp: App {
    var body: some Scene {
        WindowGroup {
            DetectWhenYourAppMoves()
            RespondToViewLifecycleEvents()
        }
    }
}
