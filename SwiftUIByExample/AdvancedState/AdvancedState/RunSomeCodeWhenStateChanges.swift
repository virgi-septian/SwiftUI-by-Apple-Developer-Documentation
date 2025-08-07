//
//  RunSomeCodeWhenStateChanges.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

/// SwiftUI lets us attach an onChange() modifier to any view, which will run code of our choosing when some state changes in our program. This is important, because we can’t always use property observers like didSet with something like @State.

/// Important: This behavior is changing in iOS 17 and later, with the older behavior being deprecated.

struct RunSomeCodeWhenStateChanges: View {
    @State private var name = ""
    var body: some View {
        /// If you need to target iOS 16 and earlier, onChange() accepts one parameter and sends its new value into a closure of your choosing. For example, this will print name changes as they are typed:
//        TextField("Enter your name:", text: $name)
//            .textFieldStyle(.roundedBorder)
//            .onChange(of: name) { newValue in
//                print("Name changed to \(name)!")
//            }
        
        /// iOS 17 also provides two other variants: one that accepts a closure with two parameters (one for the old value and one for the new value), and one that determines whether your action function should be run when your view is first shown.
//        TextField("Enter your name", text: $name)
//            .onChange(of: name) { oldValue, newValue in
//                print("Changing from \(oldValue) to \(newValue)")
//            }
        
        /// This prints a simple message when the value changes, but by adding initial: true also triggers the action closure when the view is shown:
//        TextField("Enter your name", text: $name)
//            /// Using initial: true is a really helpful way to consolidate functionality – rather than having to do some work in onAppear() and onChange(), you can do it all in one pass.
//            .onChange(of: name, initial: true) {
//                print("Name is now \(name)")
//            }
        
        /// You might prefer to add a custom extension to Binding so that I attach observing code directly to the binding rather than to the view – it lets me place the observer next to the thing it’s observing, rather than having lots of onChange() modifiers attached elsewhere in my view.
        TextField("Enter your name:", text: $name.onChange(nameChanged))
                    .textFieldStyle(.roundedBorder)
    }
    func nameChanged(to value: String) {
       print("Name changed to \(name)!")
   }
}

extension Binding {
    @MainActor
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

#Preview {
    RunSomeCodeWhenStateChanges()
}
