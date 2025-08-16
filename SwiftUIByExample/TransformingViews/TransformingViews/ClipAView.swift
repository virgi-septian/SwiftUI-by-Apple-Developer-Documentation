//
//  ClipAView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 16/08/25.
//

import SwiftUI

struct ClipAView: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "bolt.fill")
                .foregroundStyle(.white)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(.green)
//                .clipShape(Circle())
                .clipShape(Capsule())
        }
    }
}

#Preview {
    ClipAView()
}
