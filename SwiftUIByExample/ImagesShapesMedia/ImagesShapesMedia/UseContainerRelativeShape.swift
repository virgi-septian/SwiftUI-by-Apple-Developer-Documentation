//
//  ContainerRelativeShape.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 13/06/25.
//

import SwiftUI

struct UseContainerRelativeShape: View {
    var body: some View {
//        For example, we could write code that draws a blue shape in our widget, and use ContainerRelativeShape to make sure it’s the same shape as the widget itself
        VStack {
            Text("When should you use ContainerRelativeShape?")
            
            List {
                Section() {
                    ZStack {
                        ContainerRelativeShape()
                            .inset(by: 4)
                            .fill(.blue)
                        
                        Text("Hello, World!")
                            .font(.title)
                    }
                    .frame(width: 300, height: 200)
                    .background(.red)
                    .clipShape(Capsule())
                }
            }
        }
    }
}

#Preview {
    UseContainerRelativeShape()
}
