//
//  MarkContentUsingPrivacySensitive.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 15/05/25.
//

import SwiftUI

struct MarkContentUsingPrivacySensitive: View {
    @Environment(\.redactionReasons) var redactionReasons
    var body: some View {
        List {
            Section {
                VStack {
                    Text("Card number")
                        .font(.headline)

                    Text("1234 5678 9012 3456")
                        .privacySensitive()
                }
            }
            
            Section {
                if redactionReasons.contains(.privacy) {
                    Text("[HIDDEN]")
                } else {
                    Text("1234 5678 9012 3456")
                }
            }
        }
    }
}

#Preview {
    MarkContentUsingPrivacySensitive()
        .redacted(reason: .privacy)
}
