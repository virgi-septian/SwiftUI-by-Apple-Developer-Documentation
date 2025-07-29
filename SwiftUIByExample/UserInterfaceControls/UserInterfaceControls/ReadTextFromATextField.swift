//
//  ReadTextFromATextField.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 29/07/25.
//

import SwiftUI

struct ReadTextFromATextField: View {
    @State private var name: String = "Tim"

    var body: some View {
        VStack(alignment: .leading) {
            TextField("Name", text: $name)
            Text("Hello, \(name)")
        }
    }
}

#Preview {
    ReadTextFromATextField()
}
