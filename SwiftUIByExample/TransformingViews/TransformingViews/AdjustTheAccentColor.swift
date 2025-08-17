//
//  AdjustTheAccentColor.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct AdjustTheAccentColor: View {
    var body: some View {
        /// iOS uses tint colors to give apps a coordinated theme, and the same functionality is available in SwiftUI under the name accent colors. Just like in UIKit, when you set the accent color of one view it affects all those inside it, so if you set the access color of your top-level control then everything gets colored.
        VStack {
            Button("Press Here") {
                print("Button pressed!")
            }
        }
        .accentColor(.black)
    }
}

#Preview {
    AdjustTheAccentColor()
}
