//
//  addCustomSwipeActionButtons.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct AddCustomSwipeActionButtons :View {
    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]
    @State private var total = 0
    var body: some View {
        List {
            Text("Pepperoni Pizza")
                .swipeActions {
                    Button("Order") {
                        print("Awesome !")
                    }
                    .tint(.green)
                }
            
            Text("Pepperoni Pizzan With Extra Cheese")
                .swipeActions {
                    Button("Burn") {
                        print("Right On !")
                    }
                    .tint(.red)
                }
            /// Tip: For genuinely destructive buttons, you should use Button(role: .destructive) rather than just assigning a red tint color.
        }
        
        /// By default, the first of your swipe actions will be automatically triggered if the user swipes far enough. If you want to disable this, set allowsFullSwipe to false when creating your swipe actions.
        
        /// To demonstrate this, here’s a list that adds two swipe actions per friend shown in the list, but neither of them are triggered by default no matter how far the user swipes:
        NavigationStack {
            List {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                        .swipeActions(allowsFullSwipe: false) {
                            Button {
                                print("Muting conversation")
                            } label: {
                                Label("Mute", systemImage: "bell.slash.fill")
                            }
                            .tint(.indigo)

                            Button(role: .destructive) {
                                print("Deleting conversation")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
            }
        }
        
        /// If you want to add different swipe actions to either side of a row, just call swipeActions() twice with different edges. For example, we could make a swipe action calculator by adding or subtracting numbers depending on which side was swiped:
        NavigationStack {
            List {
                ForEach(1..<100) { i in
                    Text("\(i)")
                        .swipeActions(edge: .leading) {
                            Button {
                                total += i
                            } label: {
                                Label("Add \(i)", systemImage: "plus.circle")
                            }
                            .tint(.indigo)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                total -= i
                            } label: {
                                Label("Subtract \(i)", systemImage: "minus.circle")
                            }
                        }
                }
            }
            .navigationTitle("Total: \(total)")
        }
    }
}

#Preview {
    AddCustomSwipeActionButtons()
}
