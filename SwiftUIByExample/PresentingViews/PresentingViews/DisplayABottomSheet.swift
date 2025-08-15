//
//  DisplayABottomSheet.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct DisplayABottomSheet: View {
    @State private var showingCredits = false
    let heights = stride(from: 0.1, through: 1.0, by: 0.1).map { PresentationDetent.fraction($0) }
    var body: some View {
        /// SwiftUI’s presentationDetents() modifier lets us create sheets that slide up from the bottom of our view, but occupy only part of the screen – how much is down to us, and we have as much or as little control as we want.
        Button("Show Credits") {
           showingCredits.toggle()
       }
       .sheet(isPresented: $showingCredits) {
           Text("This app was brought to you by Hacking with Swift")
//               .presentationDetents([.medium, .large])
    
           /// By supporting both .medium (about half the screen) and .large (all the screen), SwiftUI will create a resize handle to let the user adjust the sheet between those two sizes. If you don’t want that, add presentationDragIndicator(.hidden) to the contents of your sheet, like this:
               .presentationDragIndicator(.hidden)
           
           ///As well as specifying one of the built-in sizes, you can also provide a custom fraction in the range of 0 through 1. For example, this creates a sheet taking up the bottom 15% of the screen:
//               .presentationDetents([.fraction(0.15)])
           
           /// Or you can specify an exact point height like this:
//               .presentationDetents([.height(300)])
           
           /// You can attach as many detents to your views as you need – just add them all to the set of detents, and SwiftUI will take care of the rest. For example, this lets the user go between 10% and 100% in 10% steps:
               .presentationDetents(Set(heights))
       }
    }
}

#Preview {
    DisplayABottomSheet()
}
