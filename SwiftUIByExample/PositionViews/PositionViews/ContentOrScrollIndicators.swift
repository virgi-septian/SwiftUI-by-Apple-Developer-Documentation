//
//  ContentOrScrollIndicators.swift
//  PositionViews
//
//  Created by Virgi Septian on 25/07/25.
//

import SwiftUI

struct ContentOrScrollIndicators: View {
    var body: some View {
        ScrollView {
            ForEach(0..<50) { i in
                Text("Item \(i)")
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(.blue)
            }
        }
        .contentMargins(.top, 10, for: .scrollContent)
        
//        Divider()
        ///In a similar way you can adjust the inset amount for the scroll view’s indicators, either by itself or alongside adjusting the content insets.

        ///As before you can adjust all edges at once or chose only the ones you care about, so for example this adds 100 points of margin to the top of the scroll indicator, but leaves the rest untouched:
        
        ScrollView {
            ForEach(0..<50) { i in
                Text("Item \(i)")
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
            }
        }
        .contentMargins(.trailing, 100, for: .scrollIndicators)
    }
}

#Preview {
    ContentOrScrollIndicators()
}
