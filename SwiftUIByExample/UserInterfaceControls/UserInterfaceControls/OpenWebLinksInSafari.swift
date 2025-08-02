//
//  OpenWebLinksInSafari.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 02/08/25.
//

import SwiftUI

struct OpenWebLinksInSafari: View {
    @Environment(\.openURL) var openURL
    var body: some View {
        Link("Learn SwiftUI", destination: URL(string: "https://www.hackingwithswift.com/quick-start/swiftui")!)
        Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
            .font(.title)
            .foregroundStyle(.red)
        
        Link(destination: URL(string: "https://www.apple.com")!) {
            Image(systemName: "link.circle.fill")
                .font(.largeTitle)
        }
        
        /// Alternatively, you can open a URL from code by using the openURL environment key. In its simplest form this will open your link in Safari, like this:
        Button("Visit Apple") {
            openURL(URL(string: "https://www.apple.com")!)
        }
        
        /// you can also load URLs in an in-app browser
        /// iOS 26
//        Button("Visit Apple") {
//            openURL(URL(string: "https://www.apple.com")!, prefersInApp: true)
//        }
    }
}

#Preview {
    OpenWebLinksInSafari()
}
