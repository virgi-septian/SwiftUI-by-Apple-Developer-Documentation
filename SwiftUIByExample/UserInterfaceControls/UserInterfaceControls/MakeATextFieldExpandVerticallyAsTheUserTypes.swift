//
//  MakeATextFieldExpandVerticallyAsTheUserTypes.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 31/07/25.
//

import SwiftUI

struct MakeATextFieldExpandVerticallyAsTheUserTypes: View {
    @State private var bio = "About me"

    var body: some View {
        VStack {
//            TextField("Describe yourself", text: $bio, axis: .vertical)
//                .textFieldStyle(.roundedBorder)
//
//            Text(bio)
            
            
            /// You can control how big the TextField can grow by adding a lineLimit() modifier. For example, we might want to say that it should start out as a single line, but allow growth up to a maximum of five lines:
            
//            VStack {
//                TextField("Describe yourself", text: $bio, axis: .vertical)
//                    .textFieldStyle(.roundedBorder)
//                    .lineLimit(5)
//
//                Text(bio)
//            }
//            .padding()
            
            
            
            /// That doesn’t mean the user can’t type more than five lines, only that once the TextField goes beyond that limit it will switch to scrolling rather than growing further.

            /// You can pass a range here if you want, for example using lineLimit(2...5) to mean “always be at least two lines high, but grow up to five.”

            /// You can also use the reservesSpace parameter to lineLimit() so that the view automatically allocates enough space for the maximum size it can have. For example, this creates a TextField that reserves enough layout space to hold up to five lines of text:
            
            VStack {
                TextField("Describe yourself", text: $bio, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5, reservesSpace: false)

                Text(bio)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    MakeATextFieldExpandVerticallyAsTheUserTypes()
}
