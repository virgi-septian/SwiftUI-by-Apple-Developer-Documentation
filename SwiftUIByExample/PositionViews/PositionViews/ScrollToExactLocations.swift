//
//  ScrollToExactLocations.swift
//  PositionViews
//
//  Created by Virgi Septian on 28/07/25.
//

import SwiftUI

struct ScrollToExactLocations: View {
    @State private var position = ScrollPosition(edge: .top)

    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                        .padding()
                        .id(i)
                }
            }
            .scrollPosition($position)

            HStack(spacing: 50) {
                Button("Top") {
                    position.scrollTo(edge: .top)
                }

                Button("Bottom") {
                    position.scrollTo(edge: .bottom)
                }

                Button("Random") {
                    position.scrollTo(id: Int.random(in: 0..<100))
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    ScrollToExactLocations()
}
