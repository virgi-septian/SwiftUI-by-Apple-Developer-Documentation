//
//  ContentStaggeredView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 31/07/25.
//

import SwiftUI

struct ContentStaggeredView: View {
    @State private var showView: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    Button("Toggle View") {
                        showView.toggle()
                    }
                    
                    let config = StaggeredConfig(
                        offset: .init(width: 0, height: 70),
                        scale: 0.85,
                        scaleAnchor: .center
                    )
                    
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                        StaggeredView(config: config) {
                            if showView {
                                ForEach(1...10, id: \.self) { _ in
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(.black.gradient)
                                        .frame(height: 150)
                                }
                            }
                        }
                    }

                }
                .padding(15)
                /// Make sures that the width of the view stays same even when there is no views are present !
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Staggered View")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            showView = true
        }
    }
    
    /// Dummy View
    @ViewBuilder
    func DummyView() -> some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 45, height: 45)

            VStack(alignment: .leading, spacing: 6) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .padding(.trailing, 20)

                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .padding(.trailing, 140)

                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 10)
            }
        }
        .foregroundStyle(.gray.opacity(0.7).gradient)
    }

}

#Preview {
    ContentStaggeredView()
}
