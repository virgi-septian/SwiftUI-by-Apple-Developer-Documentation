//
//  CustomizeTheBackgroundColor.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct CustomizeTheBackgroundColor: View {
    var body: some View {
        /// SwiftUI’s toolbarBackground() modifier lets us customize the way toolbars look in our app, controlling the styling of NavigationStack, TabView, and other toolbars as needed.
        
        /// For example, this shows a list of 100 rows using a teal background color for the navigation bar:
//        NavigationStack {
//            List(0..<100) {
//                Text("Row \($0)")
//            }
//            .navigationTitle("100 Rows")
//            .toolbarBackground(.teal)
//        }
        
        
        /// If you want one or two bar types to be colored, or perhaps if you want to provide different styling for each bar, you can provide a second parameter to toolbarBackground() to get extra control. For example, we could ask the system to color both the tab bar and the navigation bar like this:
//        TabView {
//            NavigationStack {
//                List(0..<100) {
//                    Text("Row \($0)")
//                }
//                .navigationTitle("100 Rows")
//                .toolbarBackground(.orange, for: .navigationBar, .tabBar)
//            }
//            .tabItem {
//                Label("Rows", systemImage: "list.bullet")
//            }
//            
//            NavigationStack {
//                List(0..<100) {
//                    Text("Row \($0)")
//                }
//                .navigationTitle("89 Rows")
//                .toolbarBackground(.orange, for: .navigationBar, .tabBar)
//            }
//            .tabItem {
//                Label("Rows", systemImage: "list.bullet")
//            }
//        }
        
        
        /// This modifier has one other important use: rather than specify a background color, you can ask the system to hide the background entirely, like this:
        NavigationStack {
            List(0..<100) {
                Text("Row \($0)")
            }
            .navigationTitle("100 Rows")
            .toolbarBackground(.hidden)
        }
    }
}

#Preview {
    CustomizeTheBackgroundColor()
}
