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
    @Binding var generationLimit: Int
    @Binding var userPrompt: String
    @Binding var currentPalette: Palette?

    var onTap: (Palette) -> ()
    /// Generator Properties
    @State private var isGenerating: Bool = false
    /// View Properties
    @State private var palettes: [Palette] = []
    @State private var isStopped: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Gradient Generator")
                .font(.largeTitle.bold())
            
            ScrollView(palettes.isEmpty ? .vertical : .horizontal) {
                HStack(spacing: 12) {
                    ForEach(palettes) { palette in
                        VStack(spacing: 4) {
                            LinearGradient(colors: palette.swiftUIColors, startPoint: .top, endPoint: .bottom)
                                .clipShape(.circle)
                        
                            Text(palette.name)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .contentShape(.rect)
                        .onTapGesture {
                            onTap(palette)
                        }
                    }
                    
                    /// Animated Generating Effect
                    if isGenerating || palettes.isEmpty {
                        VStack(spacing: 6) {
                            KeyframeAnimator(initialValue: 0.0, trigger: true) { rotation in
                                Image(systemName: "apple.intelligence")
                                    .font(.largeTitle)
                                    .rotationEffect(.init(degrees: rotation))
                            } keyframes: { _ in
                                LinearKeyframe(0, duration: 0)
                                LinearKeyframe(360, duration: 5)
                            }

                            
                            if palettes.isEmpty {
                                Text("Start Crafting Your Gradient ...")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .padding(15)

            }
            .frame(height: 100)
            .defaultScrollAnchor(.trailing, for: .sizeChanges)
            .disableWithOpacity(isGenerating)

                
            TextField("Gradient Promt", text: $userPrompt)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .glassEffect()
                .disableWithOpacity(isGenerating)

            
            /// stepper
            Stepper("Generation Limit: **\(generationLimit)**", value: $generationLimit, in: 1...10)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .glassEffect()
                .disableWithOpacity(isGenerating)

            Button {
                if isGenerating {
                    isStopped = true
                } else {
                    isStopped = false
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
            .disableWithOpacity(userPrompt.isEmpty)

        }
        .safeAreaPadding(15)
        /// Optional Glass Background
        .background(
            LinearGradient(
                colors: currentPalette?.swiftUIColors ?? [.white, .gray.opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
//        .glassEffect(.regular, in: .rect(cornerRadius: 20, style: .continuous))
    }
    
    private func generatePalettes() {
        Task {
            do {
                isGenerating = true
                
                let instructions = """
                    Generate a smooth gradient color palette based on the user's prompt. The
                    gradient should transition between two or more colors relevant to
                    the theme, mood, or elements described in the prompt. Limit the
                    result to only \(generationLimit) palettes.
                """

                let session = LanguageModelSession {
                    instructions
                }

                let response = session.streamResponse(
                    to: userPrompt,
                    generating: [Palette].self
                )
                
                for try await partialResult in response {
                    // `partialResult` isinya snapshot: array of `Palette.PartiallyGenerated`
                    let palettes: [Palette] = partialResult.content.compactMap { partial in
                        // Akses field optional dari `Palette.PartiallyGenerated`
                        guard let id = partial.id,
                              let name = partial.name,
                              let colors = partial.colors?.compactMap({ $0 }),
                              colors.count > 2 else {
                            return nil
                        }
                        
                        return Palette(id: id, name: name, colors: colors)
                    }
                    
                    // Update UI dengan animasi
                    withAnimation(.snappy(duration: 0.3, extraBounce: 0)) {
                        self.palettes = palettes
                    }
                    
                    if isStopped {
                        print("User-Stopped")
                        isGenerating = false
                        return
                    }
                }

                isGenerating = false
                
            } catch {
                print(error.localizedDescription)
                isGenerating = false
            }
        }
    }
}

@available(iOS 26.0, *)
@Generable
struct Palette: Identifiable {
    var id: Int
    @Guide(description: "Gradient Name")
    var name: String
    @Guide(description: "Hex Color Codes")
    var colors: [String]
    
    var swiftUIColors: [Color] {
        colors.compactMap({ .init(hex: $0) })
    }
}

extension View {
    func disableWithOpacity(_ status: Bool) -> some View {
        self
            .disabled(status)
            .opacity(status ? 0.5 : 1.0)
    }
}

/// Hex to SwiftUI Extention
extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        ContentGradientGenerator()
    } else {
        // Fallback on earlier versions
    }
}
