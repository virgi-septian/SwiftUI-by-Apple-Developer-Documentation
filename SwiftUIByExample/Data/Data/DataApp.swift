//
//  DataApp.swift
//  Data
//
//  Created by Virgi Septian on 22/08/25.
//

import SwiftUI
import CoreSpotlight

class AppState: ObservableObject {
    @Published var selectedID: String? = nil
}

@main
struct DataApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    @StateObject private var appState = AppState()
    
    var body: some Scene {
//        WindowGroup {
//            ConfigureCoreDataToWork()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
//        .onChange(of: scenePhase) { _ in
//            persistenceController.save()
//        }
        
        
//        DocumentGroup(newDocument: TextFile()) { file in
//            CreateADocumentBasedApp(document: file.$document)
//        }
        
        WindowGroup {
//            Spotlight()
//                .environmentObject(appState)
//                .onContinueUserActivity(CSSearchableItemActionType) { activity in
//                    if let id = activity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
//                        appState.selectedID = id
//                    }
//                }
            
            ReadTheLocationOfUser()
        }
    }
}



func handleSpotlight(_ userActivity: NSUserActivity) {
    if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
        print("Found identifier \(id)")
    }
}

