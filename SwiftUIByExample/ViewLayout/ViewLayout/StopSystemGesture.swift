//
//  StopSystemGesture.swift
//  ViewLayout
//
//  Created by Virgi Septian on 15/07/25.
//

import SwiftUI

struct StopSystemGesture: View {
    @State private var input = 0.0
    var body: some View {
        VStack {
            Text("stop system gestures from interfering with your own")
                .padding(.bottom, 30)
            
            Text("Current value: \(input)")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture().onChanged { value in
                        input = value.location.y - value.startLocation.y
                    }
                )
                .defersSystemGestures(on: .vertical)
        }
    }
}

#Preview {
    StopSystemGesture()
}
