//
//  PositionAndStyleSubviewsThatComeFromADifferentBiew.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

/// SwiftUI’s Group and ForEach views have initializers that let us read one view or view builder, then place the resulting subviews by hand. This is perfect when you want to position views manually without having to create a completely custom layout.
///
struct HeadlinesView: View {
    var body: some View {
        Text("Coming soon: Xcode on Apple Watch")
        Text("Apple announces Swift-compatible toaster")
        Text("Xcode predicts errors before you make them")
        Text("Apple Intelligence gains sentience, demands a vacation")
        Text("Swift concurrency made simple")
    }
}

/// They don't have any layout attached to them – they aren't wrapped in a VStack, for example. As a result, we can use Group(subviews:) to read all the text views inside HeadlinesView, adjusting each one by hand.
struct PositionAndStyleSubviewsThatComeFromADifferentView: View {
    var body: some View {
//        Group(subviews: HeadlinesView()) { collection in
//            if let firstView = collection.first {
//                firstView
//                    .font(.title)
//            }
//
//            ForEach(collection.dropFirst()) { item in
//                item
//            }
//        }
        
        /// You can add whatever positioning or styling information you want. For example, we could show all headline views at the same size, and instead cycle through background colors:
//        VStack {
//            Text("Latest News")
//                .font(.largeTitle.bold())
//
//            Group(subviews: HeadlinesView()) { collection in
//                ForEach(collection.indices, id: \.self) { index in
//                    collection[index]
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical)
//                        .background(Color(hue: Double(index) / Double(collection.count), saturation: 1, brightness: 1))
//                }
//            }
//        }
        
        /// If you need more complex layouts, you can use SwiftUI's existing Section view to break things up. These can be read using Group(sections:) or ForEach(sections:), allowing you to style section headers and section contents differently as needed.
//        ForEach(sections: SectionedHeadlinesView()) { section in
//            section.header
//                .font(.title)
//                .fontWeight(.black)
//
//            ForEach(section.content) { item in
//                item
//            }
//        }
        
        
        
        /// For complete customization, it's possible to attach custom values for your contained views, having them flow upward to their container. This is similar to SwiftUI's preferences system, except the value doesn't contain flowing upwards past their direct container.
        
        /// To do this, first we need to create a new ContainerValue value that will hold the name we're trying to adjust and a default value. We'll make our headlines show icons next to them, by adding a new entry for the icon then adjusting our headlines so that each piece of text provides a container value for its icon:
        VStack {
            Text("Latest News")
                .font(.largeTitle.bold())

            Group(subviews: IconHeadlinesView()) { collection in
                ForEach(collection) { item in
                    HStack {
                        Image(systemName: item.containerValues.icon)
                        item
                    }
                }
            }
        }
    }
}

struct SectionedHeadlinesView: View {
    var body: some View {
        Section("Possible") {
            Text("Coming soon: Xcode on Apple Watch")
            Text("Apple announces Swift-compatible toaster")
        }

        Section("Probable") {
            Text("Xcode predicts errors before you make them")
            Text("Apple Intelligence gains sentience, demands a vacation")
        }

        Section("Preposterous") {
            Text("Swift concurrency made simple")
            Text("Debugging Swift code works first time")
        }
    }
}


extension ContainerValues {
    @Entry var icon: String = "photo"
}

struct IconHeadlinesView: View {
    var body: some View {
        Text("Coming soon: Xcode on Apple Watch")
            .containerValue(\.icon, "applewatch")
        Text("Apple announces Swift-compatible toaster")
            .containerValue(\.icon, "swift")
        Text("Xcode predicts errors before you make them")
            .containerValue(\.icon, "exclamationmark.triangle")
        Text("Apple Intelligence gains sentience, demands a vacation")
            .containerValue(\.icon, "apple.logo")
        Text("Swift concurrency made simple")
            .containerValue(\.icon, "sparkles")
        /// Tip: You could make that .containerValue(\.icon, "xyz") call into a little View extension for easier calling.

    }
}


#Preview {
    PositionAndStyleSubviewsThatComeFromADifferentView()
}
