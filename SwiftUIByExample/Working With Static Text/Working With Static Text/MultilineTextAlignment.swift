//
//  Untitled.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 08/05/25.
//

import SwiftUI

struct MultilineTextAlignment: View {
    @State private var aligment: TextAlignment = .center
    let aligments: [TextAlignment] = [.center, .leading, .trailing]
    var body: some View {
        Picker("Select position", selection: $aligment) {
            ForEach(aligments, id: \.self ) { aligment in
                Text(String(describing: aligment))
            }
        }
        
        Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
            .multilineTextAlignment(aligment)
    }
}

#Preview {
    MultilineTextAlignment()
}
