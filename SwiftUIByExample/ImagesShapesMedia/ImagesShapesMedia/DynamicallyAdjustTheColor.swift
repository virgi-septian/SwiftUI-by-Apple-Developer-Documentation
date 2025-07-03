//
//  DynamicallyAdjustTheColor.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 01/07/25.
//

import SwiftUI

struct DynamicallyAdjustTheColor: View {
    @State private var value = 0.0
    var body: some View {
        VStack {
            Text("How to dynamically adjust the color of an SF Symbol")
            
            List {
                Section {
                    Image(systemName: "wifi", variableValue: 0.5)
                }
                
                Section {
                    VStack {
                        VStack {
                            Image(systemName: "aqi.low", variableValue: value)
                            Image(systemName: "wifi", variableValue: value)
                            Image(systemName: "chart.bar.fill", variableValue: value)
                            Image(systemName: "waveform", variableValue: value)
                        }

                        Slider(value: $value)
                    }
                    .font(.system(size: 72))
                    .foregroundStyle(.blue)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    DynamicallyAdjustTheColor()
}
