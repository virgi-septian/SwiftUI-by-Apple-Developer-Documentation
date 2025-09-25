//
//  ButtomBarView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 24/09/25.
//

import SwiftUI

/// Tab Enum
enum AppTab: String, CaseIterable {
    case people = "People"
    case devices = "Devices"
    case items = "Items"
    case me = "Me"

    var symbolImage: String {
        switch self {
        case .people:
            return "person.2"
        case .devices:
            return "macbook.and.iphone"
        case .items:
            return "circle.grid.2x2"
        case .me:
            return "location.slash"
        }
    }
}

struct BottomBarView: View {
//    @Binding var selection: PresentationDetent
    @State private var activeTab: AppTab = .devices

    var body: some View {
        GeometryReader {
            let safeArea = $0.safeAreaInsets
            let bottomPadding = safeArea.bottom / 5
            
            VStack(spacing: 0) {
//                IndividualTabView(activeTab)
                TabView(selection: $activeTab) {
                    Tab.init(value: .people) {
                        IndividualTabView(.people)
                    }
                    Tab.init(value: .devices) {
                        IndividualTabView(.devices)
                    }
                    Tab.init(value: .items) {
                        IndividualTabView(.items)
                    }
                    Tab.init(value: .me) {
                        IndividualTabView(.me)
                    }
                }
                .tabViewStyle(.tabBarOnly)
                .background {
                    if #available(iOS 26.0, *) {
                        TabViewHelper()
                    }
                }
                .compositingGroup()
                
                CustomTabBar()
                    .padding(.bottom, isiOS26 ? bottomPadding : 0)
            }
            .ignoresSafeArea(.all, edges: isiOS26 ? .bottom : [])
        }
        .interactiveDismissDisabled()
    }
    
    /// Individual Tab View
    @ViewBuilder
    func IndividualTabView(_ tab: AppTab) -> some View {
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Text(tab.rawValue)
                        .font(isiOS26 ? .largeTitle : .title)
                        .fontWeight(.bold)

                    Spacer(minLength: 0)

                    if #available(iOS 26.0, *) {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: 30, height: 30)
                        }
                        .buttonStyle(.glass)
                        .buttonBorderShape(.circle)
                    } else {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .frame(width: 30, height: 30)
                        }
                        .buttonBorderShape(.circle)
                    }
                }
                .padding(.top, isiOS26 ? 15 : 10)
                .padding(.leading, isiOS26 ? 10 : 0)
            }
            .padding(15)
        }
        .toolbarVisibility(.hidden, for: .tabBar)
        .toolbarBackgroundVisibility(.hidden, for: .tabBar)
    }
    
    /// Custom Tab Bar
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(AppTab.allCases, id: \.rawValue) { tab in
                VStack(spacing: 6) {
                    Image(systemName: tab.symbolImage)
                        .font(.title3)
                        .symbolVariant(.fill)

                    Text(tab.rawValue)
                        .font(.caption2)
                        .fontWeight(.semibold)
                }
                .foregroundStyle(activeTab == tab ? .blue : .gray)
                .frame(maxWidth: .infinity)
                .contentShape(.rect)
                .onTapGesture {
                    activeTab = tab
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .padding(.bottom, isiOS26 ? 12 : 5)
        .overlay(alignment: .top) {
            if !isiOS26 {
                Divider()
            }
        }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        MapBottomBar()
    } else {
        // Fallback on earlier versions
        MapBottomBar()
    }
}

@available(iOS 26.0, *)
fileprivate struct TabViewHelper: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear

        DispatchQueue.main.async {
            guard let compostingGroup = view.superview?.superview else { return }
            guard let swiftUIWrapperUITabView = compostingGroup.subviews.last else { return }

            if let tabBarController = swiftUIWrapperUITabView.subviews.first?.next as? UITabBarController {
                // Clearing Backgrounds
                tabBarController.view.backgroundColor = .clear
                tabBarController.viewControllers?.forEach {
                    $0.view.backgroundColor = .clear
                }
                
                tabBarController.delegate = context.coordinator
                
                /// Temporary Solution
                tabBarController.tabBar.removeFromSuperview()
            }
        }
        
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITabBarControllerDelegate, UIViewControllerAnimatedTransitioning {
        func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
            return self
        }

        func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
            return .zero
        }

        func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
            guard let destinationView = transitionContext.view(forKey: .to) else { return }
            let containerView = transitionContext.containerView

            containerView.addSubview(destinationView)
            transitionContext.completeTransition(true)
        }
    }
}

extension View {
    var isiOS26: Bool {
        if #available(iOS 26.0, *) {
            return true
        } else {
            return false
        }
    }
}
