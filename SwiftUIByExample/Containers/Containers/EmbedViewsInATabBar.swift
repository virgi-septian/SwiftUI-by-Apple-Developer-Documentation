//
//  ContentView.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct EmbedViewsInATabBar: View {
    enum Section {
        case cats
        case dogs
    }

    @State private var selectedTab = Section.cats
    @State var selectedView = 1
    var body: some View {
        
        /// For iOS 18 and later, a TabView is created from multiple individual Tab views, each one with a title and an icon. If one of those tabs handles searching your app, add a role parameter of .search.
//        TabView {
//            Tab("Home", systemImage: "house") {
//                Text("Put a HomeView here")
//            }
//
//            Tab("Users", systemImage: "person.3") {
//                Text("Put a UsersView here")
//            }
//
//            Tab("Search", systemImage: "magnifyingglass", role: .search) {
//                Text("Put a SearchView here")
//            }
//        }
        
        //MARK: - Work on IpadOS
        /// Where things get more interesting is when you want to group tabs together in the iPadOS sidebar. Tab groups are made by placing one or more Tab views inside a TabSection, and we can allow users to move between tabs and a sidebar on supported platforms using the sidebarAdaptable style.
//        TabView {
//            TabSection("Watch") {
//                Tab("Movies", systemImage: "film") {
//                    Text("Put a MoviesView here")
//                }
//
//                Tab("TV Shows", systemImage: "tv") {
//                    Text("Put a TVShowsView here")
//                }
//            }
//
//            TabSection("Listen") {
//                Tab("Podcasts", systemImage: "mic") {
//                    Text("Put a PodcastsView here")
//                }
//                
//                Tab("Music", systemImage: "music.note.list") {
//                    Text("Put a MusicView here")
//                }
//                
//            }
//        }
//        .tabViewStyle(.sidebarAdaptable)
        
        /// If you want to programmatically control tab selection on iOS 18 and later, make a binding to the selection of your TabView, then add appropriate value parameter to your Tab objects.
        
        /// As an example, we could make a TabView that can move between views using the tabs or using dedicated buttons:
//        TabView(selection: $selectedTab) {
//            Tab("Cats", systemImage: "cat", value: .cats) {
//                Button("Go to Dogs") {
//                    selectedTab = .dogs
//                }
//                /// /// Note: When targeting iOS 18.4 and later, you can use the disabled() modifier on individual Tab instances, to stop the user from selecting them.
//                .disabled(true)
//            }
//
//            Tab("Dogs", systemImage: "dog", value: .dogs) {
//                Button("Go to Cats") {
//                    selectedTab = .cats
//                }
//            }
//        }
        
        //MARK: - iOS 17
        
        /// In its basic form, you should provide each item with an image and title, optionally also adding a tag if you want to control which tab is active programmatically. For example, this creates two views with different images, titles, and tags:
//        TabView {
//            Text("First View")
//                .padding()
//                .tabItem {
//                    Image(systemName: "1.circle")
//                    Text("First")
//                }
//                .tag(1)
//            Text("Second View")
//                .padding()
//                .tabItem {
//                    Image(systemName: "2.circle")
//                    Text("Second")
//                }
//                .tag(2)
//        }
        
        /// Rather than specifying text and image separately, you can also use a Label view to combine them together:
        TabView {
            Text("First View")
                .padding()
                .tabItem {
                    Label("First", systemImage: "1.circle")
                }
                .tag(1)

            Text("Second View")
                .padding()
                .tabItem {
                    Label("Second", systemImage: "2.circle")
                }
                .tag(2)
        }
        
        /// If you add tags, you can programmatically control the active tab by modifying the tab view’s selection. In this example I’ve made the content of each tab a button that changes view, which is done by adding some new state to track which tab is active, then attaching that to the selection value of the TabView:
        
//        TabView(selection: $selectedView) {
//            Button("Show Second View") {
//                selectedView = 2
//            }
//            .padding()
//            .tabItem {
//                Label("First", systemImage: "1.circle")
//            }
//            .tag(1)
//
//            Button("Show First View") {
//                selectedView = 1
//            }
//            .padding()
//            .tabItem {
//                Label("Second", systemImage: "2.circle")
//            }
//            .tag(2)
//        }
    }
}

#Preview {
    EmbedViewsInATabBar()
}

/// Tip: From iOS 15 you should not explicitly request the filled variant of SF Symbols icons, because the system will automatically use them as appropriate.
