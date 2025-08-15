//
//  TellTheUserThatNoContentIsAvailable.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct TellTheUserThatNoContentIsAvailable: View {
    var body: some View {
        ContentUnavailableView.search
        
        Divider()
        
        ContentUnavailableView.search(text: "Life, the Universe, and Everything")
        
        Divider()
        
        ContentUnavailableView("No favorites", systemImage: "star", description: Text("You don't have any favorites yet."))
            .symbolVariant(.slash)
    }
}

#Preview {
    TellTheUserThatNoContentIsAvailable()
}
