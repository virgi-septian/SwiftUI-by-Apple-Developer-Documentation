//
//  ContentView.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 06/05/25.
//

import SwiftUI

struct StaticLabelWithATextView: View {
    var body: some View {
        VStack {
            List {
                Section {
                    Text("This is some longer text that is limited to a specific range of lines, so anything more than six lines will cause the text to clip.")
                        .lineLimit(3)
        //            line limit 3 or 6
                        .lineLimit(3...6)
                        .frame(width: 200)
                }
                
                Section {
                    Text("This is always two lines")
                        .lineLimit(2, reservesSpace: true)
                }
                
                Section {
                    Text("This is an extremely long string of text that will never fit even the widest of iOS devices even if the user has their Dynamic Type setting as small as is possible, so in theory it should definitely demonstrate truncationMode().")
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
                
            }
            
                
        }
    }
}

#Preview {
    StaticLabelWithATextView()
}
