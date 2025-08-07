//
//  useEnvironmentObject.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

/// Note: Environment objects must be supplied by an ancestor view – if SwiftUI can’t find an environment object of the correct type you’ll get a crash. This applies for previews too, so be careful.


/// To demonstrate environment objects, we’re going to define three things:

/// - A GameSettings class that contains a single published property called score.
/// - A ScoreView view that expects to receive a GameSettings object in the environment, and displays its score property.
/// - A ContentView view that creates a GameSettings object, has a button to add 1 to its score property, and a NavigationLink to show the detail view.

// Our observable object class
class GameSettings: ObservableObject {
    @Published var score = 0
}

// A view that expects to find a GameSettings object
// in the environment, and shows its score.
struct ScoreView: View {
    /// no need to parse
    @EnvironmentObject var settings: GameSettings

    var body: some View {
        Text("Score: \(settings.score)")
    }
}

// A view that creates the GameSettings object,
// and places it into the environment for the
// navigation stack.
struct UseEnvironmentObject: View {
    @StateObject var settings = GameSettings()
    
    var body: some View {
        NavigationStack {
            VStack {
                // A button that writes to the environment settings
                Button("Increase Score") {
                    settings.score += 1
                }

                NavigationLink {
                    ScoreView()
                } label: {
                    Text("Show Detail View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(settings)
    }
}

#Preview {
    UseEnvironmentObject()
}
