//
//  AnimateSFSymbols.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 04/07/25.
//

import SwiftUI

struct AnimateSFSymbols: View {
    @State private var petCount: Double = 0
    var body: some View {
        Button {
                    petCount += 1
                } label: {
                    Label("Pet the Dog", systemImage: "dog")
                }
                .symbolEffect(.bounce, value: petCount)
                .font(.largeTitle)
    }
}
