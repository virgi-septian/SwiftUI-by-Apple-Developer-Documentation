//
//  PresentAFullScreenModalView.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            Button("Dismiss Modal") {
                dismiss()
            }
        }
    }
}

struct PresentAFullScreenModalView: View {
    @State private var isPresented = false

    var body: some View {
        Button("Present!") {
            isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: FullScreenModalView.init)
    }
}

#Preview {
    PresentAFullScreenModalView()
}
