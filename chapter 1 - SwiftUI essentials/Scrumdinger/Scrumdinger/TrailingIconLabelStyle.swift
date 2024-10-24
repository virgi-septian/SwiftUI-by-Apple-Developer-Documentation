//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 24/10/24.
//

//  The goal is to create a label with an icon placed to the right (trailing) of its text. By default, in SwiftUI, the icon on a Label is usually placed to the left of the text, but with this custom style, we can change that.

import SwiftUI


struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}


extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
