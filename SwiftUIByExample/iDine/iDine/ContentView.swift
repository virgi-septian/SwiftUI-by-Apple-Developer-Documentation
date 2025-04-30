//
//  ContentView.swift
//  iDine
//
//  Created by Virgi Septian on 28/04/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(menu) { section in
                        Section(section.name) {
                            ForEach(section.items) { item in
                                ItemRow(item: item)
                            }
                        }
                    }
                }
                .navigationTitle("Menu")
                .listStyle(.grouped)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
