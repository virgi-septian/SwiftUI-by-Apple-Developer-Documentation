//
//  HandlePinchToZoomForViews.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct HandlePinchToZoomForViews: View {
    @State private var currentZoom = 0.0
    @State private var totalZoom = 1.0
    @GestureState private var zoom = 1.0

    var body: some View {
        ScrollView {
            Image("pic 2")
                .scaleEffect(currentZoom + totalZoom)
                .gesture(
                    MagnifyGesture()
                        .onChanged { value in
                            currentZoom = value.magnification - 1
                        }
                        .onEnded { value in
                            totalZoom += currentZoom
                            currentZoom = 0
                        }
                )
                .accessibilityZoomAction { action in
                    if action.direction == .zoomIn {
                        totalZoom += 1
                    } else {
                        totalZoom -= 1
                    }
                }
            
            Divider()
            
            /// Tip: Subtract 1 from value.magnification is important, because 1 is its default value for a new gesture. Using the accessibilityZoomAction() modifier allows assistive technologies to control the zoom level.
            
            /// On the other hand, if you want to track their gesture but reset back to 0 each time, use @GestureState like this:
            
            Image("pic 2")
                .scaleEffect(zoom)
                .gesture(
                    MagnifyGesture()
                        .updating($zoom) { value, gestureState, transaction in
                            gestureState = value.magnification
                        }
                )
        }
    }
}

#Preview {
    HandlePinchToZoomForViews()
}
