//
//  MapBottomBar.swift
//  InterestingUI
//
//  Created by Virgi Septian on 24/09/25.
//

import SwiftUI
import MapKit

/// Apple Park Coordinates
extension MKCoordinateRegion {
    static let applePark = MKCoordinateRegion(center: .init(latitude: 37.3346, longitude: -122.0090), latitudinalMeters: 1000, longitudinalMeters: 1000)
}

struct MapBottomBar: View {
    @State private var showBottomBar = true
//    @State private var selection: PresentationDetent = .height(80)
    var body: some View {
        Map(initialPosition: .region(.applePark))
            .sheet(isPresented: $showBottomBar) {
//                BottomBarView(selection: $selection)
//                    .presentationDetents([.height(80), .fraction(0.6), .large], selection: $selection)
//                    .presentationBackgroundInteraction(.enabled)
                BottomBarView()
                    .presentationDetents([.height(isiOS26 ? 80 : 130), .fraction(0.6), .large])
                    .presentationBackgroundInteraction(.enabled)
            }
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        MapBottomBar()
    } else {
        // Fallback on earlier versions
    }
}

