//
//  AddVisualRffectBlurs.swift
//  Drawing
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

struct AddVisualRffectBlurs: View {
    var body: some View {
//        ZStack {
//            Rectangle()
//                .ignoresSafeArea()
//            Text("Visit Singapore")
//                .padding()
//                .background(.thinMaterial)
//        }
        
        /// You can adjust the “thickness” of your material – how much of the background content shines through – by using one of several material types. From thinnest to thickest, they are:
//        
//        .ultraThinMaterial
//        .thinMaterial
//        .regularMaterial
//        .thickMaterial
//        .ultraThickMaterial
        
        /// If you’re using the secondary foreground style, SwiftUI automatically adjusts the text color so that it has a vibrant effect and can stand out from the background:
        ZStack {
            Image(.pic1)
        
            Text("Visit Indog")
                .foregroundStyle(.secondary)
                .padding()
                .background(.ultraThinMaterial)
        }
    }
}

#Preview {
    AddVisualRffectBlurs()
}
