//
//  ScaleAViewUpOrDown.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct ScaleAViewUpOrDown: View {
    var body: some View {
        /// For example, we could make a text view five times its regular size like this:
        Text("Up we go")
            .scaleEffect(5)
            .frame(width: 300, height: 300)
        
        /// You can scale the X and Y dimensions independently if you want, allowing you to squash views like this:
        Text("Up we go")
            .scaleEffect(x: 1, y: 5)
            .frame(width: 300, height: 300)
        
        /// If you want more control, you can specify an anchor for your scaling like this:
        VStack {
            Text("Up we go")
                .scaleEffect(2, anchor: .bottomTrailing)
            Text("Up we go")
        }
    }
}

#Preview {
    ScaleAViewUpOrDown()
}
