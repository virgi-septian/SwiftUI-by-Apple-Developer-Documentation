//
//  GenerateImages.swift
//  ComposingViews
//
//  Created by Virgi Septian on 21/08/25.
//

import SwiftUI
import ImagePlayground

/// When you import ImagePlayground into your project, SwiftUI gains a new imagePlaygroundSheet() modifier that allows us to use generative AI to create images based on user input.

/// Important: Image Playgrounds require a physical device, such as an iPhone or an iPad.

/// Using it means adding properties to track an image description string from the user, store whether we're currently showing the image playground UI or not, or to store the URL where the resulting image is.

/// As an example, this code prompts the user to describe an image, shows an image playground on demand, then shows the resulting image below:
struct GenerateImages: View {
    @State private var imageDescription = ""
    @State private var isShowingImagePlayground = false
    @State private var imageURL: URL?
    var body: some View {
        VStack(spacing: 20) {
            TextField("Describe an image", text: $imageDescription)
                .textFieldStyle(.roundedBorder)

            Button("Image Playground", systemImage: "apple.image.playground") {
                isShowingImagePlayground = true
            }

            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Text("(No image)")
            }
        }
        .padding()
        .imagePlaygroundSheet(isPresented: $isShowingImagePlayground, concept: imageDescription) { url in
            if let imageURL {
                try? FileManager.default.removeItem(at: imageURL)
            }

            let newImageURL = URL.documentsDirectory.appending(path: "\(UUID()).png")
            try? FileManager.default.moveItem(at: url, to: newImageURL)
            imageURL = newImageURL
        }
    }
}

/// Tip: Assigning new image names each time ensures the UI updates correctly.

/// imagePlaygroundSheet() hands us a URL on successful completion, which will point to a temporary location where the file is. It's important that you move that file somewhere else for long-term storage.

/// In iOS 18.4 and later there are two modifiers that adjust the way image playgrounds function:

/// The imagePlaygroundPersonalizationPolicy() modifier lets you stop users from personalizing their images using privacy-sensitive information – they can't bring in a photo of themselves, for example.
/// The imagePlaygroundGenerationStyle() modifier lets you adjust the way the image is drawn. For example, you might prefer a more realistic sketch style.
/// Both of these must be applied after the imagePlaygroundSheet() modifier, otherwise they'll silently do nothing.
                                                                                                                        
#Preview {
    GenerateImages()
}
