//
//  AdjustListRowSeparatorInsets.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct AdjustListRowSeparatorInsets: View {
    var body: some View {
        /// SwiftUI automatically adjusts list row insets so the separator is aligned to the leading edge of your text, but it provides alignment guides called .listRowSeparatorLeading and .listRowSeparatorTrailing so you can customize this if you want.
        
        // For example, you can set the separator’s leading edge to be the leading edge of the whole row, which means the separator will align with all of your content rather than just the text part:
        List(0..<51) { i in
            Label("Row \(i)", systemImage: "\(i).circle")
                .alignmentGuide(.listRowSeparatorLeading) { d in
                    d[.leading]
                }
        }
        
        /// In that example, using 0 rather than d[.leading] should work the same.

        /// Alternatively, you can use a custom value based on what matches your design:
        List(0..<51) { i in
            Label("Row \(i)", systemImage: "\(i).circle")
                .alignmentGuide(.listRowSeparatorLeading) { _ in
                    100
                }
        }
        
        /// You can also customize the trailing edge of the list row separator, either in addition to or in place of the leading row separator inset. For example, this code leaves the leading separator inset alone by aligns the trailing separator inset to the edge of the content, causing the row separator to sit only underneath the row text:
        List(0..<51) { i in
            Label("Row \(i)", systemImage: "\(i).circle")
                .alignmentGuide(.listRowSeparatorTrailing) { d in
                    d[.trailing]
                }
        }
    }
}

#Preview {
    AdjustListRowSeparatorInsets()
}
