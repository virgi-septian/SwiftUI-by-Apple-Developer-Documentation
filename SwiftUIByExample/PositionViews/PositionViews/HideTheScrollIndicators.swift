//
//  HideTheCcrollIndicators.swift
//  PositionViews
//
//  Created by Virgi Septian on 24/07/25.
//

import SwiftUI

struct HideTheScrollIndicators: View {
    /// There are four options available to us, and there are subtle distinctions:
    
    ///     The default is .automatic, which is what you’d get without the modifier in place - SwiftUI will do whatever it thinks is best.
    ///     Specify .visible to get auto-hiding indicators on iOS, or to respect whatever is the user’s preference on macOS.
    ///     Use .hidden to hide the indicators on iOS, and mostly hide them on macOS too – if the user connects a mouse, the scroll indicators will return.
    ///     Use .never to hide the indicators on iOS and also on macOS, regardless of what pointing device user has.
    
    var body: some View {
        List(1..<100) { i in
            Text("Row \(i)")
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HideTheScrollIndicators()
}
