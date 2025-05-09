//
//  SpacingBetweenLetters.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 09/05/25.
//

import SwiftUI

struct SpacingBetweenLetters: View {
    @State private var amount: CGFloat = 0
    var body: some View {
        Text("ffi")
            .font(.custom("AmericanTypeWritter", size: 20))
            .kerning(amount)
        
        Text("ffi")
            .font(.custom("AmericanTypeWritter", size: 20))
            .tracking(amount)
        
        Slider(value: $amount, in: 0...10) {
            Text("Adjust the amount of spacing")
        }
    }
}

#Preview {
    SpacingBetweenLetters()
}
