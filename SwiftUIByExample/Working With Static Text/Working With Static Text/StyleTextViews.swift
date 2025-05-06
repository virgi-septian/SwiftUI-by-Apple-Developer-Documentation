//
//  StyleTextView.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 06/05/25.
//

import SwiftUI

struct StyleTextViews: View {
    var body: some View {
        List {
            Section {
                Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                    .font(.largeTitle)
                    .frame(width: 300)
            }
            
            Section {
                Text("Hello World !")
                    .fontWidth(.condensed)
            }
            
            Section {
                Text("Hello World !")
                    .fontDesign(.monospaced)
            }
            
            Section {
                Text("The best laid plans")
                    .padding()
                    .font(.headline)
                    .background(.yellow)
                    .foregroundStyle(.blue.gradient)
            }
            
            Section {
                Text("This is an extremely long text string that will never fit even the widest of phones without wrapping")
                    .lineSpacing(50)
                    .font(.largeTitle)
                    .frame(width: 300)
            }
            
            
        }
        
        
    }
}

#Preview {
    StyleTextViews()
}
