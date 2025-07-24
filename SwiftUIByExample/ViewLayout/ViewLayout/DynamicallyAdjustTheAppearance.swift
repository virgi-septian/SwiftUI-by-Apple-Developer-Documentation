//
//  DynamicallyAdjustTheAppearance.swift
//  ViewLayout
//
//  Created by Virgi Septian on 20/07/25.
//

import SwiftUI
/// Dynamically adjust the appearance of a view based on its size and location
struct DynamicallyAdjustTheAppearance: View {
//    var body: some View {
//       ScrollView {
//           ForEach(0..<100) { i in
//               Text("Row \(i)")
//                   .font(.largeTitle)
//                   .frame(maxWidth: .infinity)
//                   .visualEffect { content, proxy in
//                       content.blur(radius: blurAmount(for: proxy))
//                   }
//           }
//       }
//   }
//
//   func blurAmount(for proxy: GeometryProxy) -> Double {
//       let scrollViewHeight = proxy.bounds(of: .scrollView)?.height ?? 100
//       let ourCenter = proxy.frame(in: .scrollView).midY
//       let distanceFromCenter = abs(scrollViewHeight / 2 - ourCenter)
//       return Double(distanceFromCenter) / 100
//   }
    
    @State private var rotationAmount = 0.0

    var body: some View {
        Grid {
            ForEach(0..<3) { _ in
                GridRow {
                    ForEach(0..<3) { _ in
                        Circle()
                            .fill(.green)
                            .frame(width: 100, height: 100)
                            .visualEffect { content, proxy in
                                content.hueRotation(.degrees(proxy.frame(in: .global).midY / 2))
                            }
                    }
                }
            }
        }
        .rotationEffect(.degrees(rotationAmount))
        .onAppear {
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                rotationAmount = 360
            }
        }
    }
}


#Preview {
    DynamicallyAdjustTheAppearance()
}
