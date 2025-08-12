//
//  PushANewViewWhenAListRowIsTapped.swift
//  Navigation
//
//  Created by Virgi Septian on 12/08/25.
//

import SwiftUI

/// Important: If you can – if you don’t need highly custom navigation and you’re able to target iOS 16 or later – using navigationDestination() is strongly preferred, because it allows SwiftUI to instantiate your destination views lazily.

struct PlayerView: View {
    let name: String

    var body: some View {
        Text("Selected player: \(name)")
            .font(.largeTitle)
    }
}

struct PushANewViewWhenAListRowIsTapped: View {
    let players = [
        "Roy Kent",
        "Richard Montlaur",
        "Dani Rojas",
        "Jamie Tartt",
    ]

    var body: some View {
        NavigationStack {
            List(players, id: \.self) { player in
                NavigationLink(player, value: player)
            }
            .navigationDestination(for: String.self, destination: PlayerView.init)
            .navigationTitle("Select a player")
        }
        
        /// Using this modern value/destination approach to navigation breaks the work down into two steps:
        
        /// - The NavigationLink view stores a player as its value. This is a string in the code above, but it can be anything that conforms to Hashable.
        /// - That value gets sent to navigationDestination() when the link is tapped. We told it to watch for strings, so it will receive the player string that was tapped. We’re passing that directly to PlayerView, which expects a player name to work with.
        
        /// To get that same result using the older API, we need to pass in a PlayerView for every navigation link, like this:


        
        NavigationStack {
            List(players, id: \.self) { player in
                NavigationLink {
                    PlayerView(name: player)
                } label: {
                    Text(player)
                }
            }
            .navigationTitle("Select a player")
        }
        
        /// You can attach navigationDestination() to watch multiple different types of data, like this:
        NavigationStack {
            List {
                NavigationLink("Show an integer", value: 42)
                NavigationLink("Show a string", value: "Hello, world!")
                NavigationLink("Show a Double", value: Double.pi)
            }
            .navigationDestination(for: Int.self) { Text("Received Int: \($0)") }
            .navigationDestination(for: String.self) { Text("Received String: \($0)") }
            .navigationDestination(for: Double.self) { Text("Received Double: \($0)") }
            .navigationTitle("Select a value")
        }
    }
}

#Preview {
    PushANewViewWhenAListRowIsTapped()
}
