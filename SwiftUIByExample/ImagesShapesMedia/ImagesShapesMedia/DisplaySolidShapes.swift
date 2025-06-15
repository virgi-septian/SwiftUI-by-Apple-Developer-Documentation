//
//  DisplaySolidShapes.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 12/06/25.
//

import SwiftUI

struct DisplaySolidShapes: View {
    var body: some View {
        List {
            Section {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
            }
            
            Section {
                Circle()
                    .fill(.blue)
                    .frame(width: 100, height: 100)
            }
            
            Section {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.green)
                    .frame(width: 150, height: 100)
            }
            
            Section {
                Capsule()
                    .fill(.green)
                    .frame(width: 150, height: 100)
            }
        }
    }
}

#Preview {
    DisplaySolidShapes()
}
