//
//  ChangeTheTintColorForIndividualListRows.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct ChangeTheTintColorForIndividualListRows: View {
    var body: some View {
        List(1..<51) { i in
            Label("Row \(i)", systemImage: "\(i).circle")
                .listItemTint(i.isMultiple(of: 2) ? .red : .green)
        }
        
        /// exactly what that does depends on the platform:
        
        /// - On iOS that will change the icons to be red and green, but leave the text in its primary color.
        /// - On macOS that will also change the icons to be red and green, overriding the user’s preferred accent color.
        /// - On watchOS that will change the row background color (known as its “background platter”) to be red or green.
        /// - On tvOS it will do nothing at all.
        
        
        /// On macOS, you can respect the user’s accent color while also adding your own preferred list row tint like this:
        List(1..<51) { i in
            Label("Row \(i)", systemImage: "\(i).circle")
                .listItemTint(.preferred(i.isMultiple(of: 2) ? .red : .green))
        }
        /// That will now apply the user’s selected accent color if they have one, but if they have the Multicolor accent set then the rows will be tinted red or green as before.
    }
}

#Preview {
    ChangeTheTintColorForIndividualListRows()
}
