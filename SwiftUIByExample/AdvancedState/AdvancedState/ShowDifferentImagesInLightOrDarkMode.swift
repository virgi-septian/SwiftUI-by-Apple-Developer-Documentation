//
//  ShowDifferentImagesInLightOrDarkMode.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

struct AdaptiveImage: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

/// if we add a little extra code we can create a wrapper view able to display completely different content depending on light and dark mode:

struct AdaptiveView<T: View, U: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let light: T
    let dark: U

    init(light: T, dark: U) {
        self.light = light
        self.dark = dark
    }

    init(light: () -> T, dark: () -> U) {
        self.light = light()
        self.dark = dark()
    }

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

struct ShowDifferentImagesInLightOrDarkMode: View {
    var body: some View {
        /// That allows you to pass both images in, and SwiftUI will automatically select the correct one for both light and dark mode:
//        AdaptiveImage(light: Image(systemName: "sun.max"), dark: Image(systemName: "moon"))
        
        /// That retains the same simple initializer, but now adds alternatives that accept closures. So, with that more advanced version we can now flip between more complicated layouts:
        VStack {
            AdaptiveView {
                VStack {
                    Text("Light mode")
                    Image(systemName: "sun.max")
                }
            } dark: {
                HStack {
                    Text("Dark mode")
                    Image(systemName: "moon")
                }
            }
            .font(.largeTitle)
        }
    }
}

#Preview {
    ShowDifferentImagesInLightOrDarkMode()
}
