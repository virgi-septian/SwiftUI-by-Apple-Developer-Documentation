//
//  HideTheSystemUI.swift
//  ViewLayout
//
//  Created by Virgi Septian on 15/07/25.
//

import SwiftUI

struct HideTheSystemUI: View {
    var body: some View {
        Text("This needs to take up lots of space")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow)
            .persistentSystemOverlays(.hidden)
    }
}

#Preview {
    HideTheSystemUI()
}
