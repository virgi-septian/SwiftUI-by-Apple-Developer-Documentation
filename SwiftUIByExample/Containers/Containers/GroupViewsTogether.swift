//
//  GroupViewsTogether.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct GroupViewsTogether: View {
    var body: some View {
        /// If you need several views to act as one – for example, to transition together or to apply the same modifier in many places all at once – then you should use SwiftUI’s Group view.

        /// To demonstrate this, we could create a Group with several pieces of text, and apply a single font() modifier to them all at once:
        Group {
            Text("Line 1")
            Text("Line 2")
            Text("Line 3")
        }
        .font(.largeTitle)
    }
}

#Preview {
    GroupViewsTogether()
}
