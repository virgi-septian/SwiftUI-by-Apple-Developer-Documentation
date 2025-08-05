//
//  LetUsersShareContent.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct LetUsersShareContent: View {
    let link3 = URL(string: "https://www.admin.ch")!
    let link2 = URL(string: "https://www.hackingwithswift.com")!
    let link = URL(string: "https://www.hackingwithswift.com")!
    var body: some View {
        VStack(spacing: 20) {
            ShareLink(item: link)
            ShareLink("Learn Swift here", item: link)
            ShareLink(item: link) {
                Label("Learn Swift here", systemImage: "swift")
            }
        }
        
        Divider()
        /// If you want to attach some extra text to the content you’re sharing, there’s a message parameter to do just that:
        ShareLink(item: link2, message: Text("Learn Swift here!"))
        
        Divider()
        /// For simple URLs the system is able to generate a preview on our behalf, but you can also provide a custom preview with some text and an image of your choosing, like this:
        ShareLink(
           item: link3,
           preview: SharePreview(
               "Switzerland's flag: it's a big plus.",
               image: Image(systemName: "plus")
           )
       )
    }
}

#Preview {
    LetUsersShareContent()
}
