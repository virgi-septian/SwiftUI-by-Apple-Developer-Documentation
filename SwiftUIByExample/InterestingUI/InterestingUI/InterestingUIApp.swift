//
//  InterestingUIApp.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/06/25.
//

import SwiftUI
import AppIntents

@main
struct InterestingUIApp: App {
    init() {
        AppDependencyManager.shared.add {
            LatteOrderManager()
        }
    }
//    @StateObject private var containerData = ZoomContainerData()
    @StateObject private var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            //MARK: - Interisting UI
//            ZoomContainer {
//                PincToZoom()
//            }
            
            //MARK: - Instagram Profile Scroll Tab View
//            ProfileScrollTabView()
            
//            ContentRestrictedTextField()
            
//            ContentPullToSearch()
            
//            ContentResizableHeaderScrollView()
//            ContentSkeletonView()
//            ContentCalendar()
//            DragDropList()
//            ZoomTransitions()
//            MultipleImageViewer()
//            ContentStaggeredView()
//            InternetConnectivity()
//                .environment(\.isNetworkConnected, networkMonitor.isConnected)
//                .environment(\.connectionType, networkMonitor.connectionType)
//            ParallaxCarousel()
//            ContentRestrictedTextField()
            if #available(iOS 26.0, *) {
//                ContentGradientGenerator()
                InteractiveSnippets()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
