//
//  ImagesAndOtherViewsAsABackgrounds.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 12/06/25.
//

import SwiftUI

struct ImagesAndOtherViewsAsABackgrounds: View {
    var body: some View {
        List {
            Section {
                Text("Hacking with Swift")
                    .font(.system(size: 48))
                    .padding(50)
                    .background(
                        Image("singapore")
                            .resizable()
                    )
            }
            
            Section {
                Text("Hacking with Swift")
                    .font(.largeTitle)
                    .padding()
                    .background(Circle()
                        .fill(.red)
                        .frame(width: 50, height: 50))
            }
            
            Section {
                Text("Hacking with Swift")
                    .font(.largeTitle)
                    .padding()
                    .background(
                        Circle()
                            .fill(.red)
                            .frame(width: 100, height: 100)
                    )
                    .clipped()
            }
        }
    }
}

