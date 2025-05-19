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
                Image("diamond")
                    .resizable()
                    .frame(height: 200)
            }
            
            Section {
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
            
            Section {
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250)
            }
        }
    }
}

#Preview {
    AdjustTheWayAnImage()
}
