//
//  MakeAScrollViewMoveToALocation.swift
//  PositionViews
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI

struct MakeAScrollViewMoveToALocation: View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        
        //MARK: - For example, this creates 100 colored boxes in a vertical scroll view, and when you press the button it will scroll directly to the box with ID 8:
        
        ScrollViewReader { value in
            ScrollView {
                Button("Jump to #8") {
                    value.scrollTo(8)
                }
                .padding()

                ForEach(0..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        .frame(height: 350)
        
        Divider()
        
        //MARK: - For more control over your scroll, you can specify a second parameter called anchor, to control where your target view should be positioned after the scroll has completed.
        
        ///For example, this will scroll to the same view as before, except this time place that view at the top:
        
        ScrollViewReader { value in
            ScrollView {
                Button("Jump to #8") {
                    withAnimation {
                        value.scrollTo(8, anchor: .top)
                    }
                }
                .padding()

                ForEach(0..<100) { i in
                    Text("Example \(i)")
                        .font(.title)
                        .frame(width: 200, height: 200)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        .frame(height: 350)
        
        /// If you call scrollTo() inside withAnimation() the movement will be animated.
        
    }
}

#Preview {
    MakeAScrollViewMoveToALocation()
}
