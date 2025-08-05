//
//  LetUsersFindAndReplaceText.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct LetUsersFindAndReplaceText: View {
    @State private var bio = "Describe yourself."
    @State private var isShowingFindNavigator = false
    var body: some View {
//       NavigationStack {
//           TextEditor(text: $bio)
//               .navigationTitle("Edit Bio")
//       }
       
        /// For users without a hardware keyboard, you can programmatically show the find interface using the findNavigator() modifier. For example, this toggles search using a toolbar button:
        NavigationStack {
           TextEditor(text: $bio)
               .findNavigator(isPresented: $isShowingFindNavigator)
               .toolbar {
                   Button("Toggle Search") {
                       isShowingFindNavigator.toggle()
                   }
               }
               .navigationTitle("Edit Bio")
        }
        
        /// Tip: Passing true to findNavigator() when no TextEditor is currently accepting input will make the system attempt to find and activate one automatically. If there is more than one to choose from the system will pick one for you.

        /// If you explicitly want a view to opt out of search and/or replace, use one or both of findDisabled() and replaceDisabled(), like this:
        NavigationStack {
                    TextEditor(text: $bio)
                        .replaceDisabled()
                        .navigationTitle("Edit Bio")
                }
   }
}

#Preview {
    LetUsersFindAndReplaceText()
}
