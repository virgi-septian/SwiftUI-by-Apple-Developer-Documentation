//
//  GradientGenerator.swift
//  InterestingUI
//
//  Created by Virgi Septian on 25/06/25.
//

import SwiftUI

struct GradientGenerator: View {
    /// Generator Properties
    @State private var isGenerating: Bool = false
    @State private var generationLimit: Int = 3
    @State private var userPrompt: String = ""
    /// View Properties
    @State private var isStopped: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Gradient Generator")
                .font(.largeTitle.bold())

            ScrollView(.horizontal) {
                HStack(spacing: 12) {

                }
                .padding(15)
                .frame(height: 100)

            }
            .safeAreaPadding(15)
            /// Optional Glass Background
//            .glassEffect(.regular, in: .rect(cornerRadius: 20, style: .continuous))
        }
    }
}

//#Preview {
//    GradientGenerator()
//        .padding()
//}
