//
//  FacebookReaction.swift
//  InterestingUI
//
//  Created by Virgi Septian on 24/08/25.
//

import SwiftUI

struct FacebookReaction: View {
    /// View Model Data
    @State var reactionModel = ReactionModel(reacted: false, reaction: .like, xAxisToolTip: 0)
    
    var body: some View {
        ScrollView {
            HStack(spacing: 10) {
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                
                Spacer()
                
                CustomCircleButton(icon: "magnimagnifyingglass")
                CustomCircleButton(icon: "ellipsis.message.fill")
            }
            .padding(.horizontal)
            
            Rectangle()
                .foregroundStyle(.gray)
            
            VStack {
                HStack(spacing: 15) {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                        .clipShape(Circle())
                    
                    VStack {
                        Text("Virgi")
                            .font(.title3)
                            .bold()
                        
                        Text("Just Now")
                            .font(.callout)
                            .opacity(0.5)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        
                }
                .padding([.horizontal, .top])
                
                Text("3D Parallax Card Effect in SwiftUI\nEarly Access ✨ Source Code For 3D Parall...")

                Image("image")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)

                Rectangle()
                    .foregroundColor(.gray.opacity(0.1))
                    .frame(height: 4)

                HStack {
                    Image("like")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 26)

                    Image("love")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 26)
                        .padding(.leading, -18)

                    Text("1K")
                        .opacity(0.8)

                    Spacer()
                    
                    Text("99 comments 99 shares")
                }
                .padding(.horizontal)
                
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.1))
                    .frame(height: 2)
                    .padding(.horizontal)
                
                HStack {
                    ReactionView(reactionModel: $reactionModel)
                }
            }
        }
    }
}

struct CustomCircleButton: View {
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .padding(8)
            .imageScale(.large)
            .background(.gray.opacity(0.1))
            .clipShape(Circle())
    }
}

#Preview {
    FacebookReaction()
}
