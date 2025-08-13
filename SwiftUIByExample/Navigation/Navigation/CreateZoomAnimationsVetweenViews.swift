//
//  CreateZoomAnimationsVetweenViews.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI
/// SwiftUI provides a zoom transition effect that can be used when pushing to a new view with a NavigationStack, and also used when pushing to a sheet or a full-screen cover presentation. It's works similarly to a matched geometry effect, except it works across presentations where matched geometry effect fails.

/// First, we'd define some data to work with:
struct Icon: Identifiable {
    var id: String
    var color: Color
}

/// And now we can define a view that shows lots of icons, zooming one up when tapped:

struct CreateZoomAnimationsVetweenViews: View {
//    let icons = [
//        Icon(id: "figure.badminton", color: .red),
//        Icon(id: "figure.fencing", color: .orange),
//        Icon(id: "figure.gymnastics", color: .green),
//        Icon(id: "figure.indoor.cycle", color: .blue),
//        Icon(id: "figure.outdoor.cycle", color: .purple),
//        Icon(id: "figure.rower", color: .indigo),
//    ]
//
//    @Namespace var animation
//    @State private var selected: Icon?
//    var body: some View {
//        LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: 300))]) {
//            ForEach(icons) { icon in
//                Button {
//                    selected = icon
//                } label: {
//                    Image(systemName: icon.id)
//                }
//                .foregroundStyle(icon.color.gradient)
//                .font(.system(size: 100))
//                .matchedTransitionSource(id: icon.id, in: animation)
//            }
//        }
//        .sheet(item: $selected) { icon in
//            Image(systemName: icon.id)
//                .font(.system(size: 300))
//                .foregroundStyle(icon.color.gradient)
//                .navigationTransition(.zoom(sourceID: icon.id, in: animation))
//        }
//    }
    /// That works, but in practice you're going to want to split the source and destination views more cleanly, like this:
    let icons = [
        Icon(id: "figure.badminton", color: .red),
        Icon(id: "figure.fencing", color: .orange),
        Icon(id: "figure.gymnastics", color: .green),
        Icon(id: "figure.indoor.cycle", color: .blue),
        Icon(id: "figure.outdoor.cycle", color: .purple),
        Icon(id: "figure.rower", color: .indigo),
    ]

    @Namespace var animation
    @State private var selected: Icon?
    
    var body: some View {
        LazyVGrid(columns: [.init(.adaptive(minimum: 100, maximum: 300))]) {
            ForEach(icons) { icon in
                Button {
                    selected = icon
                } label: {
                    Image(systemName: icon.id)
                }
                .foregroundStyle(icon.color.gradient)
                .font(.system(size: 100))
                .matchedTransitionSource(id: icon.id, in: animation)
            }
        }
        .sheet(item: $selected) { icon in
            DestinationView(icon: icon, animation: animation)
        }
    }
}

struct DestinationView: View {
    var icon: Icon
    var animation: Namespace.ID

    var body: some View {
        Image(systemName: icon.id)
            .font(.system(size: 300))
            .foregroundStyle(icon.color.gradient)
            .navigationTransition(.zoom(sourceID: icon.id, in: animation))
    }
}

#Preview {
    CreateZoomAnimationsVetweenViews()
}
