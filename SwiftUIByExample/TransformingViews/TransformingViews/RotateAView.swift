//
//  RotateAView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct RotateAView: View {
    @State private var rotation = 0.0
    var body: some View {
        Text("Up we go")
            .rotationEffect(.degrees(-90))
        
        /// If you prefer using radians, just pass in .radians() as your parameter
        Divider()
        
        Text("Up we go")
            .rotationEffect(.radians(.pi))
        
        Divider()
        
        VStack {
           Slider(value: $rotation, in: 0...360)

           Text("Up we go")
               .rotationEffect(.degrees(rotation))
        }
    }
}

#Preview {
    RotateAView()
}
