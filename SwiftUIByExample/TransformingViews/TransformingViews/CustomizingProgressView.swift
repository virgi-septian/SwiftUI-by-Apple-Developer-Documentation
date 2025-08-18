//
//  CustomizingProgressView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 18/08/25.
//

import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeColor = Color.blue
    var strokeWidth = 25.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0

        return ZStack {
            Circle()
                .trim(from: 0, to: fractionCompleted)
                .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

struct CustomizingProgressView: View {
    @State private var progress: Double = 0.0
    var body: some View {
        /// SwiftUI gives us the ProgressViewStyle protocol to create custom designs for ProgressView, allowing us to read how complete the progress view and take that into account in our design.
        
        /// To make a custom ProgressView style, you need to create a struct that has a makeBody() method accepting the current configuration of the view. You can then go ahead and render the progress however you want – perhaps a text percentage, perhaps a growing circle, and so on – then return your finished layout to be rendered.

        /// To demonstrate this, here’s a custom style that creates a gauge, showing progress as a stroked circle that completes as progress ramps up:
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(GaugeProgressStyle())
            .frame(width: 200, height: 200)
            .contentShape(Rectangle())
            .onTapGesture {
                if progress < 1.0 {
                    withAnimation {
                        progress += 0.2
                    }
                }
            }
    }
}

#Preview {
    CustomizingProgressView()
}
