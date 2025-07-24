//
//  ContentRestrictedTextField.swift
//  InterestingUI
//
//  Created by Virgi Septian on 25/06/25.
//

import SwiftUI

struct ContentRestrictedTextField: View {
    @State private var username: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                RestrictedTextField(hint: "i_justine", characters: characters, value: $username) { textfield, errorMessage in
                    ZStack(alignment: .bottomLeading) {
                        let isEmpty = errorMessage.isEmpty
                        
                        textfield
                            /// Custom Styling
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray.opacity(0.2))
                            }
                        
                        if !isEmpty {
                            Text("Username contains invalid \(errorMessage) characters !")
                                .font(.caption2)
                                .foregroundStyle(.gray)
                                .offset(y: 25)
                                .transition(.blurReplace)
                        }
                    }
                    .animation(.smooth, value: errorMessage)
                }
            }
            .padding(15)
            .navigationTitle("Restricted TextField")
        }
    }
    
    var characters: CharacterSet {
        var chars = CharacterSet.letters.inverted
        chars.remove("_")
        return chars
    }
}
