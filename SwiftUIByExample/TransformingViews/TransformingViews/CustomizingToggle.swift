//
//  CustomizingToggle.swift
//  TransformingViews
//
//  Created by Virgi Septian on 18/08/25.
//

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(configuration.isOn ? Color.accentColor : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

struct CustomizingToggle: View {
    @State private var isOn = false
    var body: some View {
        /// SwiftUI gives us the ToggleStyle protocol to customize the way Toggle switches look and work. Any struct that conforms to this protocol must implement a makeBody() method that renders the Toggle however you want it, and you’re giving both the label used for the toggle and an isOn binding that you can flip to adjust the toggle.
        
        /// Important: When you customize a Toggle switch like this, it’s down to you to flip the on state yourself somehow – SwiftUI will not do it for you.

        /// To demonstrate custom Toggle styles, here’s one that uses a button to flip the on state, then adds a custom label to show that state. Rather than use a moving circle like the standard iOS Toggle, I’ve made this show one of two SF Symbols:
        
        Toggle("Switch Me", isOn: $isOn)
            .toggleStyle(CheckToggleStyle())

    }
}

#Preview {
    CustomizingToggle()
}
