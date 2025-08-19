//
//  DrawACheckerboard.swift
//  Drawing
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI


struct Checkerboard: Shape {
    let rows: Int
    let columns: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct DrawACheckerboard: View {
    var body: some View {
        Checkerboard(rows: 8, columns: 8)
            .fill(.red)
            .frame(width: 400, height: 400)
    }
}

#Preview {
    DrawACheckerboard()
}
