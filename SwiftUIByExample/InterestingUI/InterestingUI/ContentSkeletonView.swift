//
//  SkeletonLoadingAnimations.swift
//  InterestingUI
//
//  Created by Virgi Septian on 12/07/25.
//

import SwiftUI

struct ContentSkeletonView: View {
    @State private var isLoading: Bool = false
    @State private var cards: [Card] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
               
                if cards.isEmpty {
                    /// Your Custom Count
                   
                    ForEach(0..<3, id: \.self) { _ in
                        SomeCardView()
                    }
                } else {
                   
                    ForEach(cards) { card in
                        SomeCardView(card: card)
                    }
                }
            }
            .padding(20)
        }
        .scrollDisabled(cards.isEmpty)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .onTapGesture {
            withAnimation(.smooth) {
                
                cards = [
                    .init(
                        image: "WWDC 25",
                        title: "World Wide Developer Conference 2025",
                        subTitle: "From June 9th 2025",
                        description: "Be there for the reveal of the latest Apple tools, frameworks, and features. Learn to elevate your apps and games through video sessions hosted by Apple engineers and designers." 
                    )
                ]
            }
        }
    }

}

struct Card: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    var subTitle: String
    var description: String
}

struct SomeCardView: View {
    var card: Card?
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Rectangle()
                .foregroundStyle(.clear)
                .overlay {
                    if let card {
                        Image(card.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else {
                        SkeletonView(.rect)
                    }
                }
                .frame(height: 220)
                .clipped()

            VStack(alignment: .leading, spacing: 10) {
                
                
                if let card {
                    Text(card.title)
                        .fontWeight(.semibold)
                } else {
                    SkeletonView(.rect(cornerRadius: 5))
                        .frame(height: 20)
                }
                
                Group {
                    if let card {
                        Text(card.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                    } else {
                        SkeletonView(.rect(cornerRadius: 5))
                            .frame(height: 20)
                    }
                }
                .padding(.trailing, 30)
                
                ZStack {
                    if let card {
                        Text(card.description)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    } else {
                        SkeletonView(.rect(cornerRadius: 5))
                    }
                }
                .frame(height: 50)
                .lineLimit(3)
            }
            .padding([.horizontal, .top], 15)
            .padding(.bottom, 25)
        }
        .background(.background)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 10)

    }
}

#Preview {
    ContentSkeletonView()
}
