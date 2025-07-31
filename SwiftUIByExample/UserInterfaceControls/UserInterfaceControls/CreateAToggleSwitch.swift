//
//  CreateAToggleSwitch.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 31/07/25.
//

import SwiftUI

struct CreateAToggleSwitch: View {
    @State private var showGreeting = true
    @State private var isOn = true
    
    
    @State var lists = [
       EmailList(id: "Monthly Updates", isSubscribed: true),
       EmailList(id: "News Flashes", isSubscribed: true),
       EmailList(id: "Special Offers", isSubscribed: true)
   ]
    
    
    
    var body: some View {
        VStack {
            Toggle("Show welcome message", isOn: $showGreeting)

            if showGreeting {
                Text("Hello World!")
            }
        }
        
        Divider()
        
        VStack {
            Toggle("Show welcome message", isOn: $showGreeting)
                .toggleStyle(SwitchToggleStyle(tint: .red))

            if showGreeting {
                Text("Hello World!")
            }
        }
        
        Divider()
        
        Toggle("Filter", isOn: $isOn)
            .toggleStyle(.button)
            .tint(.mint)
        
        Divider()
        
        /// From iOS 16 onwards, it’s also possible to bind a Toggle to an array of Booleans, which is helpful for times when you want to enable or disable several values all at once. For example, we could write some code to let the user subscribe to individual newsletters, or have one toggle to switch them all:
        
        Form {
            Section {
                ForEach($lists) { $list in
                    Toggle(list.id, isOn: $list.isSubscribed)
                }
            }

            Section {
                Toggle("Subscribe to all", sources: $lists, isOn: \.isSubscribed)
            }
        }
        
    }
}

struct EmailList: Identifiable {
    var id: String
    var isSubscribed = false
}


#Preview {
    CreateAToggleSwitch()
}
