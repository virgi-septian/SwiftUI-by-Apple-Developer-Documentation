//
//  MarkDownInText.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 15/05/25.
//

import SwiftUI

struct MarkDownInText: View {
    let markdownText: LocalizedStringKey = "* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text."
    var body: some View {
        List {
            Section {
                VStack {
                    Text("This is regular text.")
                    Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
                    Text("~~A strikethrough example~~")
                    Text("`Monospaced works too`")
                    Text("Visit Apple: [click here](https://apple.com)")
                }
            }
            
            Section {
                Text("Visit Apple: [click here](https://apple.com)")
                    .tint(.indigo)
            }
            
            Section {
                Text(markdownText)
            }
        }
    }
}

#Preview {
    MarkDownInText()
}
