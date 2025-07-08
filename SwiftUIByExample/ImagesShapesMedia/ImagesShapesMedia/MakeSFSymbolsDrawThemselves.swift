//
//  MakeSFSymbolsDrawThemselves.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 08/07/25.
//

import SwiftUI

struct MakeSFSymbolsDrawThemselves: View {
    @State private var isSigned = true
    var body: some View {
        VStack {
            Button("Sign This Document") {
                isSigned.toggle()
            }

//            Image(systemName: "signature")
//                .symbolEffect(.drawOn.wholeSymbol, isActive: isSigned)

//            Image(systemName: "signature")
//                .symbolEffect(.drawOn, isActive: isSigned)

//            Image(systemName: "signature")
//                .symbolEffect(.drawOn.individually, isActive: isSigned)
        }
        .font(.largeTitle)
    }
}


#Preview {
    MakeSFSymbolsDrawThemselves()
}
