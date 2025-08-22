//
//  DataApp.swift
//  Data
//
//  Created by Virgi Septian on 22/08/25.
//

import SwiftUI

@main
struct DataApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ConfigureCoreDataToWork()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
