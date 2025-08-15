//
//  AdjustThePositionOfAView.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct AdjustThePositionOfAView: View {
    var body: some View {
        List {
            Section {
                /// Important: Using offset() will cause a view to be moved relative to its natural position, but won’t affect the position of other views or any other modifiers placed after the offset. This means you need to think carefully how you use it, not least to make sure views don’t overlap if that wasn’t your intention.
                VStack {
                    Text("Home")
                    Text("Options")
                        .offset(y: 15)
                    Text("Help")
                }
            }
            
            Section {
                /// this will move the second item down by 15 points, but add 15 points of padding to its bottom edge so that it doesn’t overlap the text view below:
                VStack {
                    Text("Home")
                    Text("Options")
                        .offset(y: 15)
                        .padding(.bottom, 15)
                    Text("Help")
                }
            }
            
            Section {
                ///  any modifiers placed after offset() won’t be affected by the change in position, which might cause unexpected results. In this following example, I’ve used background() both before and after the offset, so you can see how they are different:
                Text("Before")
                        .background(.red)
                        .offset(y: 15)

                Text("After")
                    .offset(y: 15)
                    .background(.red)
            }
            
            Section {
                /// if we have a ZStack showing a photo along with the name of the photographer, we might use .bottomTrailing alignment to make the image take up all the available space while having the credit line sit in the bottom-right corner, then use offset(x: -5, y: -5) to pull the credit line back by five points:
                ZStack(alignment: .bottomTrailing) {
                    Image(.pic1)
                        .resizable()
                        .frame(width: 300, height: 500)
                    Text("Photo credit: v.")
                        .padding(4)
                        .background(.black)
                        .foregroundStyle(.white)
                        .offset(x: -5, y: -5)
                }
                /// Placing the offset at the end of the other modifiers ensures they all move together.
            }
        }
    }
}

#Preview {
    AdjustThePositionOfAView()
}
