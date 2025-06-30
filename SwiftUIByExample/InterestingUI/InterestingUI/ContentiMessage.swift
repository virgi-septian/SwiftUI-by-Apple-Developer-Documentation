//
//  ContentiMessage.swift
//  InterestingUI
//
//  Created by Virgi Septian on 30/06/25.
//

import SwiftUI

struct ContentiMessage: View {
    @State private var config: MenuConfig = .init(symbolImage: "p")
    var body: some View {
        iMessage(config: $config) {
            /// Root view
            NavigationStack {
                ScrollView(.vertical) {
                   
                }
                .navigationTitle("iMessages")
                .safeAreaInset(edge: .bottom) {
                    ButtonBar()
                }
            }
        } actions: {
            /// Sample actions
            MenuAction(symbolImage: "camera", text: "Camera")
            MenuAction(symbolImage: "photo.on.rectangle.angled", text: "Photos")
            MenuAction(symbolImage: "face.smiling", text: "Genmoji")
            MenuAction(symbolImage: "waveform", text: "Audio")
            MenuAction(symbolImage: "apple.logo", text: "App Store")
            MenuAction(symbolImage: "video.badge.waveform", text: "Facetime")
            MenuAction(symbolImage: "rectangle.and.text.magnifyingglass", text: "Images")
            MenuAction(symbolImage: "suit.heart", text: "Digital Touch")
            MenuAction(symbolImage: "location", text: "Location")
            MenuAction(symbolImage: "music.note", text: "Music")
        }
    }
    
    /// Custom button bar
    @ViewBuilder
    func ButtonBar() -> some View {
        HStack(spacing: 12) {
            /// Custom menu source button
            MenuSourceButton(config: $config) {
                Image(systemName: "plus")
                    .font(.title3)
                    .frame(width: 35, height: 35)
                    .background {
                        Circle()
                            .fill(.gray.opacity(0.25))
                            .background(.background, in: .circle)
                    }
            } onTap: {
                /// Example :
                ///  Can close keyboard if opened, etc !
                print("Tapped")
            }

            TextField("Text Message", text: .constant(""))
                .padding(.vertical, 8)
                .padding(.horizontal, 15)
                .background {
                    Capsule()
                        .stroke(.gray.opacity(0.3), lineWidth: 1.5)
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom, 10)
    }
}

#Preview {
    ContentiMessage()
}
