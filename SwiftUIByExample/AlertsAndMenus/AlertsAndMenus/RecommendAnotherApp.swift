//
//  RecommendAnotherApp.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import StoreKit
import SwiftUI

struct RecommendAnotherApp: View {
    @State private var showRecommended: Bool = false
    var body: some View {
        /// Important: appStoreOverlay() is not available on macOS.
        Button("Show Recommended App") {
            showRecommended.toggle()
        }
        .appStoreOverlay(isPresented: $showRecommended) {
            SKOverlay.AppConfiguration(appIdentifier: "1440611372", position: .bottom)
        }
    }
}

#Preview {
    RecommendAnotherApp()
}
