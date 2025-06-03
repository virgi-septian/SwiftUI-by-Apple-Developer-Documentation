//
//  RenderAGradient.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 03/06/25.
//

import SwiftUI

struct RenderAGradient: View {
    var body: some View {
        List {
            Section {
                Rectangle().fill(.blue.gradient)
            }
            
            Section {
                Text("Hello World")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                    )
            }
            
            Section {
                Text("Hello World")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)
                    )
            }
            
            Section {
                Text("Hello World")
                    .padding()
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .trailing, endPoint: .leading)
                    )
            }
            
            Section {
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 1, endRadius: 100)
                    )
                    .frame(width: 200, height: 200)
            }
            
            Section {
                Circle()
                    .fill(
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                    )
                    .frame(width: 200, height: 200)
            }
            
            Section {
                Circle()
                    .strokeBorder(
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: 50
                    )
                    .frame(width: 200, height: 200)
            }
        }
        
    }
}

#Preview {
    RenderAGradient()
}
