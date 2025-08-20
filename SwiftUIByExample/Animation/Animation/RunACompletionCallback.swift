//
//  RunACompletionCallback.swift
//  Animation
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct RunACompletionCallback: View {
    @State private var scaleUp = false
    @State private var fadeOut = false
    var body: some View {
        
        Button("Tap me !") {
            withAnimation {
                scaleUp = true
            } completion: {
                withAnimation {
                    fadeOut = true
                }
            }
        }
        
        Text("Test")
            .scaleEffect(scaleUp ? 3 : 1)
            .opacity(fadeOut ? 0 : 1)
    }
}

#Preview {
    RunACompletionCallback()
}
