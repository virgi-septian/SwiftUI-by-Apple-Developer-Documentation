//
//  MakeTwoGesturesRecognizeAtTheSameTime.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct MakeTwoGesturesRecognizeAtTheSameTime: View {
    var body: some View {
        /// For example, in this code we have two tap gestures, but SwiftUI will execute only the one attached to the circle because it’s the child of the VStack:
//        VStack {
//            Circle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//                .onTapGesture {
//                    print("Circle tapped")
//                }
//        }
//        .onTapGesture {
//            print("VStack tapped")
//        }
        /// If you want both gestures to trigger – i.e., if you want both “Circle tapped” and “VStack tapped” to be printed – you should use simultaneousGesture() on the VStack like this:
        VStack {
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .onTapGesture {
                    print("circle tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}

#Preview {
    MakeTwoGesturesRecognizeAtTheSameTime()
}


///
