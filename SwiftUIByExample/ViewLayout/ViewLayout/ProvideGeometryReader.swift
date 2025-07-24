//
//  GeometryReader.swift
//  ViewLayout
//
//  Created by Virgi Septian on 12/07/25.
//

import SwiftUI

struct ProvideGeometryReader: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text("Left")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .frame(width: geometry.size.width * 0.50)
                    .background(.yellow)
                Text("Right")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .frame(width: geometry.size.width * 0.50)
                    .background(.orange)
            }
        }
        .frame(height: 50)
    }
}

#Preview {
    ProvideGeometryReader()
}
