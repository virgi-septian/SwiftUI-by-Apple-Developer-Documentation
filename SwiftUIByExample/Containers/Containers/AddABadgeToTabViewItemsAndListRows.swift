//
//  AddABadgeToTabViewItemsAndListRows.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct AddABadgeToTabViewItemsAndListRows: View {
    var body: some View {
        TabView {
            Text("Your home screen here")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .badge(5)
        }
        
        List {
            Text("Wi-Fi")
                .badge("LAN Solo")

            Text("Bluetooth")
                .badge(5)
        }
    }
}

#Preview {
    AddABadgeToTabViewItemsAndListRows()
}
