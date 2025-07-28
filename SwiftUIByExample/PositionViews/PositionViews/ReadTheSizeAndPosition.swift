//
//  ReadTheSizeAndPosition.swift
//  PositionViews
//
//  Created by Virgi Septian on 28/07/25.
//

import SwiftUI

struct ReadTheSizeAndPosition: View {
    @State private var counter = 1
    @State private var yOffset: CGFloat = 0
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<counter, id: \.self) { i in
                    Text("Row \(i)")
                }
            }
            .onScrollGeometryChange(for: Double.self) { geo in
                geo.contentSize.height
            } action: { oldValue, newValue in
                print("Height is now \(newValue)")
            }

            Button("Add a row") {
                counter += 1
            }
        }
        
        Divider()
        
        VStack {
            ScrollView {
                ForEach(0..<100, id: \.self) { i in
                    Text("Row \(i)")
                }
            }
            .onScrollGeometryChange(for: Double.self) { geo in
                geo.contentOffset.y
            } action: { oldValue, newValue in
                yOffset = newValue
            }

            Text("Offset: \(yOffset)")
        }
    }
}

#Preview {
    ReadTheSizeAndPosition()
}
