//
//  ContentView.swift
//  Lists
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

struct Pizzeria: View {
    let name: String

    var body: some View {
        Text("Restaurant: \(name)")
    }
}

struct CreateAListOfStaticItems: View {
    var body: some View {
        /// this code defines a Pizzeria view that will show a name string, then uses that as a row for a List with three fixed pieces of data:
        List {
            Pizzeria(name: "Joe's Original")
            Pizzeria(name: "The Real Joe's Original")
            Pizzeria(name: "Original Joe's")
        }
    }
}

#Preview {
    CreateAListOfStaticItems()
}
