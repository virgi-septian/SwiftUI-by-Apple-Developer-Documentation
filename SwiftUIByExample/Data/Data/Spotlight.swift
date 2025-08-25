//
//  Test.swift
//  Data
//
//  Created by Virgi Septian on 25/08/25.
//

import SwiftUI

struct Spotlight: View {
    @EnvironmentObject var appState: AppState
        
    var body: some View {
        NavigationStack {
            List {
                Text("Activity Testing 1")
                    .onTapGesture { appState.selectedID = "1" }
                Text("Activity Testing 2")
                    .onTapGesture { appState.selectedID = "2" }
            }
            .navigationDestination(item: $appState.selectedID) { id in
                Text("This is Detail For Activity \(id)")
            }
        }
    }
}

#Preview {
    Spotlight()
}
