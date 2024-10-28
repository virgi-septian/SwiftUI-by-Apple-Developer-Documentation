//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 23/10/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
