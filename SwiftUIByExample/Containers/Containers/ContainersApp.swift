//
//  ContainersApp.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

@main
struct ContainersApp: App {
    var body: some Scene {
        WindowGroup {
//            EmbedViewsInATabBar()
//            CreateScrollingPagesOfContent()
            
            /// your have to run the simulator to see the result
//            TabView {
//                Text("First")
//                Text("Second")
//                Text("Third")
//                Text("Fourth")
//            }
//            .tabViewStyle(.page)
            /// You can control the way paging dots are shown by adding an extra parameter to the .page method. For example, if you never wanted the paging dots to be shown, you would use this:
//            .tabViewStyle(.page(indexDisplayMode: .never))
//            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
//            GroupViewsTogether()
//            HideAndShowTheStatusBar()
//            CreateAToolbar()
//            LetUsersCustomizeToolbarButtons()
//            AddABadgeToTabViewItemsAndListRows()
//            GroupViewsVisually()
            HowToHideAnyBar()
        }
    }
}
