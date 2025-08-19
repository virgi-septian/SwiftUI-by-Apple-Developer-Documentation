//
//  InstagramBubbleChat.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct InstagramBubbleChat: View {
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    LazyVStack(spacing: 14) {
                        ForEach(messages) { message in
                            /// Here we show messages
                            MessageView(message: message, screenProxy: proxy)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct MessageView: View {
    var message: Message
    
    var screenProxy: GeometryProxy

    var body: some View {
        Text(message.message)
            .padding(10)
            .background {
                if message.messageType == .reply {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.gray.opacity(0.24))
                } else {
                    // Placeholder for user message background, maybe a different color
                    GeometryReader {
                        let actualSize = $0.size
                        let rect = $0.frame(in: .global)
                        let screenSize = screenProxy.size
                        let safeArea = screenProxy.safeAreaInsets
                        
                        Rectangle()
                            .fill(
                                LinearGradient(colors: [Color.yellow, Color.orange, .pink, .purple, .blue],
                                               startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .mask(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: actualSize.width, height: actualSize.height)
                                    .offset(x: rect.minX, y: rect.minY)
                            }
                            .offset(x: -rect.minX, y: -rect.minY)
                            .frame(width: screenSize.width, height: screenSize.height + safeArea.top + safeArea.bottom)
                    }
                }
            }
            // Align message to leading (left) for user and trailing (right) for reply
            .frame(maxWidth: .infinity, alignment: message.messageType == .reply ? .leading : .trailing)
            // The original code had a duplicate frame, which might be a typo.
            // Using a single frame with conditional alignment is better.
    }
}

#Preview {
    InstagramBubbleChat()
}

