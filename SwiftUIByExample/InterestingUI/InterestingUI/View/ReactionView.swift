//
//  ReactionView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 24/08/25.
//

import SwiftUI

struct ReactionModel {
    var reacted: Bool
    var reaction: Reactions
    var show: Bool = false
    var xAxisToolTip: Int
}

enum Reactions: Int {
    case like = 0
    case love = 1
    case celebrate = 2
    case haha = 3
    case wow = 4
    case none
    
    var values: (name: String, selectedName: String, image: Image, color: Color) {
        get {
            switch self {
            case .like:
                return ("Like", "Like", Image(systemName: "hand.thumbsup.fill"), .blue)
            case .love:
                return ("Love", "Loved", Image("love"), .pink)
            case .celebrate:
                return ("Celebrate", "Celebrated", Image("celebrate"), .purple)
            case .haha:
                return ("Haha", "Haha", Image("haha"), .yellow.mix(with: .gray, by: 0.5))
            case .wow:
                return ("Wow", "Wow", Image("wow"), .yellow.mix(with: .gray, by: 0.5))
            case .none:
                return ("", "", Image("like"), .yellow.mix(with: .gray, by: 0.5))
            }
        }
    }
}

var reactions: [Reactions] = [.like, .love, .celebrate, .haha, .wow]

struct ReactionView: View {
    @Binding var reactionModel: ReactionModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            ReactionButtonView(reactionModel: $reactionModel)
                .zIndex(0)
            
            if reactionModel.show {
                ReactionToolTipView(reactionViewModel: $reactionModel)
                    .offset(y: -60)
                    .padding(.leading)
                    .zIndex(1)
            }
        }
    }
}

/// Reaction Button
struct ReactionButtonView: View {
    @Binding var reactionModel: ReactionModel

    @State private var selectedReaction = Reactions.none

    var body: some View {
        HStack {
//            HStack(alignment: .center, spacing: 10) {
//                if reactionModel.reacted {
//                    selectedReaction.values.image
//                        .resizable()
//                        .frame(width: 26, height: 26)
//                } else {
//                    Image(systemName: "hand.thumbsup")
//                        .resizable()
//                        .frame(width: 26, height: 26)
//                }
//
//                Text(selectedReaction != .none ?
//                     selectedReaction.values.selectedName :
//                     Reactions.like.values.name)
//                    .font(.headline)
//            }
//            .foregroundColor(selectedReaction != .none ?
//                             selectedReaction.values.color : .gray)
//            .padding()
//            .frame(height: 40)
//            .frame(maxWidth: .infinity)
            
            HStack(alignment: .center, spacing: 10) {
                if reactionModel.reacted {
                    selectedReaction.values.image
                        .resizable()
                        .frame(width: 26, height: 26)
                } else {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 26, height: 26)
                }

                Text(selectedReaction != .none ?
                     selectedReaction.values.selectedName :
                     Reactions.like.values.name)
                    .font(.headline)
            }
            .foregroundColor(selectedReaction != .none ?
                             selectedReaction.values.color : .gray)
            .padding()
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .onTapGesture {
                reactionModel.reacted.toggle()
                if reactionModel.reacted {
                    selectedReaction = .like
                    reactionModel.reaction = .none
                } else {
                    selectedReaction = .none
                    reactionModel.reaction = .like
                }
            }
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged(onChanged(value:))
                .onEnded(onEnded(value:)))
            
            /// Other facebook button just for UIDesign
            HStack(alignment: .center, spacing: 10) {
                
                Image(systemName: "ellipsis.message")
                    .resizable()
                    .frame(width: 26, height: 26)
                

                Text("Comment")
                    .font(.headline)
            }
            .foregroundColor(.gray)
            .padding()
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            
            HStack(alignment: .center, spacing: 10) {
                
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .frame(width: 20, height: 20)
                

                Text("Share")
                    .font(.system(size: 18, weight: .semibold))
                
            }
            .foregroundColor(.gray)
            .padding()
            .frame(height: 40)
            .frame(maxWidth: .infinity)
        }
    }
    
    // Mark: Touch Down
    func onChanged(value: DragGesture.Value) {
        withAnimation(.easeIn) { reactionModel.show = true }
        withAnimation(.linear(duration: 0.15)) {
            let height = value.translation.height
            // Touch Up
            let reactionOffsetValue: CGFloat = -40
            if height <= reactionOffsetValue {
                self.setReactionAndToolTipLocationX(location: Int(value.location.x))
            } else {
                reactionModel.xAxisToolTip = ReactionsToolTipLocationX.outOfRange
                reactionModel.reaction = .none
            }
        }
    }

    // Mark: Touch up
    func onEnded(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            reactionModel.show = false
        }
        
        if reactionModel.reaction != .none {
            selectedReaction = reactionModel.reaction
            reactionModel.reacted = true
        }
    }

    // Mark: Set Updated value to view Model
    func setReactionAndToolTipLocationX(location: Int) {
        switch location {
        case ReactionsRange.like:
            reactionModel.xAxisToolTip = ReactionsToolTipLocationX.like
            reactionModel.reaction = .like
            
        case ReactionsRange.love:
            reactionModel.xAxisToolTip = ReactionsToolTipLocationX.love
            reactionModel.reaction = .love

        case ReactionsRange.celebrate:
            reactionModel.xAxisToolTip = ReactionsToolTipLocationX.celebrate
            reactionModel.reaction = .celebrate

        case ReactionsRange.haha:
            reactionModel.xAxisToolTip = ReactionsToolTipLocationX.haha
            reactionModel.reaction = .haha
        
        // Terlihat ada pengulangan pada beberapa `case` di bawah ini
        case ReactionsRange.wow:
            reactionModel.xAxisToolTip = ReactionsToolTipLocationX.wow
            reactionModel.reaction = .wow

        case ReactionsRange.leading, ReactionsRange.trailing:
            reactionModel.xAxisToolTip = ReactionsToolTipLocationX.outOfRange
            reactionModel.reaction = .none

        default:
            reactionModel.xAxisToolTip = ReactionsToolTipLocationX.outOfRange
            reactionModel.reaction = .none
        }
    }
}

struct ReactionToolTipView: View {
    @Binding var reactionViewModel : ReactionModel // Here my mistake in Reaction
    
    var body: some View {
        ZStack(alignment: .leading) {
            if reactionViewModel.xAxisToolTip != 0 {
                toolTipView(title: reactionViewModel.reaction.values.name, offsetX: reactionViewModel.xAxisToolTip, offsetY: -50)
            }
            
            HStack(spacing: 10) {
                ForEach(reactions, id: \.self) { reaction in
                    reaction.values.image
                        .resizable()
                        .foregroundColor(reaction.values.name == "Like" ? Color.blue : Color.gray)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: reaction.values.name == reaction.values.name ? 40 : 40, height: reaction.values.name == reaction.values.name ? 40 : 40)
                        .padding(reactionViewModel.reaction.values.name == reaction.values.name ? -8 : 0)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(Color.white.clipShape(Capsule()))
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: 5)
        }
    }
    
    @ViewBuilder
    func toolTipView(title: String, offsetX: Int, offsetY: Int) -> some View {
        Text(title)
            .font(.subheadline)
            .foregroundColor(.white)
            .fixedSize(horizontal: true, vertical: false)
            .padding(10)
            .frame(height: 22)
            .background(Color.black.opacity(0.8).clipShape(Capsule()))
            .offset(x: CGFloat(offsetX), y: CGFloat(offsetY))
    }
}

enum ReactionsRange {
    static let like = 11 ..< 60
    static let love = 61 ..< 110
    static let celebrate = 111 ..< 160
    static let haha = 161 ..< 210
    static let wow = 210 ..< 268
    static let trailing = 261 ..< Int(UIScreen.main.bounds.width)
    static let leading = 0 ..< 11
}

enum ReactionsToolTipLocationX {
    static let like = 10
    static let love = 40
    static let celebrate = 100
    static let haha = 150
    static let wow = 200
    static let outOfRange = 0
}

#Preview {
    FacebookReaction()
}
