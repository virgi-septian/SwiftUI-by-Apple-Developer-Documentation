//
//  iDineApp.swift
//  iDine
//
//  Created by Virgi Septian on 28/04/25.
//

import SwiftUI

@main
struct iDineApp: App {
    @State var order = Order()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
