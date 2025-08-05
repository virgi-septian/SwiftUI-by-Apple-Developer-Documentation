//
//  AddHapticEffects.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct AddHapticEffects: View {
    @State private var taskIsComplete = false
    @State private var randomNumber = 0.0

    var body: some View {
        Button("Mark Complete") {
            taskIsComplete = true
        }
        .sensoryFeedback(.success, trigger: taskIsComplete)
        
        /// For more fine-grained control, you can decide exactly which type of haptic effect to trigger based on comparing the old and new value of your trigger. For example, this uses the .impact haptic effect with varying intensities based on the difference between two random numbers:
        Button("Mark Complete") {
            randomNumber = Double.random(in: 0...1)
        }
        .sensoryFeedback(trigger: randomNumber) { oldValue, newValue in
            let amount = abs(oldValue - newValue)
            return .impact(flexibility: .solid, intensity: amount)
        }
        
        /// And finally, you can provide a fixed haptic effect and customize when it’s triggered by providing your own comparison function. As an example, this will trigger the .success haptic when the difference between two random numbers is more than 0.5:
        Button("Mark Complete") {
            randomNumber = Double.random(in: 0...1)
        }
        .sensoryFeedback(.success, trigger: randomNumber) { oldValue, newValue in
            abs(oldValue - newValue) > 0.5
        }
    }
}

#Preview {
    AddHapticEffects()
}
