//
//  scenePadding.swift
//  ViewLayout
//
//  Created by Virgi Septian on 22/07/25.
//

import SwiftUI

/// How to automatically add appropriate padding for the current scene
struct ScenePadding: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, world!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .scenePadding(.horizontal)

                Spacer()
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ScenePadding()
}
