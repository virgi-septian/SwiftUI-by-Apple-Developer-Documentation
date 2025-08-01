//
//  CreateASegmentedControl.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct CreateASegmentedControl: View {
    /// creates a segmented control that works with a favoriteColor state property, and adds a text view below that shows whichever value was selected:
    
//    @State private var favoriteColor = 0
    @State private var favoriteColor = "Red"
    var colors: [String] = ["Red", "Green", "Blue"]

    var body: some View {
//        VStack {
//            Picker("What is your favorite color?", selection: $favoriteColor) {
//                Text("Red").tag(0)
//                Text("Green").tag(1)
//                Text("Blue").tag(2)
//            }
//            .pickerStyle(.segmented)
//
//            Text("Value: \(favoriteColor)")
//        }
        
        /// Important: If you’re using Xcode 12 you need to use SegmentedPickerStyle() rather than .segmented.

        /// In this instance, though, it’s better to create an array to store the various colors, then use ForEach to create the text view inside using a loop:
        
        VStack {
            Picker("What is your favorite color?", selection: $favoriteColor) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            Text("\(favoriteColor)")
        }
    }
}

#Preview {
    CreateASegmentedControl()
}
