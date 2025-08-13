//
//  UseProgrammaticNavigationInSwiftUI.swift
//  Navigation
//
//  Created by Virgi Septian on 12/08/25.
//

import SwiftUI

struct UseProgrammaticNavigationInSwiftUI: View {
//    @State private var presentedNumbers = [1, 4, 8]
    @State private var presentedNumbers = [Int]()
    @State private var navPath = NavigationPath()
    var body: some View {
        /// From iOS 16 and later, we can pass an array of Hashable data directly to the NavigationStack to control which data is currently on the stack. For example, this tracks numbers being presented, and starts by immediately pushing 1, 4, and 8 onto the stack:
//        NavigationStack(path: $presentedNumbers) {
//            List(1..<50) { i in
//                NavigationLink(value: i) {
//                    Label("Row \(i)", systemImage: "\(i).circle")
//                }
//            }
//            .navigationDestination(for: Int.self) { i in
//                Text("Detail \(i)")
//            }
//            .navigationTitle("Navigation")
//        }
        
        /// This approach is powerful, because we can at any point modify the navigation stack to push a custom view on there – it’s a simple array, so we can append items, or insert them, remove them, or whatever else we need. In this code sample the path array starts empty, then gets added to over time by using the List or clicking buttons:
//        NavigationStack(path: $presentedNumbers) {
//            List(1..<50) { i in
//                NavigationLink(value: i) {
//                    Label("Row \(i)", systemImage: "\(i).circle")
//                }
//            }
//            .navigationDestination(for: Int.self) { i in
//                VStack {
//                    Text("Detail \(i)")
//
//                    Button("Go to Next") {
//                        presentedNumbers.append(i + 1)
//                    }
//                }
//            }
//            .navigationTitle("Navigation")
//        }
        /// Tip: This means you can restore the full state of an app – including its full navigation state – by serializing your navigation path.
        
        
        /// Using a simple array for your navigation path is fine if you’re only pushing one data type onto your stack, but if you need heterogeneous data to use a special type-erased wrapper called NavigationPath. This can work with any hashable data, so you could add a few strings, a few integers, a few custom structs, etc, and as long as they all conform to Hashable you’re okay.
        NavigationStack(path: $navPath) {
            Button("Jump to random") {
                navPath.append(Int.random(in: 1..<50))
            }

            List(1..<50) { i in
                NavigationLink(value: "Row \(i)") {
                    Label("Row \(i)", systemImage: "\(i).circle")
                }
            }
            .navigationDestination(for: Int.self) { i in
                Text("Int Detail \(i)")
            }
            .navigationDestination(for: String.self) { i in
                Text("String Detail \(i)")
            }
            .navigationTitle("Navigation")
        }
    }
}

#Preview {
    UseProgrammaticNavigationInSwiftUI()
}
