//
//  FormatATextFieldForNumbers.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 31/07/25.
//

import SwiftUI

struct FormatATextFieldForNumbers: View {
//    @State private var score = 0
//
//    var body: some View {
//        VStack {
//            TextField("Enter your score", value: $score, format: .number)
//                .textFieldStyle(.roundedBorder)
//                .padding()
//
//            Text("Your score was \(score).")
//        }
//    }
    
    @State private var score = 0

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        VStack {
            TextField("Enter your score", value: $score, formatter: formatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Your score was \(score).")
        }
    }
}

#Preview {
    FormatATextFieldForNumbers()
}
