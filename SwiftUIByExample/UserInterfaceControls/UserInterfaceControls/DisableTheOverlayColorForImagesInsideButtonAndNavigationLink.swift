//
//  ContentView.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 29/07/25.
//

import SwiftUI

struct DisableTheOverlayColorForImagesInsideButtonAndNavigationLink: View {
    var body: some View {
//        NavigationStack {
//            NavigationLink {
//                Text("Detail view here")
//            } label: {
//                Image("logo")
//                    .renderingMode(.original)
//            }
//        }
//        
//        Divider()
        
        Button {
            // your action here
        } label: {
            Image("logo")
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DisableTheOverlayColorForImagesInsideButtonAndNavigationLink()
}
