//
//  VlendViewsTogether.swift
//  TransformingViews
//
//  Created by Virgi Septian on 17/08/25.
//

import SwiftUI

struct BlendViewsTogether: View {
    var body: some View {
        ZStack {
            // Background: Gambar gelap atau berwarna solid
            Image("pic 1")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .blendMode(.screen)
                .clipped()

            // Foreground: Gambar efek cahaya, misalnya light flare
            Image("pic 2")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .blendMode(.screen) // <- Efek blend mode screen
        }
        .frame(width: 300, height: 300)
        .background(Color.black) // agar efek screen lebih terlihat
    }
}

#Preview {
    BlendViewsTogether()
}
