//
//  RotateAViewIn3D.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

/// Important: If you’ve never done 3D rotation before you should think about the X/Y/Z axes as being skewers through your views. The X axis goes horizontally, so if you rotate on the X axis it’s like putting a horizontal skewer through your view – any rotation makes the top or bottom nearer or further, but won’t adjust the leading and trailing edges.
struct RotateAViewIn3D: View {
    var body: some View {
        Text("EPISODE LLVM")
            .font(.largeTitle)
            .foregroundStyle(.yellow)
            .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
    }
}

#Preview {
    RotateAViewIn3D()
}
