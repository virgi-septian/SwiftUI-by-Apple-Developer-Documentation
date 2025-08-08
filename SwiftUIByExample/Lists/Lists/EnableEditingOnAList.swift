//
//  EnableEditingOnAList.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct EnableEditingOnAList: View {
    /// If you have configured a SwiftUI list view to support deletion or editing of its items, you can allow the user to toggle editing mode for your list view by adding an EditButton somewhere.
    
    /// For example, this ContentView struct defines an array of users, attaches an onDelete() method, then adds an edit button to the navigation bar:
    @State private var users: [String] = ["Alice", "Bob", "Charlie"]
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("Users")
            .navigationBarItems(trailing: EditButton())
            
        }
    }
    
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

#Preview {
    EnableEditingOnAList()
}
