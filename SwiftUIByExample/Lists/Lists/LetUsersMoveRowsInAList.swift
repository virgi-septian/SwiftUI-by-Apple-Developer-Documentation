//
//  LetUsersMoveRowsInAList.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct LetUsersMoveRowsInAList: View {
    @State private var users = ["Alice", "Bob", "Charlie"]
    var body: some View {
        /// The simple approach to moving works great if you’re just moving your item around in an array, without adding any additional logic. To use it, use a data binding with your list and pass in the editActions parameter, like this:
        NavigationStack {
            List($users, id: \.self, editActions: .move) { $user in
//                Text(user)
                /// If you want to disable movement for one row, use moveDisabled() with whatever criteria you have. For example, we could say that Glenn must always appear first in our list like this:
                Text(user)
                    .moveDisabled(user == "Alice")
            }
        }
        
        NavigationStack {
            /// When moving several items it’s always a good idea to move the later ones first so that you avoid moving other items and getting your indexes confused. Fortunately, Swift’s sequences have a built-in way to move index sets for us, so we can just pass the parameters along and have it work correctly.
            
            /// As an example, we could create a ContentView struct that sets up an array of three username strings, and asks SwiftUI to move them around calling a move() method. In order to activate moving – i.e., to make the drag handles appear – it also adds an edit button to the navigation stack so the user can toggle editing mode.
            
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onMove(perform: move)
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    
    /// For the more complex approach to moving, we can attach an onMove(perform:) modifier to a ForEach inside a list, and have it call a method of our choosing when a move operation happens. That method needs to accept a source IndexSet and a destination Int, like this:
    func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    LetUsersMoveRowsInAList()
}
