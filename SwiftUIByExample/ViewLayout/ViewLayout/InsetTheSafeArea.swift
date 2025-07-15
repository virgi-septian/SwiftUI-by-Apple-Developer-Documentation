//
//  InsetTheSafeArea.swift
//  ViewLayout
//
//  Created by Virgi Septian on 15/07/25.
//

import SwiftUI

struct InsetTheSafeArea: View {
    var body: some View {
//        NavigationStack {
//            List(0..<100) { i in
//                Text("Row \(i)")
//            }
//            .navigationTitle("Select a row")
//            .safeAreaInset(edge: .bottom) {
//                Text("Outside Safe Area")
//                    .font(.largeTitle)
//                    .foregroundStyle(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(.indigo)
//            }
//        }
        
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Select a row")
            .safeAreaInset(edge: .bottom, alignment: .trailing) {
                Button {
                    print("Show help")
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .symbolRenderingMode(.multicolor)
                        .padding(.trailing)
                }
                .accessibilityLabel("Show help")
            }
        }
    }
}

#Preview {
    InsetTheSafeArea()
}
