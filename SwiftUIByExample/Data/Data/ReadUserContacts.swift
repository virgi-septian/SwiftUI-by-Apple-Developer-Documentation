//
//  ReadUserContacts.swift
//  Data
//
//  Created by Virgi Septian on 25/08/25.
//

import SwiftUI
import ContactsUI

struct ReadUserContacts: View {
    @State private var allContacts = [CNContact]()
    @State private var showingContactsPicker = false
    
    
    // We hold all our loaded contacts here
    // @State private var allContacts = [CNContact]()

    // Whatever the user is currently looking for
    @State private var searchText = ""

    // Results from our existing contacts list
    var filteredContacts: [CNContact] {
        if searchText.isEmpty {
            allContacts
        } else {
            allContacts.filter {
                $0.givenName.localizedStandardContains(searchText)
                || $0.familyName.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
//        NavigationStack {
//            VStack {
//                List(filteredContacts) { contact in
//                    Text("Say hello to \(contact.givenName)")
//                }
//                .searchable(text: $searchText)
//
//                // This will automatically show a contact if one is matched, or a Search button otherwise
////                ContactAccessButton(queryString: searchText) { results in
////                    // Run fetchContacts(with:) when a contact is selected
////                    fetchContacts(with: results)
////                }
////                .padding()
//                
//                
//                /// this displays a contact's email address below their name, and also uses indigo to tint user images when they don't have a photo attached:
//                ContactAccessButton(queryString: searchText) { results in
//                    fetchContacts(with: results)
//                }
//                .contactAccessButtonStyle(.init(imageColor: .indigo))
//                .contactAccessButtonCaption(.email)
//            }
//        }
        
        
        NavigationStack {
            List(allContacts) { contact in
                Text("Say hello to \(contact.givenName)")
            }
            .toolbar {
                Button("Select Contacts", systemImage: "person.crop.circle.badge.plus") {
                    showingContactsPicker.toggle()
                }
            }
            .contactAccessPicker(isPresented: $showingContactsPicker) { results in
                fetchContacts2(with: results)
            }
        }
    }
    
    func fetchContacts2(with newIdentifiers: [String]) {
            Task {
                // Create an array of all identifiers, old and new
                let existingIdentifiers = allContacts.map(\.identifier)
                let allIdentifiers = existingIdentifiers + newIdentifiers

                let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
                let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
                fetchRequest.predicate = CNContact.predicateForContacts(withIdentifiers: allIdentifiers)
                var newContacts = [CNContact]()

                try CNContactStore().enumerateContacts(with: fetchRequest) { contact, _ in
                    newContacts.append(contact)
                }

                allContacts = newContacts
            }
        }
    
    // Converts an array of contact identifiers into actual contacts
    func fetchContacts(with identifiers: [String]) {
        Task {
            // Prepare the Contacts system to return the names of matching people
            let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
            let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
            fetchRequest.predicate = CNContact.predicateForContacts(withIdentifiers: identifiers)

            // Store new contacts in this array
            var newContacts = [CNContact]()

            try CNContactStore().enumerateContacts(with: fetchRequest) { contact, _ in
                newContacts.append(contact)
            }

            // Load is completed, so add the new contacts to our existing array
            allContacts += newContacts
        }
    }
}

#Preview {
    ReadUserContacts()
}
