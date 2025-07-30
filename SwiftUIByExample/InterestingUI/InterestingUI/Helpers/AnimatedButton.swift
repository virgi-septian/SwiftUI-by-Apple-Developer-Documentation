//
//  AnimatedButton.swift
//  InterestingUI
//
//  Created by Virgi Septian on 30/07/25.
//

import SwiftUI

struct AnimatedButton: View {
    var config: Config
    var shape: AnyShape = .init(.capsule)
    var onTap: () async -> ()
    /// View Properties
    @State private var isLoading: Bool = false
    var body: some View {
        Button {
            Task {
                isLoading = true
                await onTap() // Memanggil closure onTap secara asinkron
                isLoading = false
            }
        } label: {
            HStack(spacing: 10) {
                if let symbolImage = config.symbolImage {
                    Image(systemName: symbolImage)
                        .font(.title3)
                        .transition(.blurReplace)
                } else {
                    if isLoading {
                        Spinner(tint: config.foregroundColor, lineWidth: 4)
                            .frame(width: 20, height: 20)
                            .transition(.blurReplace)
                    }
                }
                
                Text(config.title)
                    .contentTransition(.interpolate)
                    .fontWeight(.semibold)
            }
            .padding(.horizontal, config.hPadding)
            .padding(.vertical, config.vPadding)
            .foregroundStyle(config.foregroundColor)
            .background(config.background.gradient)
            .clipShape(shape)
            .contentShape(shape)
            
        }
//        .animation(config.animation, value: config)
        /// Menonaktifkan Button saat Task Sedang Berjalan
        .disabled(isLoading)
        /// Mari buat gaya tombol kustom yang menggunakan animasi skala daripada opacity default
        .buttonStyle(ScaleButtonStyle())
        .animation(config.animation, value: config)
        .animation(config.animation, value: isLoading)

    }
    
    struct Config: Equatable {
        var title: String
        var foregroundColor: Color
        var background: Color
        var symbolImage: String?
        var hPadding: CGFloat = 15
        var vPadding: CGFloat = 10
        var animation: Animation = .easeInOut(duration: 0.2)
    }
}

fileprivate struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .animation(.linear(duration: 0.2)) { // Animasi linear saat ditekan
                $0
                    .scaleEffect(configuration.isPressed ? 0.9 : 1) // Mengubah skala saat ditekan
            }
    }
}
