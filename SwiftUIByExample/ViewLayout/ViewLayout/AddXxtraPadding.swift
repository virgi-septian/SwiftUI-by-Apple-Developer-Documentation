//
//  AddXxtraPadding.swift
//  ViewLayout
//
//  Created by Virgi Septian on 19/07/25.
//

import SwiftUI

struct AddXxtraPadding: View {
    var body: some View {
        //MARK: -  here’a simple example that draws a red circle to fill all the safe area, minus 50 points on each side:
//        Circle()
//            .fill(.red)
//            .safeAreaPadding(50)
        
        //MARK: - request only some edges by adding a second parameter, like this:
//        Circle()
//            .fill(.red)
//            .safeAreaPadding(.horizontal, 50)
        
        //MARK: - for complete control, you can pass in an EdgeInsets object to get exact insets on all four edges:
//        Circle()
//            .fill(.red)
//            .safeAreaPadding(.init(top: 20, leading: 50, bottom: 20, trailing: 50))
        
        //MARK: - Things get more interesting when we apply safeAreaPadding() to a ScrollView, because it ensures our content starts away from the screen edge but still scrolls next to it:
        ScrollView(.horizontal) {
            HStack {
                ForEach(0..<10) { i in
                    Circle()
                        .frame(width: 50, height: 50)
                }
            }
        }
        .safeAreaPadding(50)
    }
}

#Preview {
    AddXxtraPadding()
}
