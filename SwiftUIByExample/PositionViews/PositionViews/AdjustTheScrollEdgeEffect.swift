//
//  AdjustTheScrollEdgeEffect.swift
//  PositionViews
//
//  Created by Virgi Septian on 28/07/25.
//

import SwiftUI

struct AdjustTheScrollEdgeEffect: View {
    var body: some View {
        NavigationStack {
            List(1..<101) { i in
                Text("Row \(i)")
            }
            .scrollEdgeEffectStyle(.hard, for: .top)
        }
        
        Divider()
        
        NavigationStack {
            List(1..<101) { i in
                Text("Row \(i)")
            }
            .scrollEdgeEffectStyle(.hard, for: .top)
            .toolbar {
                ToolbarItem(placement: .title) {
                    Label("My Awesome App", systemImage: "sparkles")
                        .labelStyle(.titleAndIcon)
                }
            }
        }
    }
}

#Preview {
    AdjustTheScrollEdgeEffect()
}
