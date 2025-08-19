//
//  ContentView.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct CreateBasicAnimations: View {
    @State private var scaleEffect = 0.0
    @State private var angel = 0.0
    @State private var borderThickness = 1.0
    var body: some View {
        VStack {
            Text("Hello, world!")
                .scaleEffect(scaleEffect)
                .animation(.bouncy(duration: 1), value: scaleEffect)
            
            Button("Gedein") {
                scaleEffect += 1
            }
            
            Button("Kecilin") {
                scaleEffect -= 1
            }
        }
        .padding()
        
        
        /// You can animate many other modifiers, such as 2D and 3D rotation, opacity, border, and more. For example, this makes a button that spins around and increases its border every time it’s tapped:
        Button("Click") {
            angel += 45
            borderThickness += 1
        }
        .padding()
        .border(.red, width: borderThickness)
        .rotationEffect(Angle(degrees: angel))
        .animation(.easeInOut, value: angel)
    }
}

#Preview {
    CreateBasicAnimations()
}
