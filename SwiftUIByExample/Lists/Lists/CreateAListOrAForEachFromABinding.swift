//
//  CreateAListOrAForEachFromABinding.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct User2: Identifiable {
    let id = UUID()
    var name: String
    var isContacted = false
}

struct CreateAListOrAForEachFromABinding: View {
    @State private var users = [
        User2(name: "Virgi"),
        User2(name: "Zam - Zam"),
        User2(name: "Giwan")
    ]
    
    var body: some View {
        List($users) { $user in
            HStack {
                Text(user.name)
                Spacer()
                Toggle("User has been contacted", isOn: $user.isContacted)
                    .labelsHidden()
            }
        }
    }
}

#Preview {
    CreateAListOrAForEachFromABinding()
}


/// Using a binding in this way is the most efficient way of modifying the list, because it won’t cause the entire view to reload when only a single item changes.
