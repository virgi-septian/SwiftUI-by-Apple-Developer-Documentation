//
//  PositionViewsInAGrid.swift
//  PositionViews
//
//  Created by Virgi Septian on 24/07/25.
//

import SwiftUI

struct PositionViewsInAGrid: View {
    let data = (1...100).map { "Item \($0)" }
    
    let columns3 = [
       GridItem(.fixed(100)),
       GridItem(.flexible()),
    ]

    
    let columns2 = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    let items = 1...50

    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]

    var body: some View {
        /// Using GridItem(.adaptive(minimum: 80)) means we want the grid to fit in as many items per row as possible, using a minimum size of 80 points each.
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 20) {
//                ForEach(data, id: \.self) { item in
//                    Text(item)
//                }
//            }
//            .padding(.horizontal)
//        }
//        .frame(maxHeight: 300)
//        
//        Divider()
        /// If you wanted to control the number of columns you can use .flexible() instead, which also lets you specify how big each item should be but now lets you control how many columns there are. For example, this creates five columns:
        
//        ScrollView {
//            LazyVGrid(columns: columns2, spacing: 20) {
//                ForEach(data, id: \.self) { item in
//                    Text(item)
//                }
//            }
//            .padding(.horizontal)
//        }
//        .frame(maxHeight: 300)
//        
//        Divider()
        /// A third option is to use fixed sizes. For example, this will make the first column be exactly 100 points wide, and allow the second column to fill up all the remaining space:
//        ScrollView {
//            LazyVGrid(columns: columns3, spacing: 20) {
//                ForEach(data, id: \.self) { item in
//                    Text(item)
//                }
//            }
//            .padding(.horizontal)
//        }
//        .frame(maxHeight: 300)
//        Divider()
        /// You can also use LazyHGrid to make a horizontally scrolling grid, which works in much the same way except it accepts rows in its initializer.
        /// For example, we could create 10 side by side heading images that are horizontally scrolling like this:
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(items, id: \.self) { item in
                    Image(systemName: "\(item).circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(height: 150)
        }
        
        //MARK: - If you don't support iOS 13+
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

#Preview {
    PositionViewsInAGrid()
}
