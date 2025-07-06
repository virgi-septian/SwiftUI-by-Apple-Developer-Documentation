//
//  ReadTheColorValuesFromaColor.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 06/07/25.
//

import SwiftUI

struct ReadTheColorValuesFromaColor: View {
    @Environment(\.self) var environment
    @State private var color = Color.red
    @State private var resolvedColor: Color.Resolved?
    @State private var colorJSON = ""
    let resolvedColor2 = Color.Resolved(red: 0, green: 0.6, blue: 0.9, opacity: 1)
    var body: some View {
        VStack {
            Text("How to read the red, green, and blue values from a Color")
            
            List {
                Section {
                    VStack {
                        ColorPicker("Select your favorite color", selection: $color)

                        if let resolvedColor {
                            Text("Red: \(resolvedColor.red)")
                            Text("Green: \(resolvedColor.green)")
                            Text("Blue: \(resolvedColor.blue)")
                            Text("Opacity: \(resolvedColor.opacity)")
                        }
                    }
                    .padding()
                    .onChange(of: color, initial: true, getColor)
                }
                
                Section {
                    VStack {
                        ColorPicker("Select your favorite color", selection: $color)

                        if let resolvedColor {
                            Text("Red: \(resolvedColor.red)")
                            Text("Green: \(resolvedColor.green)")
                            Text("Blue: \(resolvedColor.blue)")
                            Text("Opacity: \(resolvedColor.opacity)")
                        }

                        Text("Color JSON: \(colorJSON)")
                    }
                    .padding()
                    .onChange(of: color, initial: true, getColor)
                }
                
                Section {
                    Rectangle()
                        .fill(Color(resolvedColor2).gradient)
                        .ignoresSafeArea()
                }
            }
        }
    }
    
    func getColor() {
        resolvedColor = color.resolve(in: environment)
    }
}

#Preview {
    ReadTheColorValuesFromaColor()
}
