//
//  ReadTheLocationOfUser.swift
//  Data
//
//  Created by Virgi Septian on 25/08/25.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error mendapatkan lokasi: \(error.localizedDescription)")
    }
}

struct ReadTheLocationOfUser: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
            }

            LocationButton(.shareMyCurrentLocation) {
                locationManager.requestLocation()
            }
//            LocationButton {
//                locationManager.requestLocation()
//            }
            .frame(height: 44)
            .padding()
        }
    }
}


#Preview {
    ReadTheLocationOfUser()
}
