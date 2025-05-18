//
//  AdjustTheWayAnImage.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 18/05/25.
//

import SwiftUI

struct AdjustTheWayAnImage: View {
    var body: some View {
        List {
            Section {
                Image("rome")
                    .resizable()
                    .frame(height: 200)
            }
            
            Section {
                Image("rome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
        }
    }
}

#Preview {
    AdjustTheWayAnImage()
}
