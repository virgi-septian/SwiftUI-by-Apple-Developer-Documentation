//
//  InterestingUIApp.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/06/25.
//

import SwiftUI

@main
struct InterestingUIApp: App {
    @StateObject private var containerData = ZoomContainerData()
    var body: some Scene {
        WindowGroup {
            ZoomContainer {
                PincToZoom()
            }
        }
    }
}
