//
//  MarkContentUsingRedacted .swift
//  Working With Static Text
//
//  Created by Virgi Septian on 15/05/25.
//

import SwiftUI

struct MarkContentUsingRedacted: View {
    @Environment(\.redactionReasons) var redactionReasons
    let bio = "The rain in Spain falls mainly on the Spaniards"
    var body: some View {
        List {
            Section {
                Text("Hello, World!")
                    .redacted(reason: .placeholder)
            }
            
            Section {
                VStack(alignment: .leading) {
                    Text("This is placeholder text")
                    Text("And so is this")
                }
                .font(.title)
                .redacted(reason: .placeholder)
            }
            
            Section {
                if redactionReasons == .placeholder {
                   Text("Loading…")
               } else {
                   Text(bio)
                       .redacted(reason: redactionReasons)
               }
            }
        }
        
    }
}

#Preview {
    MarkContentUsingRedacted()
}
