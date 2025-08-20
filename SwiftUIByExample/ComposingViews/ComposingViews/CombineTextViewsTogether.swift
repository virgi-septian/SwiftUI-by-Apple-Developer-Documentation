//
//  CombineTextViewsTogether.swift
//  ComposingViews
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct CombineTextViewsTogether: View {
    var body: some View {
        Text("SwiftUI ")
            .font(.largeTitle)
        + Text("is ")
            .font(.headline)
        + Text("awesome")
            .font(.footnote)
    }
}

/// Tip: Combining text views like this is as close as we get to attributed strings in SwiftUI – there is no support for using NSAttributedString at this time.

#Preview {
    CombineTextViewsTogether()
}
