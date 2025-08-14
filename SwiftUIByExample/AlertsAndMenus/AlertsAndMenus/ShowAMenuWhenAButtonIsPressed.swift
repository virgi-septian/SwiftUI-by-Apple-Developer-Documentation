//
//  ShowAMenuWhenAButtonIsPressed.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct ShowAMenuWhenAButtonIsPressed: View {
    var body: some View {
        Menu("Options") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Button("Cancel", action: cancelOrder)
        }
        
        /// You can also place menus inside menus if you want, which will cause iOS to reveal the second menu when the first option is tapped:
        Menu("Options") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Menu("Advanced") {
                Button("Rename", action: rename)
                Button("Delay", action: delay)
            }
            Button("Cancel", action: cancelOrder)
        }
        
        /// If you wanted a customized label using some text and an icon, you could use this:
        Menu {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
        } label: {
            Label("Options", systemImage: "paperplane")
        }
        
        /// Finally, in iOS 15 and later menus can also have a primary action, which is triggered when the menu’s button is tapped rather than held down – press and release to trigger the primary action, or hold down to get the full menu of options.
        Menu("Options") {
            Button("Order Now", action: placeOrder)
            Button("Adjust Order", action: adjustOrder)
            Button("Cancel", action: cancelOrder)
        } primaryAction: {
            justDoIt()
        }
    }
    
    func justDoIt(){
        print("Button was tapped")
    }
    
    func placeOrder() { }
    func adjustOrder() { }
    func rename() { }
    func delay() { }
    func cancelOrder() { }
    
}

#Preview {
    ShowAMenuWhenAButtonIsPressed()
}
