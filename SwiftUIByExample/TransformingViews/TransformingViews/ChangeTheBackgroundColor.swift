//
//  ChangeTheBackgroundColor.swift
//  TransformingViews
//
//  Created by Virgi Septian on 18/08/25.
//

import SwiftUI

struct ChangeTheBackgroundColor: View {
    @State private var bio = "Describe yourself"
    var body: some View {
        /// Some SwiftUI views have a default background color that overrides whatever you try to apply yourself, but if you use the scrollContentBackground() modifier you can hide that default background and replace it with something else. At the time of writing, this works for List, TextEditor, and Form, so you can remove or change their background colors.
        
        /// For example, this removes the default background for a list and replaces with an indigo color:
        List(0..<100) { i in
            Text("Example \(i)")
        }
        .scrollContentBackground(.hidden)
        .background(.indigo)
                       
        /// And this hides the default background for a TextEditor and replaces it with a gradient:
        TextEditor(text: $bio)
            .scrollContentBackground(.hidden)
            .background(.linearGradient(colors: [.white, .purple], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    ChangeTheBackgroundColor()
}
