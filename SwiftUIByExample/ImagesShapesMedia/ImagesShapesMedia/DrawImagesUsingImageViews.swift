//
//  ContentView.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 15/05/25.
//

import SwiftUI

struct DrawImagesUsingImageViews: View {
    var body: some View {
        List {
            Section {
                Image(systemName: "cloud.heavyrain.fill")
                    .font(.largeTitle)
            }
            
            Section {
                Image(uiImage: UIImage(named: "cat")!)
            }
            
            Section {
//                Image(.dog)
                Image("Dog")
            }
        }
    }
}

#Preview {
    DrawImagesUsingImageViews()
}
