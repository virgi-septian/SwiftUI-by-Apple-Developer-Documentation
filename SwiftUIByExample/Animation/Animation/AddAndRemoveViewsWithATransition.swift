//
//  addAndRemoveViewsWithATransition.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct AddAndRemoveViewsWithATransition: View {
    @State private var showDetails = false
    var body: some View {
        /// By default, SwiftUI uses a fade animation to insert or remove views, but you can change that if you want by attaching a transition() modifier to a view.
        Button("Show") {
            withAnimation {
                showDetails.toggle()
            }
        }
        
        if showDetails {
            Text("Detail go here")
                .transition(.move(edge: .bottom))
            Text("Detail go here")
                .transition(.slide)
            Text("Detail go here")
                .transition(.scale)
        }
    }
}

#Preview {
    AddAndRemoveViewsWithATransition()
}
