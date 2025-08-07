//
//  CreateAListOfDynamicItems.swift
//  Lists
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

/// In order to handle dynamic items, you must first tell SwiftUI how it can identify which item is which. This is can either be done by specifying the identifying property by hand, or by using the Identifiable protocol. This protocol has only one requirement, which is that the type must have some sort of id value SwiftUI can use to see which item is which.

/// To demonstrate this, we can create three things then put them together:

/// - A Restaurant struct that says restaurants have an ID and name, with the ID being a random identifier just so that SwiftUI knows which is which.

/// - A small view that determines what each row in our list looks like. In our case we’re going to define a RestaurantRow view that stores one restaurant and prints its name in a text view.

/// - A list view that shows several restaurants. This means creating some example data, putting it into an array, then passing that into a list to be rendered.

// A struct to store exactly one restaurant's data.
struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}

// A view that shows the data for one Restaurant.
struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

struct CreateAListOfDynamicItems: View {
    let restaurants = [
        Restaurant(name: "Joe's Original"),
        Restaurant(name: "The Real Joe's Original"),
        Restaurant(name: "Original Joe's")
    ]

    var body: some View {
        List(restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
        
        /// In fact, in trivial cases like this one we can make the code even shorter: List(restaurants, rowContent: RestaurantRow.init) does exactly the same thing.
        List(restaurants, rowContent: RestaurantRow.init)
    }
}


#Preview {
    CreateAListOfDynamicItems()
}
