//
//  AddAnInspectorToAnyView.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI

struct AddAnInspectorToAnyView: View {
    /// SwiftUI’s inspector() modifier lets us add an inspector view anywhere we need it. This works just like Xcode: the inspector slides in on the trailing edge of your UI, and can work alongside NavigationStack or NavigationSplitView as needed.
    
    /// As a simple example, this brings up an inspector view when a button is pressed:
    @State private var isShowingInspector = false

    var body: some View {
        Button("Hello, world!") {
            isShowingInspector.toggle()
        }
        .font(.largeTitle)
        .inspector(isPresented: $isShowingInspector) {
            Text("Inspector View")
        }
    }
}

#Preview {
    AddAnInspectorToAnyView()
}
