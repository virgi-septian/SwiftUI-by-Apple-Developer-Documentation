//
//  AdjustTheSizeOfAView.swift
//  ViewLayout
//
//  Created by Virgi Septian on 21/07/25.
//

import SwiftUI
/// adjust the size of a view relative to its container
struct AdjustTheSizeOfAView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) { i in
                    Text("Item \(i)")
                        .foregroundStyle(.white)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 10)
                        .background(.blue)
                }
            }
        }
    }
}

#Preview {
    AdjustTheSizeOfAView()
}
