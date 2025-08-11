//
//  AddATabViewAccessory.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct AddATabViewAccessory: View {
    var body: some View {
        /// SwiftUI’s tabViewBottomAccessory() modifier lets us place a custom view directly above the tab bar on iPhone, similar to the "Now Playing" view in Apple Music.
        
        /// The view you place automatically gets a liquid glass background in a capsule shape, so it's trivial to use in its simplest case:
        TabView {
            Tab("Tab 1", systemImage: "1.circle") {
                List(0..<100) { i in
                    Text("Row \(i)")
                }
            }
            
            Tab("Tab 2", systemImage: "2.circle") {
                Text("Tab 2")
            }
        }
        //        .tabViewBottomAccessory {
        //            Text("Hello, world!")
        //        }
        
        
        
        /// This is particularly effective when combined with tab view minimization, because your bottom accessory view slides down into the space left by the tab bar, including nestling between the active tab and a search tab if you have one:
        TabView {
            Tab("Tab 1", systemImage: "1.circle") {
                List(0..<100) { i in
                    Text("Row \(i)")
                }
            }
            
            Tab("Tab 2", systemImage: "2.circle") {
                Text("Tab 2")
            }
        }
        //        .tabViewBottomAccessory {
        //            Text("Hello, world!")
        //        }
        //        .tabBarMinimizeBehavior(.onScrollDown)
        
        /// Note: At the time of writing, the padding around bottom accessories isn't quite right when the tab bar is minimized. Hopefully this will be addressed soon!
        
        /// In theory, you can detect where your tab bar accessory is currently placed by using the tabViewBottomAccessoryPlacement environment key, which will either be .inline, .expanded, or nil to represent an undefined placement.
        
        /// I say "in theory" because right now this API doesn't seem to work, but if you're reading this in the future then code like this ought to work:
        TabView {
            Tab("Tab 1", systemImage: "1.circle") {
                List(0..<100) { i in
                    Text("Row \(i)")
                }
            }

            Tab("Tab 2", systemImage: "2.circle") {
                Text("Tab 2")
            }
        }
//        .tabViewBottomAccessory(content: CustomAccessoryView.init)
//        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

//struct CustomAccessoryView: View {
//    @Environment(\.tabViewBottomAccessoryPlacement) var tabViewBottomAccessoryPlacement

//    var body: some View {
//        switch tabViewBottomAccessoryPlacement {
//        case .expanded:
//            VStack {
//                Text("Lots of space")
//                Text("Extra layout here")
//            }
//        default:
//            Text("Limited space")
//        }
//    }
//}

#Preview {
    AddATabViewAccessory()
}
