//
//  Untitled.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 08/05/25.
//

import SwiftUI

struct MultilineTextAlignment: View {
    @State private var position: TextAlignment = .center
    let positions: [TextAlignment] = [.center, .leading, .trailing]
    var body: some View {
        Picker("Select position", selection: $position) {
            ForEach(positions, id: \.self ) { position in
                Text(String(describing: position))
            }
        }
        
        Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
            .multilineTextAlignment(position)
    }
}

#Preview {
    MultilineTextAlignment()
}
