//
//  Highlight.swift
//  InterestingUI
//
//  Created by Virgi Septian on 26/08/25.
//

import SwiftUI

struct Highlight: Identifiable, Equatable {
    var id: UUID = .init()
    var anchor: Anchor<CGRect>
    var title: String
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle = .continuous
    var scale: CGFloat = 1
}
