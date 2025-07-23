//
//  CreateDifferentLayouts.swift
//  PositionViews
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI

struct CreateDifferentLayouts: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height

            VStack {
                Text("Size Class: \(horizontalSizeClass == .compact ? "Compact" : "Regular")")
                Text("Orientation: \(isLandscape ? "Landscape" : "Portrait")")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    CreateDifferentLayouts()
}
