//
//  detect whether a ScrollViewIsCurrentlyMovingOrIsIdle.swift
//  PositionViews
//
//  Created by Virgi Septian on 28/07/25.
//

import SwiftUI

struct DetectWhetherAScrollViewIsCurrentlyMovingOrIsIdle: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        ScrollView {
            backgroundColor
                .frame(height: 2000)
        }
        .onScrollPhaseChange { oldPhase, newPhase in
            if newPhase == .interacting {
                backgroundColor = .green
            } else {
                backgroundColor = .red
            }
        }
    }
}


#Preview {
    DetectWhetherAScrollViewIsCurrentlyMovingOrIsIdle()
}
