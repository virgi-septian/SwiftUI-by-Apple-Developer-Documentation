//
//  ContentView.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct SheetView: View {
    /// Important: If you’re targeting iOS 14 or below, you should use @Environment(\.presentationMode) var presentationMode and `presentationMode.wrappedValue.dismiss() instead.
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}


struct PresentANewView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        
        ///Tip: If you don’t want your sheet to be dismissible by dragging downwards on iOS, use the fullScreenCover() modifier instead.
        .fullScreenCover(isPresented: $showingSheet) {
            SheetView()
        }
//        .sheet(isPresented: $showingSheet) {
//            SheetView()
//        }
        
    }
}

#Preview {
    PresentANewView()
}
