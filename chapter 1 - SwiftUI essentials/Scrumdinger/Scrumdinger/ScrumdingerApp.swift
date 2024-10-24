//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 23/10/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
