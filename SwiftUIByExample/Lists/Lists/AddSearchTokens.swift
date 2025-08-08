//
//  AddSearchTokens.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

// Holds one uniquely identifiable movie.
struct Movie: Identifiable {
    var id = UUID()
    var name: String
    var genre: String
}

// Holds one token that we want the user to filter by. This *must* conform to Identifiable.
struct Token: Identifiable {
    var id: String { name }
    var name: String
}

struct AddSearchTokens: View {
  
    /// it does require several steps. You need:
    
    /// - A regular searchable() implementation that filters your results by the user’s search text.
    /// - A custom data type to represent one search token. You can’t just use strings or similar, because SwiftUI requires tokens to conform to Identifiable.
    /// - An array of all the tokens the user can select from. This might be a constant array, or it might be a published array of values that changes our time.
    /// - An array of all the tokens the user has entered. This is a subset of all the tokens, and should be factored into your filtering code.
    /// - Some code to decide how to render a single token in the list. This might be just a Text view, but it doesn’t need to be.
        
    
    // Whatever text the user has typed so far.
    @State private var searchText = ""

    // All possible tokens we want to show to the user.
    let allTokens = [Token(name: "Action"), Token(name: "Comedy"), Token(name: "Drama"), Token(name: "Family"), Token(name: "Sci-Fi")]

    // The list of tokens the user currently has selected.
    @State private var currentTokens = [Token]()

    // The list of tokens we want to show to the user right now. Activates token selection only when searchText starts with #.
    var suggestedTokens: [Token] {
        if searchText.starts(with: "#") {
            return allTokens
        } else {
            return []
        }
    }

    // Some data to show and filter by.
    let movies = [
        Movie(name: "Avatar", genre: "Sci-Fi"),
        Movie(name: "Inception", genre: "Sci-Fi"),
        Movie(name: "Love Actually", genre: "Comedy"),
        Movie(name: "Paddington", genre: "Family")
    ]

    // The real work: filter all the movies based on search text or tokens.
    var searchResults: [Movie] {
        // trim whitespace
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespaces)

        return movies.filter { movie in
            if searchText.isEmpty == false {
                // If we have search text, make sure this item matches.
                if movie.name.localizedCaseInsensitiveContains(trimmedSearchText) == false {
                    return false
                }
            }

            if currentTokens.isEmpty == false {
                // If we have search tokens, loop through them all to make sure one of them matches our movie.
                for token in currentTokens {
                    if token.name.localizedCaseInsensitiveContains(movie.genre) {
                        return true
                    }
                }

                // This movie does *not* match any of our tokens, so it shouldn't be sent back.
                return false
            }

            // If we're still here then the movie should be included.
            return true
        }
    }

    var body: some View {
        NavigationStack {
            List(searchResults) { movie in
                Text(movie.name)
            }
            .navigationTitle("Movies+")
            .searchable(text: $searchText, tokens: $currentTokens, suggestedTokens: .constant(suggestedTokens), prompt: Text("Type to filter, or use # for tags")) { token in
                Text(token.name)
            }
        }
        
        /// There are a few things that are worth pointing out in that code:
        
        /// - We figure out which tokens to suggest to the user inside a computed property, so we’re able to enable or disable token selection dynamically. SwiftUI expects a binding for the resulting array, so I’ve used .constant(suggestedTokens).
        /// - We don’t need to filter out the tokens the user has currently selected, because SwiftUI takes care of that automatically.
        /// - The searchable() prompt explicitly tells the user to type a “#” for tags.
        /// - The trailing closure for searchable() lets us tell SwiftUI to render each tag as some text showing its name.

    }
}

#Preview {
    AddSearchTokens()
}
