//
//  StaggeredView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 31/07/25.
//

import SwiftUI


struct StaggeredView<Content: View>: View {
    var config: StaggeredConfig = .init()
    @ViewBuilder var content: Content
    var body: some View {
        Group(subviews: content) { collection in
            ForEach(collection.indices, id: \.self) { index in
                collection[index]
                    .transition(CustomStaggeredTransition(index: index, config: config))
            }
        }
    }
}

fileprivate struct CustomStaggeredTransition: Transition {
    var index: Int
    var config: StaggeredConfig

    func body(content: Content, phase: TransitionPhase) -> some View {
        let animationDelaay: Double = min(Double(index) * config.delay, config.maxDelay)
        let isIdentity: Bool = phase == .identity
        let didDisappear: Bool = phase == .didDisappear
        let x: CGFloat = config.offset.width
        let y: CGFloat = config.offset.height

        let reverseX: CGFloat = config.disappearInSameDirection ? x : -x
        let disableX: CGFloat = config.noDisappearAnimation ? 0 : reverseX

        let reverseY: CGFloat = config.disappearInSameDirection ? y : -y
        let disableY: CGFloat = config.noDisappearAnimation ? 0 : reverseY

        let offsetX = isIdentity ? 0 : didDisappear ? disableX : x
        let offsetY = isIdentity ? 0 : didDisappear ? disableY : y

        content
            .opacity(isIdentity ? 1 : 0)
            .blur(radius: isIdentity ? 0 : config.blurRadius)
            .compositingGroup()
            .scaleEffect(isIdentity ? 1 : config.scale, anchor: config.scaleAnchor)
            .offset(x: offsetX, y: offsetY)
            .animation(config.animation.delay(animationDelaay), value: phase)
    }
}

/// Config
struct StaggeredConfig {
    var delay: Double = 0.05
    var maxDelay: Double = 0.2
    var blurRadius: CGFloat = 6
    var offset: CGSize = .init(width: 420, height: 0)
    var scale: CGFloat = 0.95
    var scaleAnchor: UnitPoint = .center
    var animation: Animation = .smooth(duration: 0.3, extraBounce: 0)
    var disappearInSameDirection: Bool = true
    var noDisappearAnimation: Bool = true
    /// Tambahkan properti lain sesuai kebutuhan Anda!
}

#Preview {
    ContentStaggeredView()
}
