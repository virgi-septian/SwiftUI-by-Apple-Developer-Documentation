//
//  PushANewViewOntoANavigationStack.swift
//  Navigation
//
//  Created by Virgi Septian on 12/08/25.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        Text("This is the detail view")
    }
}

struct PushANewViewOntoANavigationStack: View {
    var body: some View {
        /// SwiftUI lets us push any view onto a NavigationStack by using NavigationLink. In its simplest form you can provide this with a string for its title and a destination view as a trailing closure, and NavigationStack will care of pushing the new view on the stack for us along with animation.
        NavigationStack {
            VStack {
                NavigationLink("Show Detail View") {
                    DetailView()
                }
            }
            .navigationTitle("Navigation")
        }
        
        /// If you need more advanced control over the label, pass it as a secondary trailing closure. For example, this uses a Label view rather than a simple string:
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Label("Show Detail View", systemImage: "globe")
                }
                /// SwiftUI will automatically style your links as buttons so users know they are interactive. You can disable this behavior by applying .buttonStyle(.plain) to NavigationLink.
                .buttonStyle(.plain)
            }
            .navigationTitle("Navigation")
        }
    }
}

#Preview {
    PushANewViewOntoANavigationStack()
}
