//
//  DisableTapsForAView.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct DisableTapsForAView: View {
    var body: some View {
        ZStack {
            Button("Tap Me") {
                print("Button was tapped")
            }
            .frame(width: 100, height: 100)
            .background(.gray)

            Rectangle()
                .fill(.red.opacity(0.2))
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                /// If hit testing is disallowed for a view, any taps automatically continue through the view on to whatever is behind it.
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    DisableTapsForAView()
}
