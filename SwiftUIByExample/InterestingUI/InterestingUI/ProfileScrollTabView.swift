//
//  ProfileScrollTabView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/06/25.
//

import SwiftUI
import Foundation

struct ProfileScrollTabView: View {
    @State private var searchText = ""
    var body: some View {
        HeaderPageScrollTabView(displaysSymbols: false) {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            RoundedRectangle(cornerRadius: 30)
                .fill(.blue.gradient)
                .frame(height: 350)
                .padding(.horizontal, 15)
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



struct InstagramLikeView: View {
    @State private var searchText = ""
    @State private var items = Array(0..<20)

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                
                // 🔍 Search Bar (ikut discroll)
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.top)

                // 🧱 Dummy Content
                ForEach(items, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue.opacity(0.3))
                        .frame(height: 60)
                        .overlay(Text("Item \(index)"))
                        .padding(.horizontal)
                }
            }
            .padding(.bottom)
        }
        .refreshable {
            // ⏳ Loading muncul di bawah Search
            try? await Task.sleep(for: .seconds(5))
            items.shuffle()
        }
    }
}

#Preview {
    ProfileScrollTabView()
}
