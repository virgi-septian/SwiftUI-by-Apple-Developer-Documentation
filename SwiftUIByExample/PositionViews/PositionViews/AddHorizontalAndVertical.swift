//
//  AddHorizontalAndVertical.swift
//  PositionViews
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI

struct AddHorizontalAndVertical: View {
    var body: some View {
        // MARK: - For example, we could create a scroll list of ten text views like this:
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(.red)
                }
            }
        }
        .frame(height: 350)
        
        Divider()
        
        //MARK: - Scroll views are vertical by default, but you can control the axis by passing in .horizontal as the first parameter. So, we could flip our previous example to be horizontal like this:
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(.red)
                }
            }
        }
        
        Divider()
        
        //MARK: - You can specify both axes at the same time using [.horizontal, .vertical].
        /// Finally, you can decide whether to show the scroll indicators as the scroll action happens, like this:
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(.red)
                }
            }
        }
    }
}

#Preview {
    AddHorizontalAndVertical()
}
