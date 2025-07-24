//
//  LayoutPriority.swift
//  ViewLayout
//
//  Created by Virgi Septian on 14/07/25.
//

import SwiftUI

struct LayoutPriority: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Text("The rain Spain falls mainly on the Spaniards.")
                    Text("Knowledge is power, France is bacon.")
                }
                .font(.caption)
            }
            
            Section {
                HStack {
                    Text("The rain Spain falls mainly on the Spaniards.")
                    Text("Knowledge is power, France is bacon.")
                        .layoutPriority(1)
                }
                .font(.caption)
            }
        }
    }
}

#Preview {
    LayoutPriority()
}
