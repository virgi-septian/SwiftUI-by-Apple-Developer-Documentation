//
//  PinchZoom.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/06/25.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    @ViewBuilder
    /// Adds pinch-to-zoom interaction to any SwiftUI View.
    /// - Parameter dimsBackground: Whether to dim the background when zooming.
    func pinchZoom(_ dimsBackground: Bool = true) -> some View {
        PinchZoomHelper(dimsBackground: dimsBackground) {
            self
        }
    }
}

//MARK: - Zoom Container View

//MARK: - Where the Zooming View Will be displayed and zoomed
struct ZoomContainer<Content: View>: View {
    var content: Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    @StateObject private var containerData = ZoomContainerData()
    var body: some View {
        GeometryReader { _ in
            content
                .environmentObject(containerData)
            
            ZStack(alignment: .topLeading) {
                if let view = containerData.zoomingView {
                    Group {
                        if containerData.dimsBackground {
                            Rectangle()
                                .fill(Color.black.opacity(0.25))
                                .opacity(containerData.zoom - 1)
                        }
                        
                        view
                            .scaleEffect(containerData.zoom, anchor: containerData.zoomAnchor)
                            .offset(containerData.zoomOffset + containerData.dragOffset)
                        /// View Position
                            .offset(x: containerData.viewRect.minX, y: containerData.viewRect.minY)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

extension CGSize {
    static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        .init(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}

//MARK: - Observable Class to share data between Container and it's Views inside it
@Observable
class ZoomContainerData: ObservableObject {
    var zoomingView: AnyView?
    var viewRect: CGRect = .zero
    var dimsBackground: Bool = false
    /// View Properties
    var zoom: CGFloat = 1
    var zoomAnchor: UnitPoint = .center
    var zoomOffset: CGSize = .zero
    var dragOffset: CGSize = .zero
    var isResetting: Bool = false
}

//MARK: - Helper View
fileprivate struct PinchZoomHelper<Content: View>: View {
    var dimsBackground: Bool
    @ViewBuilder var content: Content
    
    /// View Property
    @EnvironmentObject private var containerData: ZoomContainerData
    @State private var config: Config = .init()
    var body: some View {
        content
            .opacity(config.hidesSourceVideo ? 0 : 1)
            .overlay(GestureOverlay(config: $config))
            .overlay {
                GeometryReader {
                    let react = $0.frame(in: .global)
                    Color.clear
                        .onChange(of: config.isGestureActive) { oldValue, newValue in
                            if newValue {
                                guard !containerData.isResetting else { return }
                                /// Showiing View on Zoom Container
                                containerData.viewRect = react
                                containerData.zoomAnchor = config.zoomAnchor
                                containerData.dimsBackground = dimsBackground
                                containerData.zoomingView = .init(erasing: content)
                                /// Hiding Source View
                                config.hidesSourceVideo = true
                            } else {
                                /// Resetting to it's initial Position With Animation
                                containerData.isResetting = true
                                withAnimation(.snappy(duration: 0.3, extraBounce: 0),
                                    completionCriteria: .logicallyComplete) {
                                    containerData.dragOffset = .zero
                                    containerData.zoom = 1
                                } completion: {
                                    /// Resetting Config
                                    config = .init()
                                    /// Removing View From Container Layer
                                    containerData.zoomingView = nil
                                    containerData.isResetting = false
                                }
                            }
                        }
                        .onChange(of: config) { oldValue, newValue in
                            if config.isGestureActive && !containerData.isResetting {
                                containerData.zoom = config.zoom
                                containerData.dragOffset = config.dragOffset
                            }
                        }
                }
            }
    }
}

//MARK: - UIKit Gesture Overlay
fileprivate struct GestureOverlay: UIViewRepresentable {
    @Binding var config: Config
    func makeCoordinator() -> Coordinator {
        Coordinator(config: $config)
    }
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        /// Pan Genture
        let panGesture = UIPanGestureRecognizer()
        panGesture.name = "PINCHPANGERTURE"
        panGesture.minimumNumberOfTouches = 2
        panGesture.addTarget(context.coordinator, action: #selector(Coordinator.panGesture(gesture:)))
        panGesture.delegate = context.coordinator
        view.addGestureRecognizer(panGesture)
        
        /// Pinch Gesture
        let pinchGesture = UIPinchGestureRecognizer()
        pinchGesture.name = "PINCHZOOMGERTURE"
        pinchGesture.addTarget(context.coordinator, action: #selector(Coordinator.pinchGesture(gesture:)))
        pinchGesture.delegate = context.coordinator
        view.addGestureRecognizer(pinchGesture)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        @Binding var config: Config
        init(config: Binding<Config>) {
            self._config = config
        }
        
        @objc
        func panGesture(gesture: UIPanGestureRecognizer){
            if gesture.state == .began || gesture.state == .changed {
                let translation = gesture.translation(in: gesture.view)
                config.dragOffset = .init(width: translation.x, height: translation.y)
                config.isGestureActive = true
            } else {
                config.isGestureActive = false
            }
        }
        
        @objc
        func pinchGesture(gesture: UIPinchGestureRecognizer){
            if gesture.state == .began {
                let location = gesture.location(in: gesture.view)
                
                if let bounds = gesture.view?.bounds {
                    config.zoomAnchor = .init(x: location.x / bounds.width, y: location.y / bounds.height)
                }
            }
            
            if gesture.state == .began || gesture.state == .changed {
                let scale = min(max(gesture.scale, 1), 5)
                config.zoom = scale
                config.isGestureActive = true
            } else {
                config.isGestureActive = false
            }
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            if gestureRecognizer.name == "PINCHPANGERTURE" && otherGestureRecognizer.name == "PINCHZOOMGERTURE" {
                return true
            }
            
            return false
        }
    }
}

//MARK: - Config
fileprivate struct Config: Equatable {
    var isGestureActive: Bool = false
    var zoom: CGFloat = 1
    var zoomAnchor: UnitPoint = .center
    var dragOffset: CGSize = .zero
    var hidesSourceVideo: Bool = false
}

//#Preview {
//    PincToZoom()
//}
