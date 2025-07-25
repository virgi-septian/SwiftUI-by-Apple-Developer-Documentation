//
//  CreateMulti-ColumnLists.swift
//  PositionViews
//
//  Created by Virgi Septian on 25/07/25.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    var name: String
    var score: Int
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    var city: String
    let birthDate: Date
    var children = [Person]()

    // some example websites
    static let betsy = Person(name: "Betsy Appleseed", city: "San Jose", birthDate: ISO8601DateFormatter().date(from: "1977-01-30T11:28:00+00:00")!)
    static let kate = Person(name: "Kate Appleseed", city: "Los Altos", birthDate: ISO8601DateFormatter().date(from: "1977-02-25T04:15:00+00:00")!)
    static let johnny = Person(name: "Johnny Appleseed", city: "Santa Clara", birthDate: ISO8601DateFormatter().date(from: "1952-06-03T12:45:00+00:00")!, children: [betsy, kate])
    static let tim = Person(name: "Tim Appleseed", city: "Mountain View", birthDate: ISO8601DateFormatter().date(from: "1960-11-01T09:41:00+00:00")!)
}

struct CreateMultiColumnLists: View {
//    let family: [Person] = [.johnny, .tim, .betsy]
//
//    @State private var bookmarksExpanded = false
//
//    var body: some View {
//        Table(of: Person.self) {
//            TableColumn("Name", value: \.name)
//            TableColumn("City", value: \.city)
//            TableColumn("Birthdate") { person in
//                Text(person.birthDate.formatted(date: .numeric, time: .omitted))
//            }
//        } rows: {
//            ForEach(family) { member in
//                if member.children.isEmpty {
//                    TableRow(member)
//                } else {
//                    DisclosureTableRow(member) {
//                        ForEach(member.children)
//                    }
//                }
//            }
//        }
//    }
    
    //MARK: - <#Section Heading#>
    
//    @State private var users = [
//        User(id: 1, name: "Taylor Swift", score: 95),
//        User(id: 2, name: "Justin Bieber", score: 80),
//        User(id: 3, name: "Adele Adkins", score: 85)
//    ]
//
//    var body: some View {
//        Table(users) {
//            TableColumn("Name", value: \.name)
//            TableColumn("Score") { user in
//                Text(String(user.score))
//            }
//        }
//    }
    
    //MARK: - Selection in tables works slightly differently from lists: rather than storing the specific object that was selected, Table instead wants to bind to the identifier of the object. As our User struct conforms to Identifiable, this will be User.ID – the associated type that points to our id property. So, we’d add a new property to store an optional User.ID value, then bind it to the Table like this:
//    @State private var users = [
//        User(id: 1, name: "Taylor Swift", score: 95),
//        User(id: 2, name: "Justin Bieber", score: 80),
//        User(id: 3, name: "Adele Adkins", score: 85)
//    ]
//
//    @State private var selection: User.ID?
//
//    var body: some View {
//        Table(users, selection: $selection) {
//            TableColumn("Name", value: \.name)
//            TableColumn("Score") { user in
//                Text(String(user.score))
//            }
//        }
//    }
    
    
//    Tip: If you want multiple rows to be selectable, use selection = Set<User.ID>() rather than selection: User.ID?.
//
//    Adding sorting to the mix takes four steps:
//
//    Make an array of KeyPathComparator objects with your default sorting inside.
//    Add that as the sortOrder parameter to your Table initializer.
//    Add a specific key path for the “Score” column, so SwiftUI understands what sorting it means.
//    Watch for changes in the sort order, and resort your array as needed. We already marked our array using @State, so we can sort it in place.
//    Here’s how our example code looks with those four changes in place:
    
    
    //MARK: - <#Section Heading#>
//    @State private var users = [
//        User(id: 1, name: "Taylor Swift", score: 95),
//        User(id: 2, name: "Justin Bieber", score: 80),
//        User(id: 3, name: "Adele Adkins", score: 85)
//    ]
//
//    @State private var sortOrder = [KeyPathComparator(\User.name)]
//    @State private var selection: User.ID?
//
//    var body: some View {
//        Table(users, selection: $selection, sortOrder: $sortOrder) {
//            TableColumn("Name", value: \.name)
//            TableColumn("Score", value: \.score) { user in
//                Text(String(user.score))
//            }
//            .width(100)
//        }
//        .onChange(of: sortOrder) { newOrder in
//            users.sort(using: newOrder)
//        }
//    }

    //MARK: - And second, rather than sending a fixed into Table, you can also pass a rows closure that specifies the exact data you want to show. This is helpful when you want to use static list rows, or mix static and dynamic at the same time. Each row needs to be sent in as a TableRow instance, which will take as its only parameter a value to show – one of our User instances in our case.
    
    ///As an example, we could use a ForEach to create all the regular dynamic rows, but also add a “First” and “Last” user at the start and end of our table:
    @State private var users = [
        User(id: 1, name: "Taylor Swift", score: 90),
        User(id: 2, name: "Justin Bieber", score: 80),
        User(id: 3, name: "Adele Adkins", score: 85)
    ]

    @State private var sortOrder = [KeyPathComparator(\User.name)]
    @State private var selection: User.ID?

    var body: some View {
        Table(selection: $selection, sortOrder: $sortOrder) {
            TableColumn("Name", value: \.name)
            TableColumn("Score", value: \.score) { user in
                Text(String(user.score))
            }
            .width(min: 50, max: 100)
        } rows: {
            TableRow(User(id: 0, name: "First", score: 0))
            ForEach(users)
            TableRow(User(id: 4, name: "Last", score: 100))
        }
        .onChange(of: sortOrder) { newOrder in
            users.sort(using: newOrder)
        }
    }
}

#Preview {
    CreateMultiColumnLists()
}
