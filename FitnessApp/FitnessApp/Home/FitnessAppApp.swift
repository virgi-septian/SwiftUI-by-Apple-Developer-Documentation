//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by Virgi Septian on 24/12/24.
//

import SwiftUI

@main
struct FitnessAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FitnessTabView()
        }
    }
}
