//
//  UseImplicitStacking.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var username = "Anonymous"
}

struct UseImplicitStacking: View {
    let users = [User(), User(), User()]
    var body: some View {
        /// What happens if you create a dynamic list and put more than one thing in each row? SwiftUI’s solution is simple, flexible, and gives us great behavior by default: it creates an implicit HStack to hold your items, so they automatically get laid out horizontally.
        
        /// As an example, we could create a row where we had a small picture on the left and the remaining space be allocated to a text field, then create an array of three users and show them in a dynamic list.
        List(users) { user in
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(user.username)
            }
        }
            
        /// Notice how we don’t need to place the image and text views into a HStack to have them rendered side by side – SwiftUI figures it out for us.
    }
}

#Preview {
    UseImplicitStacking()
}
