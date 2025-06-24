//
//  ProfileScrollTabView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/06/25.
//

import SwiftUI

struct ProfileScrollTabView: View {
    var body: some View {
        HeaderPageScrollTabView(displaysSymbols: false) {
            RoundedRectangle(cornerRadius: 30)
                .fill(.blue.gradient)
                .frame(height: 350)
                .padding(15)
        } labels: {
            PageLabel(title: "Posts", symbolImage: "square.grid.3x3.fill")
            PageLabel(title: "Reels", symbolImage: "photo.stack.fill")
            PageLabel(title: "Tagged", symbolImage: "person.crop.rectangle")
        } pages: {
            /// Each View Represents Individual Tab View!
            DummyView(.red, count: 50)
            DummyView(.green, count: 30)
            DummyView(.yellow, count: 40)
        } onRefresh: {
            print("Refresh Data")
        }
    }
    
    /// Dummy Looping View
    @ViewBuilder
    private func DummyView(_ color: Color, count: Int) -> some View {
        LazyVStack(spacing: 12) {
            ForEach(0..<count, id: \.self) { index in
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.gradient)
                    .frame(height: 45)
            }
        }
        .padding(15)
    }

}

#Preview {
    ProfileScrollTabView()
}
