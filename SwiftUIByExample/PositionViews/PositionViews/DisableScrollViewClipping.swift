//
//  DisableScrollViewClipping.swift
//  PositionViews
//
//  Created by Virgi Septian on 28/07/25.
//

import SwiftUI

struct DisableScrollViewClipping: View {
    var body: some View {
        VStack {
            Text("Fixed at the top")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)

            ScrollView {
                ForEach(0..<5) { i in
                    Text("Scrolling")
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(.blue)
                        .foregroundStyle(.white)
                }
            }
            .scrollClipDisabled()

            Text("Fixed at the bottom")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
                .zIndex(-99999)
        }
    }
}

#Preview {
    DisableScrollViewClipping()
}
