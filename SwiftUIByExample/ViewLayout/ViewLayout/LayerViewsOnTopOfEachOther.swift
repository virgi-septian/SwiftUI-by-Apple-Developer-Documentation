//
//  LayerViewsOnTopOfEachOther.swift
//  ViewLayout
//
//  Created by Virgi Septian on 22/07/25.
//


import SwiftUI

struct LayerViewsOnTopOfEachOther: View {
    var body: some View {
//        ZStack {
//            Image("niagara-falls")
//            Text("Hacking with Swift")
//                .font(.largeTitle)
//                .background(.black)
//                .foregroundStyle(.white)
//        }
        ZStack(alignment: .leading) {
            Image("test")
                .resizable()
            Text("Hacking with Swift Dadad")
                .font(.largeTitle)
                .background(.black)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    LayerViewsOnTopOfEachOther()
}
