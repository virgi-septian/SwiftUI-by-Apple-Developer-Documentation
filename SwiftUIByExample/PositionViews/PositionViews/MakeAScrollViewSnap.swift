//
//  MakeAScrollViewSnap.swift
//  PositionViews
//
//  Created by Virgi Septian on 25/07/25.
//

import SwiftUI

struct MakeAScrollViewSnap: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(1..<6) { i in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(width: 300, height: 400)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
        
        Divider()
        
        ScrollView {
            ForEach(0..<50) { i in
                Text("Item \(i)")
                    .font(.largeTitle)
                    .frame(height: 400)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 14))
                    .padding(.horizontal, 15)
            }
        }
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    MakeAScrollViewSnap()
}
