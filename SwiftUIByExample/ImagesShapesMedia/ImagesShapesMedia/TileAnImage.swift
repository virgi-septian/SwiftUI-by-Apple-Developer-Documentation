//
//  TileAnImage.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 19/05/25.
//

import SwiftUI

struct TileAnImage: View {
    var body: some View {
        List {
            Section{
                Image("diamond")
                    .resizable(resizingMode: .tile)
            }
            
            Section {
                Image("diamond")
                    .resizable(capInsets: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20), resizingMode: .tile)
            }
        }
    }
}

#Preview {
    TileAnImage()
}
