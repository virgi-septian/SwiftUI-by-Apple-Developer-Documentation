//
//  SetTheBackgroundColorOfListRows.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct SetTheBackgroundColorOfListRows: View {
    var body: some View {
        List {
            ForEach(0..<20) { index in
                Text("Row \(index)")
            }
            .listRowBackground(Color.green)
        }
        .listStyle(.inset)
    }
}

#Preview {
    SetTheBackgroundColorOfListRows()
}
