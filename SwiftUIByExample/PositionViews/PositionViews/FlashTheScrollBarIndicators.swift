//
//  FlashTheScrollBarIndicators.swift
//  PositionViews
//
//  Created by Virgi Septian on 25/07/25.
//

import SwiftUI

/// SwiftUI gives us the scrollIndicatorsFlash() modifier to control when the scroll indicators for a ScrollView or List should flash, which is a great way to notify your users that some part of its data has changed. This modifier comes in two forms: whether the indicators should flash when the scroll view appears, or whether they should flash when a value changes.

struct FlashTheScrollBarIndicators: View {
    @State private var exampleState: Bool = false
    var body: some View {
        ScrollView {
            ForEach(0..<50) { i in
                Text("Item \(i)")
                    .frame(maxWidth: .infinity)
            }
        }
        .scrollIndicatorsFlash(onAppear: true)
        
        Divider()
        
        VStack {
            ScrollView {
                ForEach(0..<50) { i in
                    Text("Item \(i)")
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundStyle(.white)
                }
            }
            .scrollIndicatorsFlash(trigger: exampleState)

            Button("Flash!") {
                exampleState.toggle()
            }
        }
    }
}

#Preview {
    FlashTheScrollBarIndicators()
}
