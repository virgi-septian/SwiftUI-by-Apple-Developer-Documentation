//
//  DrawACustomPath.swift
//  Drawing
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct ShrinkingSquares: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        for i in stride(from: 1, through: 100, by: 5.0) {
            let rect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            let insetRect = rect.insetBy(dx: i, dy: i)
            path.addRect(insetRect)
        }

        return path
    }
}

struct DrawACustomPath: View {
    var body: some View {
        ShrinkingSquares()
            .stroke()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    DrawACustomPath()
}
