//
//  HideAndRevealContent.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct HideAndRevealContent: View {
    @State private var revealDetails = true
    var body: some View {
        /// SwiftUI has a dedicated DisclosureGroup view that presents a disclosure indicator and contains content inside. In its simplest form it can be controlled entirely by the user, but you can also bind it to a Boolean property to determine programmatically whether its content is currently visible or not.
        
        /// For example, this creates a DisclosureGroup with lots of text inside:
        DisclosureGroup("Show Terms") {
            Text("Long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here.")
        }
        .frame(width: 300)
        
        /// If you wanted to track whether the disclosure group was opened or not, bind it to a Boolean like this:
        DisclosureGroup("Show Terms", isExpanded: $revealDetails) {
            Text("Long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here.")
        }
        .frame(width: 300)
    }
}

#Preview {
    HideAndRevealContent()
}
