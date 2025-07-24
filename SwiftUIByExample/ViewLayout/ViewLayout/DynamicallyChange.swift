//
//  DynamicallyChange.swift
//  ViewLayout
//
//  Created by Virgi Septian on 16/07/25.
//

import SwiftUI

struct DynamicallyChange: View {
//    @Environment(\.horizontalSizeClass) var horizontalSizeClass
//
//    var body: some View {
//        let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
//
//        layout {
//            Image(systemName: "1.circle")
//            Image(systemName: "2.circle")
//            Image(systemName: "3.circle")
//        }
//        .font(.largeTitle)
//    }
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize

    var body: some View {
        let layout = dynamicTypeSize <= .xxxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())

        layout {
            Image(systemName: "1.circle")
            Image(systemName: "2.circle")
            Image(systemName: "2.circle")
            Image(systemName: "2.circle")
            Image(systemName: "3.circle")
        }
        .font(.largeTitle)
    }
    
//    As well as VStackLayout and HStackLayout, you can also use ZStackLayout and GridLayout.
//
//    Tip: Any grid rows that are used in non-grid layouts don’t do anything – they become the same as using Group.
}

#Preview {
    DynamicallyChange()
}
