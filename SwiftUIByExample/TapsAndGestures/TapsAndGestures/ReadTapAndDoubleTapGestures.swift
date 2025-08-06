//
//  ReadTapAndDoubleTapGestures.swift
//  TapsAndGestures
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct ReadTapAndDoubleTapGestures: View {
    var body: some View {
        Text("Tap me!")
            .onTapGesture {
                print("Tapped!")
            }
        
        /// creates an image view that will print a message when double tapped:
        Image(.pic2)
            .onTapGesture(count: 2) {
                print("Double Tap")
            }
    }
}

#Preview {
    ReadTapAndDoubleTapGestures()
}
