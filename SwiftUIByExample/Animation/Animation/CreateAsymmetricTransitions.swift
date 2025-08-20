//
//  create AsymmetricTransitions.swift
//  Animation
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct CreateAsymmetricTransitions: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            
            if showDetails {
                Text("Details go here.")
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
            }
        }
    }
}

#Preview {
    CreateAsymmetricTransitions()
}
