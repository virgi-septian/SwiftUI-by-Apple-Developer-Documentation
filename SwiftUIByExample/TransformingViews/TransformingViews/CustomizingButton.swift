//
//  CustomizingButton.swift
//  TransformingViews
//
//  Created by Virgi Septian on 18/08/25.
//

import SwiftUI

struct CustomizingButton: View {
    var body: some View {
        /// SwiftUI has a number of styling protocols that allow us to define common styling for views such as Button, ProgressView, Toggle, and more. They all work by allowing us to centralize any number of modifiers that get a view looking the way we want it, and provide modifiers that let us apply the full set of customizations in a single line.
        Button("Press Me") {
            print("Button pressed!")
        }
        .padding()
        .background(Color(red: 0, green: 0, blue: 0.5))
        .clipShape(Capsule())
        
        
        /// That works fine for a single button, but if that’s the standard button design across your entire app you should consider using a custom button style instead. This means creating a new struct that conforms to the ButtonStyle protocol, which will pass us the button’s configuration to act on however we want.
        
        /// So, we could centralize those three modifiers into a single BlueButton style, then apply it to our button like this:
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(BlueButton())
        
        
        /// we could create a second style that makes the button grow when it’s being pressed down:
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(GrowingButton())
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}

#Preview {
    CustomizingButton()
}
