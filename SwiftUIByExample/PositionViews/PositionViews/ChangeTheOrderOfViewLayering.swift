//
//  ChangeTheOrderOfViewLayering.swift
//  ViewLayout
//
//  Created by Virgi Septian on 22/07/25.
//

import SwiftUI

struct ChangeTheOrderOfViewLayering: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.green)
                .frame(width: 50, height: 50)
                .zIndex(1)

            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    ChangeTheOrderOfViewLayering()
}
