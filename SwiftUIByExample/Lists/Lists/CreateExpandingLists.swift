//
//  CreateExpandingLists.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

/// SwiftUI’s List view has an enhanced initializer that lets us create expanding sections with child elements – they will be rendered with tappable arrows that open out to reveal children when tapped.

/// To use this form of List you need to have data in a precise form: your data model should have an optional array of children that are of the same type, so you can create a tree. Normally you’re likely to load this kind of stuff from JSON or similar, but to keep things simple here I’ll just paste in some hard-coded data so you can see what it ought to look like.

/// Once you have your data in place, you can load it into a list by passing in your array of data plus a keypath to where the children are, which in our case will be \.items. You’ll then get a regular closure where you can provide your row data, just like normal.

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var children: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", children: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", children: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", children: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}

struct CreateExpandingLists: View {
    @State private var items: [Bookmark] = [.example1, .example2, .example3]
    var body: some View {
        List(items, children: \.children) { item in
            HStack {
                Image(systemName: item.icon)
                Text(item.name)
            }
        }
    }
}

#Preview {
    CreateExpandingLists()
}
