//
//  addListSectionIndexLabels.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct AddListSectionIndexLabels: View {
    let letters = ["A", "B", "C", "D", "E", "F", "G"]
    
    var body: some View {
        /// SwiftUI's sectionIndexLabel() lets us add index labels to a List, which is the name Apple uses for the tappable table of contents that sits on the trailing edge of lists – you can see it in the Contacts app, for example, where it lets you scrub through the alphabet quickly.
        
        /// To use the modifier, attach it to a Section like this:
        List(letters, id: \.self) { letter in
            Section(letter) {
                ForEach(0..<10) { number in
                    Text("Row \(number)")
                }
            }
            .sectionIndexLabel(letter)
            /// You can choose to show or hide the section titles using the listSectionIndexVisibility() modifier, attached to the whole List:
            .listSectionIndexVisibility(.visible)
        }
        
        /// That will show the section index immediately, letting users move between the letters with a simple swipe.
        
        
    }
}

#Preview {
    AddListSectionIndexLabels()
}
