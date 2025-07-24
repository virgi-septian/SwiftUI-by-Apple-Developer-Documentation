//
//  LazyLoadViews.swift
//  PositionViews
//
//  Created by Virgi Septian on 24/07/25.
//

import SwiftUI

struct SampleRow: View {
    let id: Int

    var body: some View {
        Text("Row \(id)")
    }

    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}

struct LazyLoadViews: View {
    var body: some View {
        ScrollView {
//            LazyVStack {
//                ForEach(0..<1000, id: \.self) { index in
//                    Text("\(index)")
//                        .frame(width: 200, height: 50)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                }
//            }
            VStack {
                ForEach(1...100, id: \.self, content: SampleRow.init)
            }
        }
    }
}

#Preview {
    LazyLoadViews()
}
