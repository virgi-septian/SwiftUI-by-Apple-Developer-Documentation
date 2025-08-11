//
//  HowToHideAnyBar.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct HowToHideAnyBar: View {
    var body: some View {
        /// SwiftUI’s toolbar() modifier lets us hide or show any of the system bars whenever we need, which is particularly useful when you have a TabView that you want to hide after a navigation push.
        
        /// Attach the modifier to whatever view should trigger the bar to be hidden or shown. For example, this code will cause the tab bar to be hidden when it’s pushed onto the navigation stack:
//        TabView {
//            NavigationStack {
//                NavigationLink("Tap Me") {
//                    Text("Detail View")
//                        .toolbar(.hidden, for: .tabBar)
//                }
//                .navigationTitle("Primary View")
//            }
//            .tabItem {
//                Label("Home", systemImage: "house")
//            }
//        }
        /// If you don’t specify an exact bar to hide – if you write just toolbar(.hidden) without specifying for: .tabBar – the hide request flows upwards to the nearest container. In this case it will result in the navigation bar being hidden as that’s the nearest container.
        
        
        
        /// You can change the value passed in to toolbar() whenever you want, so you could allow the user to toggle the navigation bar with code like this:
        NavigationStack {
            NavigationLink("Tap Me", destination: DetailView.init)
            .navigationTitle("Primary View")
        }
    }
}

struct DetailView: View {
    @State private var showNavigationBar = true

    var body: some View {
        Text("Detail View")
            .toolbar(showNavigationBar ? .visible : .hidden)
            .onTapGesture {
                withAnimation {
                    showNavigationBar.toggle()
                }
            }
    }
}

#Preview {
    HowToHideAnyBar()
}
