//
//  AdaptiveLayoutDesign.swift
//  InterestingUI
//
//  Created by Virgi Septian on 25/07/25.
//

import SwiftUI

/// Tabs
enum TabState: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case notifications = "Notifications"
    case profile = "Profile"

    var symbolImage: String {
        switch self {
        case .home: "house"
        case .search: "magnifyingglass"
        case .notifications: "bell"
        case .profile: "person.crop.circle"
        }
    }
}

struct AdaptiveLayoutDesign: View {
    /// Gesture Properties
    @State private var activeTab: TabState = .home
    @State private var offset: CGFloat = 0
    @State private var lastDragOffset: CGFloat = 0
    @State private var progress: CGFloat = 0
    /// Navigatioin path
    @State private var navigationPath: NavigationPath = .init()
    var body: some View {
        AdaptiveView { size, isLandscape in
//            let sideBarWidth: CGFloat = UIScreen.main.bounds.width * 250
            let sideBarWidth: CGFloat = isLandscape ? 220 : 250
            let layout = isLandscape ? AnyLayout(HStackLayout(spacing: 0)) : AnyLayout(ZStackLayout(alignment: .leading))
            
            NavigationStack(path: $navigationPath) {
                layout {
                    SideBarView(path: $navigationPath) {
                        toggleSideBar()
                    }
                    .frame(width: sideBarWidth)
                    .offset(x: isLandscape ? 0 : -sideBarWidth)
                    .offset(x: isLandscape ? 0 : offset)
                    
                    TabView(selection: $activeTab) {
                        Tab(TabState.home.rawValue, systemImage: TabState.home.symbolImage, value: .home) {
                            Text("Home")
                        }
                        
                        Tab(TabState.search.rawValue, systemImage: TabState.search.symbolImage, value: .search) {
                            Text("Search")
                        }
                        
                        Tab(TabState.notifications.rawValue, systemImage: TabState.notifications.symbolImage, value: .notifications) {
                            Text("Notifications")
                        }
                        
                        Tab(TabState.profile.rawValue, systemImage: TabState.profile.symbolImage, value: .profile) {
                            Text("Profile")
                        }
                    }
                    .tabViewStyle(.tabBarOnly)
                    .overlay {
                        Rectangle()
                            .fill(.black.opacity(0.25))
                            .ignoresSafeArea()
                            .opacity(isLandscape ? 0 : progress)
                    }
                    .offset(x: isLandscape ? 0 : offset)
                }
                .gesture(
                    CustomGesture(isEnabled: !isLandscape) { gesture in
                        let state = gesture.state
                        let translation = gesture.translation(in: gesture.view).x +
                        lastDragOffset // 'lastDragOffset' perlu menjadi @State property di view utama
                        let velocity = gesture.velocity(in: gesture.view).x / 3
                        
                        if state == .began || state == .changed {
                            /// onChanged
                            offset = max(min(translation, sideBarWidth), 0)
                            /// Storing Drag Progess, for fading TabView when dragging
                            progress = max(min(offset / sideBarWidth, 1), 0)
                        } else {
                            /// onEnded
                            withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
                                if (velocity + offset) > (sideBarWidth * 0.5) {
                                    /// Expand Fully
                                    offset = sideBarWidth
                                    progress = 1
                                } else {
                                    /// Reset to zeroz
                                    offset = 0
                                    progress = 0
                                }
                            }
                            /// Saving Last Drag Offset
                            lastDragOffset = offset
                        }
                    }
                )
                .navigationDestination(for: String.self) { value in
                    Text("Hello, This is detail \(value) View")
                        .navigationTitle("\(value)")
                }
            }
//            .gesture(DragGesture()
//                .onChanged({ value in
//                    let translation = value.translation.width + lastDragOffset
//                    offset = max(min(translation, sideBarWidth), 0)
//                    /// Storing Drag Progess, for fading TabView when dragging
//                }).onEnded({ value in
//                    let velocity = value.translation.width / 3
//
//                    withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
//                        if (velocity + offset) > (sideBarWidth * 0.5) {
//                            /// Expand Fully
//                            offset = sideBarWidth
//                            progress = 1
//                        } else {
//                            /// Reset to zero
//                            offset = 0
//                            progress = 1
//                        }
//                    }
//                    
//                    /// Saving Last Drag Offset
//                    lastDragOffset = offset
//                })
//            )
        }
    }
    
    func toggleSideBar() {
        withAnimation(.snappy(duration: 0.25, extraBounce: 0 )) {
//            progress = 0
//            offset = 0
//            lastDragOffset = 0
        }
    }
}

struct SideBarView: View {
    @Binding var path: NavigationPath
    var toggleSideBar: () -> ()
    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let isSideHavingValues = safeArea.leading != 0 || safeArea.trailing != 0
            
            ScrollView(.vertical){
                VStack(alignment: .leading ,spacing: 6) {
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(.circle)
                    
                    Text("iJustine")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text("@gmail.com")
                        .foregroundStyle(.gray)
                        .font(.caption2)
                    HStack(spacing: 4) {
                        Text("4.3 K")
                            .fontWeight(.semibold)
                        
                        Text("Following")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        
                        Text("1.8 K")
                            .fontWeight(.semibold)
                        
                        Text("Followers")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .padding(.top, 5)
                    
                    /// Side Bar navigation items
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(SideBarAction.allCases, id: \.rawValue) { action in
                            SideBarActionButton(value: action) {
                                toggleSideBar()
                                path.append(action.rawValue)
                            }
                        }
                    }
                    .padding(.top, 25)
                }
                .padding(15)
                .padding(.horizontal, isSideHavingValues ? 5 : 15 )
            }
            .scrollClipDisabled()
            .scrollIndicators(.hidden)
            .background {
                Rectangle()
                    .fill(.background)
                    .overlay(alignment: .trailing) {
                        Rectangle()
                            .fill(.gray.opacity(0.35))
                            .frame(width: 1)
                    }
                    .ignoresSafeArea()
            }
        }
    }
    
    @ViewBuilder
    func SideBarActionButton(value: SideBarAction, action: @escaping () -> ()) -> some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: value.symbolImage)
                    .font(.title3)
                    .frame(width: 30)
                
                Text(value.rawValue)
                    .fontWeight(.semibold)
                
                Spacer(minLength: 0)
            }
            .foregroundStyle(Color.primary)
            .padding(.vertical, 10)
            .contentShape(.rect)
        }
    }
}

/// Side Bar Actions
enum SideBarAction: String, CaseIterable {
    case communities = "Communities"
    case bookmarks = "Bookmarks"
    case lists = "Lists"
    case messages = "Messages"
    case monetization = "Monetization"
    case settings = "Settings"

    var symbolImage: String {
        switch self {
        case .communities: "person.2"
        case .bookmarks: "bookmark"
        case .lists: "list.bullet.clipboard"
        case .messages: "message.badge.waveform"
        case .monetization: "banknote"
        case .settings: "gearshape"
        }
    }
}

/// Custom Gesture
struct CustomGesture: UIGestureRecognizerRepresentable {
    var isEnabled: Bool
    var handle: (UIPanGestureRecognizer) -> ()
    func makeUIGestureRecognizer(context: Context) -> UIPanGestureRecognizer {
        let gesture = UIPanGestureRecognizer()
        return gesture
    }

    func updateUIGestureRecognizer(_ recognizer: UIPanGestureRecognizer, context: Context) {
        recognizer.isEnabled = isEnabled
    }

    func handleUIGestureRecognizerAction(_ recognizer: UIPanGestureRecognizer, context: Context) {
        // code
        handle(recognizer)
    }
}

/// Adaptive View
struct AdaptiveView<Content: View>: View {
    var showSideBarOnIpadProtrait: Bool = true
    @ViewBuilder var content: (CGSize, Bool) -> Content
    @Environment(\.horizontalSizeClass) private var hClass
    var body: some View {
        GeometryReader { proxy in // Mengganti $0 dengan 'proxy' untuk kejelasan
            let size = proxy.size
            let isLandscape = size.width > size.height || hClass == .regular && showSideBarOnIpadProtrait

            content(size, isLandscape)
        }
    }
}


#Preview {
    AdaptiveLayoutDesign()
}
