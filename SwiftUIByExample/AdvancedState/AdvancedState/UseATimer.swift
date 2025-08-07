//
//  UseATimerWithSwiftUI.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

struct UseATimer: View {
    @State private var currentDate = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var timeRemaining = 10
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        /// If you want to run some code regularly, perhaps to make a countdown timer or similar, you should use Timer and the onReceive() modifier.
        Text("\(currentDate)")
            .onReceive(timer) { input in
                currentDate = input
            }
        /// As you can see, the onReceive() closure gets passed in some input containing the current date. In the code above we assign that straight to currentDate, but you could use it to calculate how much time has passed since a previous date.

        
        /// If you specifically wanted to create a countdown timer or stopwatch, you should create some state to track how much time remains, then subtract from that when the timer fires.
        Text("\(timeRemaining)")
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}

#Preview {
    UseATimer()
}
