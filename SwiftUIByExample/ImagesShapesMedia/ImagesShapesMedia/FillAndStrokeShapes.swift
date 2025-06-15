//
//  FillSndStrokeShapes.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 12/06/25.
//

import SwiftUI

extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

struct FillAndStrokeShapes: View {
    var body: some View {
        VStack {
            Text("Fill And Stroke Shapes At The Same Time")
            
            List {
                Section {
                    Circle()
                        .stroke(.red, lineWidth: 20)
                        .fill(.orange)
                        .frame(width: 150, height: 150)
                }
                
                Section {
                    Circle()
                        .stroke(.blue, lineWidth: 45)
                        .stroke(.green, lineWidth: 35)
                        .stroke(.yellow, lineWidth: 25)
                        .stroke(.orange, lineWidth: 15)
                        .stroke(.red, lineWidth: 5)
                        .frame(width: 150, height: 150)
                }
                
                
//                In iOS 16 and below, SwiftUI provides the fill(), stroke(), and strokeBorder() modifiers for adjusting the way we draw shapes, but it does not provide a built-in way to fill and stroke at the same time. However, we can get the same effect in two different ways, and I’m going to show you both here.
                
                Section {
                    Circle()
                        .strokeBorder(.red, lineWidth: 20)
                        .background(Circle().fill(.orange))
                        .frame(width: 150, height: 150)
                }
                
//                Using background() ensures the blue circle always matches the size of the red circle.
                
                Section {
                    ZStack {
                        Circle()
                            .fill(.orange)

                        Circle()
                            .strokeBorder(.red, lineWidth: 20)
                    }
                    .frame(width: 150, height: 150)
                }
                
                Section {
                    Circle()
                        .fill(Color.red, strokeBorder: Color.black, lineWidth: 4)
                        .frame(width: 100, height: 100)
                }
            }
        }
    }
}

#Preview {
    FillAndStrokeShapes()
}
