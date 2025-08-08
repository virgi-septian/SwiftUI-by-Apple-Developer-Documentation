//
//  AddASearchBar.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct AddASearchBar: View {
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    
    
    @State private var messages = [Message]()

    @State private var searchScope = SearchScope.inbox

    var body: some View {
//        NavigationStack {
//            Text("Searching for \(searchText)")
//                .navigationTitle("Search")
//        }
//        .searchable(text: $searchText)
        
        /// If you want to track when searching is currently active, in iOS 17 you can bind an isPresented Boolean to searchable() like this:
//        NavigationStack {
//            Text("Searching for \(searchText)")
//                .navigationTitle("Searching \(searchIsActive ? "(active)" : "(inactive)")")
//        }
//        .searchable(text: $searchText, isPresented: $searchIsActive)
        
        
        /// For further customization, you can provide a string to display as a prompt for the search box like this:
//        NavigationStack {
//            Text("Searching for \(searchText)")
//                .navigationTitle("Searchi")
//        }
//        .searchable(text: $searchText, prompt: "Look for something")
        
        /// For more advanced uses, searchable() allows us to show a list of suggestions to our users, even adding extra completion information to save them typing so much. This is done by passing a function to searchable() that returns a view containing your suggestions, and if you want users to be able to tap to complete their search use the searchCompletion() modifier for each suggestion.
//        NavigationStack {
//            List {
//                ForEach(searchResults, id: \.self) { name in
//                    NavigationLink {
//                        Text(name)
//                    } label: {
//                        Text(name)
//                    }
//                }
//            }
//            .navigationTitle("Contacts")
//        }
//        .searchable(text: $searchText) {
//            ForEach(searchResults, id: \.self) { result in
//                Text("Are you looking for \(result)?").searchCompletion(result)
//            }
//        }
        /// That uses “Are you looking for Holly?” and similar for each suggestion, so you can see how it looks on screen. It also uses each person’s name as the completion, meaning that if you type “Ho” and tap “Holly” the search bar will autocomplete with the full name.
        
        
        
        
        /// For more advanced searches, you can add scopes to your search box to let the user select what kind of search they want by adding the searchScopes() modifier. This needs to be bound to some state that tracks the currently active search scope, and you can then provide scopes using a trailing closure.
        
        /// As an example, we could write some code to let the user choose between searching all their inbox or just their favorite messages, like this:
        NavigationStack {
            List {
                ForEach(filteredMessages) { message in
                    VStack(alignment: .leading) {
                        Text(message.user)
                            .font(.headline)

                        Text(message.text)
                    }
                }
            }
            .navigationTitle("Messages")
        }
        .searchable(text: $searchText)
        .searchScopes($searchScope) {
            ForEach(SearchScope.allCases, id: \.self) { scope in
                Text(scope.rawValue.capitalized)
            }
        }
        .onAppear(perform: runSearch)
        .onSubmit(of: .search, runSearch)
        .onChange(of: searchScope) { _ in runSearch() }
        
    }
    
    var filteredMessages: [Message] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }

            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        }
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    AddASearchBar()
}

/// Tip: If you add more scopes than there is space for, your scope titles will be truncated.
