//
//  GradientGenerator.swift
//  InterestingUI
//
//  Created by Virgi Septian on 25/06/25.
//

import SwiftUI
import FoundationModels

@available(iOS 26.0, *)

struct GradientGenerator: View {
    /// Generator Properties
    @State private var isGenerating: Bool = false
    @State private var generationLimit: Int = 3
    @State private var userPrompt: String = ""
    @State private var palletes: [Palette] = []
    /// View Properties
    @State private var isStopped: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Gradient Generator")
                .font(.largeTitle.bold())

            ScrollView(palletes.isEmpty ? .vertical : .horizontal) {
                HStack(spacing: 12) {
                    /// Animated Generating Effect
                    if isGenerating || palletes.isEmpty {
                        VStack(spacing: 6) {
                            KeyframeAnimator(initialValue: 0.0, trigger: true) { rotation in
                                Image(systemName: "apple.intelligence")
                                    .font(.largeTitle)
                                    .rotationEffect(.init(degrees: rotation))
                            } keyframes: { _ in
                                LinearKeyframe(0, duration: 0)
                                LinearKeyframe(360, duration: 5)
                            }

                            
                            if palletes.isEmpty {
                                Text("Start Crafting Your Gradient ...")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .padding(15)
                .frame(height: 100)

            }
                
            TextField("Gradient Promt", text: $userPrompt)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .glassEffect()
            
            /// stepper
            Stepper("Generation Limit: **\(generationLimit)**", value: $generationLimit, in: 1...10)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .glassEffect()

            Button {
                if isGenerating {
                    isStopped = true
                } else {
                    generatePalettes()
                }
            } label: {
                Text(isGenerating ? "Stop Crafting" : "Craft Gradient")
                    .contentTransition(.numericText())
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(.blue.gradient, in: .capsule)
            }
        }
        .safeAreaPadding(15)
        /// Optional Glass Background
        .glassEffect(.regular, in: .rect(cornerRadius: 20, style: .continuous))
    }
    
    private func generatePalettes() {
        
    }
}

//#Preview {
//    GradientGenerator()
//        .padding()
//}

@available(iOS 26.0, *)
@Generable
struct Palette: Identifiable {
    var id: Int
    @Guide(description: "Gradient Name")
    var name: String
    @Guide(description: "Hex Color Codes")
    var colors: String
}
