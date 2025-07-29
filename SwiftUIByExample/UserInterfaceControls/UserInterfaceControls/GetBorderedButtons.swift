//
//  GetBorderedButtons.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 29/07/25.
//

import SwiftUI

struct GetBorderedButtons: View {
    var body: some View {
        Button("Buy: $0.99") {
            print("Buying…")
        }
        .buttonStyle(.bordered)
        
        Divider()
        
        Button("Tap here"){
            
        }
        .buttonStyle(.borderedProminent)
        
        Divider()
        /// You can customize the color of these buttons either by using tint():
        Button("Submit") {
            print("Submitting…")
        }
        .tint(.indigo)
        .buttonStyle(.borderedProminent)
        
        Divider()
        /// Or by attaching a role to the button:
        Button("Delete", role: .destructive) {
            print("Deleting…")
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    GetBorderedButtons()
}
