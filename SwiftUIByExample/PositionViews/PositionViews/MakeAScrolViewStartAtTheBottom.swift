//
//  MakeAScrolViewStartAtTheBottom.swift
//  PositionViews
//
//  Created by Virgi Septian on 25/07/25.
//

import SwiftUI

struct MakeAScrolViewStartAtTheBottom: View {
    var body: some View {
        ScrollView {
            ForEach(1..<30) { i in
                Text(String(i))
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height: 100)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(.rect(cornerRadius: 20))
            }
        }
        .defaultScrollAnchor(.bottom)
    }
}

#Preview {
    MakeAScrolViewStartAtTheBottom()
}
