//
//  ContentView.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

// An example class to work with
class Player: ObservableObject {
    @Published var name = "Taylor"
    @Published var age = 26
}

// A view that creates and owns the Player object.
struct UseStateObject: View {
    @StateObject var player = Player()

    var body: some View {
        NavigationStack {
            NavigationLink {
                PlayerNameView(player: player)
            } label: {
                Text("Show detail view")
            }
        }
    }
}

// A view that monitors the Player object for changes, but
// doesn't own it.
struct PlayerNameView: View {
    @ObservedObject var player: Player

    var body: some View {
        Text("Hello, \(player.name)!")
    }
}

/// If you’re finding it hard to remember the distinction, try this: whenever you see “State” in a property wrapper, e.g. @State, @StateObject, @GestureState, it means “the current view owns this data.”
#Preview {
    UseStateObject()
}
