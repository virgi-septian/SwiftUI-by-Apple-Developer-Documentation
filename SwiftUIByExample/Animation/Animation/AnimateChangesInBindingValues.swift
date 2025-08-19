//
//  animateChangesInBindingValues.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct AnimateChangesInBindingValues: View {
    @State private var showingWelcome = false
    
    var body: some View {
        VStack {
            Toggle("Toggle label", isOn: $showingWelcome.animation(.spring()))

            if showingWelcome {
                
                Text("Hello World")
            }
        }
    }
}

#Preview {
    AnimateChangesInBindingValues()
}
