//
//  CombineShapes.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 07/07/25.
//

import SwiftUI

struct CombineShapes: View {
    var body: some View {
        
        VStack {
            Text("Combine shapes to create new shapes")
            
            List {
                Section {
                    Circle()
                        .union(.capsule.inset(by: 100))
                        .fill(.blue)
                }
                
                Section {
                    Circle()
                        .lineSubtraction(.rect.inset(by: 30))
                        .stroke(style: .init(lineWidth: 20, lineCap: .round))
                        .padding()
                }
                
                Section {
                    Circle()
                        .offset(x: -100)
                        .symmetricDifference(.circle.offset(x: 100))
                        .fill(.red)
                        .frame(width: 500, height: 400)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    CombineShapes()
}
