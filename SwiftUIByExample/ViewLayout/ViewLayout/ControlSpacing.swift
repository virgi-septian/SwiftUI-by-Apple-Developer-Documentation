//
//  ControlSpacing.swift
//  ViewLayout
//
//  Created by Virgi Septian on 11/07/25.
//

import SwiftUI

struct ControlSpacing: View {
    var body: some View {
        VStack {
            Text("Using")
            Text("SwiftUI")
                .padding()
            Text("rocks")
        }
    }
}

#Preview {
    ControlSpacing()
}
