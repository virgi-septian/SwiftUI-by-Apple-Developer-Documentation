//
//  detectDeviceRotation.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI

// Our custom view modifier to track rotation and
// call our action
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

struct DetectDeviceRotation: View {
    @State private var orientation = UIDeviceOrientation.unknown

    var body: some View {
        Group {
            if orientation.isPortrait {
                Text("Portrait")
            } else if orientation.isLandscape {
                Text("Landscape")
            } else if orientation.isFlat {
                Text("Flat")
            } else {
                Text("Unknown")
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

#Preview {
    DetectDeviceRotation()
}


/// Tip: This may not work while your app is connected to Xcode’s debugger – try pushing your app to a real device, then running it manually rather than via Xcode.

//MARK: - Please remember that device orientation isn’t quite as useful as you might expect. Yes, on iPhone a landscape orientation means you have more horizontal space than vertical, but on iPad it’s possible for your app to be running in landscape while in split-screen mode – technically the whole screen still has a larger width than height, but the actual space allocated to our app is only a small slice of that width.
