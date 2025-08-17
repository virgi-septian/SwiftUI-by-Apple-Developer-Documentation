//
//  round the corners ofiew.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct RoundTheCornersOfView: View {
    var body: some View {
        Text("Round Me")
        .padding()
        .background(.red)
        .cornerRadius(15)
        
        Text("Round Me")
            .padding()
            .background(.red)
            .clipShape(Capsule())
    }
}


#Preview {
    RoundTheCornersOfView()
}
