//
//  LetUserSelectText.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 15/05/25.
//

import SwiftUI

struct LetUserSelectText: View {
    var body: some View {
        List {
            Section {
                VStack(spacing: 50) {
                    Text("You can't touch this")

                    Text("Break it down!")
                        .textSelection(.enabled)
                }
            }
            
            Section {
                VStack(spacing: 50) {
                    Text("You can't touch this")
                    Text("Break it down!")
                }
                .textSelection(.enabled)
            }
        }
        
        List(0..<100) { index in
            Text("Row \(index)")
        }
        .textSelection(.enabled)
    }
}

#Preview {
    LetUserSelectText()
}
