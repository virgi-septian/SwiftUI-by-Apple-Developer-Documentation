//
//  LetUsersEditYourNavigationTitle.swift
//  Navigation
//
//  Created by Virgi Septian on 12/08/25.
//

import SwiftUI
/// Important: Navigation title editing only works when your navigation bar is operating in inline mode. As far as I know, it works only on iOS and iPadOS.

struct LetUsersEditYourNavigationTitle: View {
    @State private var title = "Welcome"
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
        
        /// If your title is there because it represents the name of some content your user is editing, I would recommend adding .toolbarRole(.editor) so that your title is aligned to the leading edge like other document titles:
        NavigationStack {
           Text("Hello, world!")
               .navigationTitle($title)
               .navigationBarTitleDisplayMode(.inline)
               .toolbarRole(.editor)
        }
    }
}

#Preview {
    LetUsersEditYourNavigationTitle()
}
