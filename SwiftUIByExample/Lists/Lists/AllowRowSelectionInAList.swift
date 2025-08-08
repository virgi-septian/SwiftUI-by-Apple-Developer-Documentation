//
//  AllowRowSelectionInAList.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct AllowRowSelectionInAList: View {
    @State private var selection: String? = nil
    /// If you want multiple selection, all you need to do is change your selection property into a Set of the same type as your list array. So, if we wanted multiple selection in the previous example we’d use this:
//    @State private var selection = Set<String>()
    
    let names = [
            "Cyril",
            "Lana",
            "Mallory",
            "Sterling"
        ]
    
    var body: some View {
        NavigationStack {
            List(names, id: \.self, selection: $selection) { name in
                Text(name)
            }
            .navigationTitle("List Selection")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    AllowRowSelectionInAList()
}
