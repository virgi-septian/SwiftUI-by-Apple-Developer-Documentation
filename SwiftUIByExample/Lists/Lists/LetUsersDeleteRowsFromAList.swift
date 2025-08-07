//
//  LetUsersDeleteRowsFromAList.swift
//  Lists
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

struct LetUsersDeleteRowsFromAList: View {
    @State private var users = ["Glenn", "Malcolm", "Nicola", "Terri"]
    var body: some View {
        /// The simple approach to deletion works great if you just want users to swipe to delete items from an array, without adding any additional logic. To use it, use a data binding with your list and pass in the editActions parameter, like this:
        NavigationStack {
//            List($users, id: \.self, editActions: .delete) { $user in
//                Text(user)
//            }
            
            // That immediately lets users swipe to delete rows, and the users array will be updated as they do so. If you want to let them move the items as well, use .all rather than just .delete.
//            List($users, id: \.self, editActions: .all) { $user in
//                Text(user)
//            }
            
            /// If you want to disable deletion for one row, use deleteDisabled() with whatever criteria you have. For example, we could say that the user can delete freely from the list as long as there’s always at least 1 row remaining:
//            List($users, id: \.self, editActions: .delete) { $user in
//                Text(user)
//                    .deleteDisabled(users.count < 2)
//            }
            
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Users")
        }
    }
    
    /// For the more complex approach to deletion, we can attach an onDelete(perform:) modifier to a ForEach inside a list, and have it call a method of our choosing when a delete operation happens. This handler needs to have a specific signature that accepts multiples indexes to delete, like this:
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

#Preview {
    LetUsersDeleteRowsFromAList()
}

/// Tip: In case you were wondering, onDelete() exists as a modifier for ForEach but not for List directly. This is because lists can include static rows, which of course cannot be deleted.
