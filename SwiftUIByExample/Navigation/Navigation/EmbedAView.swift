//
//  ContentView.swift
//  Navigation
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct EmbedAView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(1..<50) { i in
                    Text("index = \(i)")
                }
            }
            Text("SwiftUI")
                .navigationTitle("Welcome")
                .navigationBarTitleDisplayMode(.large)
        }
        
        
        /// If you're targeting iOS 26 or later, you can add a small subtitle too, like this:///
        NavigationStack {
            Text("SwiftUI")
                .navigationTitle("Welcome")
//                .navigationSubtitle("Select an option")
        }
    }
}

#Preview {
    EmbedAView()
}
