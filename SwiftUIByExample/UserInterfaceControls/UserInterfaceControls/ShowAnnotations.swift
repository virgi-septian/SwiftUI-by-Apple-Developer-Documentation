//
//  ShowAnnotations.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 02/08/25.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ShowAnnotations: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))

        let annotations = [
            City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
            City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
            City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
            City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
        ]

        var body: some View {
            Map(coordinateRegion: $region, annotationItems: annotations) {
//                MapPin(coordinate: $0.coordinate)
//                MapMarker(coordinate: $0.coordinate)
                
                /// if you want complete control, you can also pass in completely custom views – some text, an image, a NavigationLink, and so on.
                MapAnnotation(coordinate: $0.coordinate) {
                    Circle()
                        .strokeBorder(.red, lineWidth: 4)
                        .frame(width: 40, height: 40)
                }
            }
            .frame(width: 400, height: 300)
        }
}


#Preview {
    ShowAnnotations()
}
