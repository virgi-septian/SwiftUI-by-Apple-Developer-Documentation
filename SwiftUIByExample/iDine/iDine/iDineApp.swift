//
//  iDineApp.swift
//  iDine
//
//  Created by Virgi Septian on 28/04/25.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
