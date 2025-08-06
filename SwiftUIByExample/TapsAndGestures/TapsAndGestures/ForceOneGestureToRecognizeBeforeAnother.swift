//
//  ForceOneGestureToRecognizeBeforeAnother.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct ForceOneGestureToRecognizeBeforeAnother: View {
    var body: some View {
        /// For example, we could write some code to place a circle inside a VStack, giving both a simple tap gesture action. In this situation the circle’s gesture action will always be triggered:
        VStack {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")
        }
        
        /// If you want the VStack gesture to be triggered in place of the circle’s, you need to replace the onTapGesture() modifier with highPriorityGesture() like this:
        VStack {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("Circle tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}

#Preview {
    ForceOneGestureToRecognizeBeforeAnother()
}
