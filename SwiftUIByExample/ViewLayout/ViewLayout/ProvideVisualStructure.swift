//
//  ProvideVisualStructure.swift
//  ViewLayout
//
//  Created by Virgi Septian on 14/07/25.
//

import SwiftUI

struct ProvideVisualStructure: View {
    var body: some View {
        HStack {
            Image(systemName: "clock.fill")
            Text("Set the time")
        }
        .font(.largeTitle.bold())
        .foregroundStyle(.quaternary)
        .padding(.bottom, 30)
        
        HStack {
            Image(systemName: "clock.fill")
            Text("Set the time")
        }
        .font(.largeTitle.bold())
        .foregroundStyle(
            .linearGradient(
                colors: [.red, .black],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    ProvideVisualStructure()
}
