//
//  CustoimizeTheWayLiknkAteOpenend.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 15/05/25.
//

import SwiftUI

struct CustomizeTheWayLinkAreOpenend: View {
    var body: some View {
        VStack {
            Link("Visit Apple", destination: URL(string: "https://apple.com")!)
            Text("[Visit Apple](https://apple.com)")
        }
        .environment(\.openURL, OpenURLAction(handler: handleURL))
    }

    func handleURL(_ url: URL) -> OpenURLAction.Result {
        print("Handle \(url) somehow")
        return .handled
    }
}

#Preview {
    CustomizeTheWayLinkAreOpenend()
}
