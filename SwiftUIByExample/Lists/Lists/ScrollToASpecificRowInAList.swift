//
//  crollToASpecificRowInAList.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct ScrollToASpecificRowInAList: View {
    var body: some View {
        /// For example, this creates 100 rows in a list, and when you press the button it will scroll directly to the row with ID 50:
        ScrollViewReader { proxy in
            Button("Jump to 50") {
//                proxy.scrollTo(2)
                /// For more control over your scroll behavior, add an anchor as the second parameter.
                withAnimation {
                    proxy.scrollTo(50, anchor: .top)
                }
            }
            
            VStack {
                List(1..<100, id: \.self) { i in
                    Text("index - \(i)")
                        .id(i)
                }
            }
        }
    }
}

#Preview {
    ScrollToASpecificRowInAList()
}
