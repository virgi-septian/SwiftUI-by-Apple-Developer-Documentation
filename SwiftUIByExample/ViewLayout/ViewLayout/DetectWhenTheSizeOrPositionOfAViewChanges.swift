//
//  DetectWhenTheSizeOrPositionOfAViewChanges.swift
//  ViewLayout
//
//  Created by Virgi Septian on 22/07/25.
//

import SwiftUI

struct DetectWhenTheSizeOrPositionOfAViewChanges: View {
//    var body: some View {
//        Text("Hello, world")
//            .onGeometryChange(for: CGRect.self) { proxy in
//                proxy.frame(in: .global)
//            } action: { newValue in
//                print("Frame is now \(newValue)")
//            }
//    }
    
    
    /// Important: Although you can use the action closure to set view state, make sure you don't accidentally get stuck in a layout loop. For example, the code below gets into a loop because it tries to display the view's size in the view itself:
//    @State private var textFrame = CGRect.zero
//
//    var body: some View {
//        Text("Size is: \(textFrame)")
//            .onGeometryChange(for: CGRect.self) { proxy in
//                proxy.frame(in: .global)
//            } action: { newValue in
//                textFrame = newValue
//            }
//    }
    
    /// Being able to track a view's size and position unlocks a variety of abilities, such as being able to create views elsewhere with a matched size. For example, in the code below the rectangle always has the same frame as the text view:
    @State private var textFrame = CGRect.zero
    @State private var textSize = 17.0

    var body: some View {
        VStack {
            Text("Hello, world")
                .font(.system(size: textSize))
                .onGeometryChange(for: CGRect.self) { proxy in
                    proxy.frame(in: .global)
                } action: { newValue in
                    textFrame = newValue
                }

            Rectangle()
                .frame(width: textFrame.width, height: textFrame.height)

            Slider(value: $textSize, in: 10...30)
                .padding()
        }
    }
}

#Preview {
    DetectWhenTheSizeOrPositionOfAViewChanges()
}
