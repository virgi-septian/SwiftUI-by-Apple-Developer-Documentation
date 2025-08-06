//
//  ContentView.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct AddAGestureRecognizerToAView: View {
    @State private var scale = 1.0
    @State private var dragCompleted: Bool = false
    @State private var dragOffset = CGSize.zero
    var body: some View {
        /// TapGesture. When you create this you can specify how many taps it takes to trigger the gesture, then attach an onEnded closure that will be run when the gesture happens. For example, this creates an image that gets smaller every time it’s tapped:
//        Image("pic 2")
//            .scaleEffect(scale)
//            .gesture(
//                TapGesture()
//                    .onEnded { _ in
//                        scale -= 0.1
//                    }
//            )

        
        /// LongPressGesture recognizes when the user presses and holds on a view for at least a period of time you specify. So, this creates an image view that halves in size when pressed for at least one second:
//        Image("pic 2")
//            .scaleEffect(scale)
//            .gesture(
//                LongPressGesture(minimumDuration: 1)
//                    .onEnded { _ in
//                        scale /= 2
//                    }
//            )
        
        /// DragGesture triggers when the user presses down on a view and moves at least a certain distance away. So, this creates an image with a drag gesture that triggers when the user moves it at least 50 points:
//        VStack {
//            Image("pic 2")
//                .resizable()
//                .frame(width: 300, height: 500)
//                .gesture(
//                    DragGesture(minimumDistance: 50)
//                        .onEnded { _ in
//                            dragCompleted = true
//                        }
//                )
//
//            if dragCompleted {
//                Text("Drag completed!")
//            }
//        }
        
        /// Drag gestures are particularly good when combined with the offset() modifier, which lets us adjust the natural position of a view. For example, this offsets an image using a dragOffset size, which itself is attached to a drag gesture:
        Image(.pic2)
            .resizable()
            .frame(width: 300, height: 500)
            .offset(dragOffset)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        dragOffset = gesture.translation
                    })
                    .onEnded({ gesture in
                        dragOffset = dragOffset
                    })
            )
    }
}

#Preview {
    AddAGestureRecognizerToAView()
}
