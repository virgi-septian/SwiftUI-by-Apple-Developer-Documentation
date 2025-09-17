//
//  GradientGenerator.swift
//  InterestingUI
//
//  Created by Virgi Septian on 25/06/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct ContentGradientGenerator: View {
    @State private var generateLimit: Int = 3
    @State private var userPrompt: String = ""
    @State private var currentPalette: Palette?
    var body: some View {
        GradientGenerator(generationLimit: $generateLimit, userPrompt: $userPrompt, currentPalette: $currentPalette) { palette in
            self.currentPalette = palette
        }
        .padding(15)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ContentGradientGenerator()
    } else {
        // Fallback on earlier versions
    }
}
