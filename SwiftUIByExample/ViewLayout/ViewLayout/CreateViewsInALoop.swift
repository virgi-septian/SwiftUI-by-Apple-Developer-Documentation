//
//  CreateViewsInALoop.swift
//  ViewLayout
//
//  Created by Virgi Septian on 13/07/25.
//

import SwiftUI

struct SimpleGameResult {
    let id = UUID()
    let score: Int
}

struct CreateViewsInALoop: View {
    let colors: [Color] = [.red, .green, .blue]
    let results = [
        SimpleGameResult(score: 8),
        SimpleGameResult(score: 5),
        SimpleGameResult(score: 10)
    ]
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ForEach((1...10).reversed(), id: \.self) {
                    Text("\($0)…")
                }

                Text("Ready or not, here I come!")
            }
            .padding(.bottom, 30)
            
            VStack {
                ForEach(colors, id: \.self) { color in
                    Text(color.description.capitalized)
                        .padding()
                        .background(color)
                }
            }
            .padding(.bottom, 30)
            
            VStack {
                ForEach(results, id: \.id) { result in
                    Text("Result: \(result.score)")
                }
            }
        }
    }
}

#Preview {
    CreateViewsInALoop()
}
