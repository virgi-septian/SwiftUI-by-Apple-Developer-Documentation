//
//  ConvertASwiftUIViewToAnImage.swift
//  Drawing
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

// An example view to render
struct RenderView: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

//struct ConvertASwiftUIViewToAnImage: View {
//    @State private var text = "Your text here"
//    @State private var renderedImage = Image(systemName: "photo")
//    @Environment(\.displayScale) var displayScale
//    var body: some View {
//        ///  uses @MainActor to ensure the rendering code is safe to call, carves out the view to render into its own struct, and then lets users share the result using ShareLink:
//        VStack {
//            renderedImage
//
//            ShareLink("Export", item: renderedImage, preview: SharePreview(Text("Shared image"), image: renderedImage))
//
//            TextField("Enter some text", text: $text)
//                .textFieldStyle(.roundedBorder)
//                .padding()
//        }
//        .onChange(of: text) { _ in render() }
//        .onAppear { render() }
//    }
//    
//    @MainActor func render() {
//        let renderer = ImageRenderer(content: RenderView(text: text))
//
//        // make sure and use the correct display scale for this device
//        renderer.scale = displayScale
//
//        if let uiImage = renderer.uiImage {
//            renderedImage = Image(uiImage: uiImage)
//        }
//    }
//}


/// If you need to target iOS 15 and below, then SwiftUI’s views don’t have a built-in function to render a view as an image – we need to write one ourselves. The key here is to wrap the view using UIHostingController, then render its view hierarchy into a UIGraphicsImageRenderer.

/// This is best done using an extension on View, so you can call it naturally. This should wrap the view in a hosting controller, adjust the size of the hosting controller’s view to be the intrinsic content size of the SwiftUI view, clear any background color to keep the rendered image clean, then render the view into an image and send it back.
extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view

        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}

/// To use that extension in SwiftUI, you should create your view as a property so you can reference it on demand – for example, in response to a button action.
struct ConvertASwiftUIViewToAnImage: View {
    var textView: some View {
        Text("Hello, SwiftUI")
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }

    var body: some View {
        VStack {
            textView

            Button("Save to image") {
                let image = textView.snapshot()

                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }
    }
}
/// Important: In order to call UIImageWriteToSavedPhotosAlbum() you must add the NSPhotoLibraryAddUsageDescription key to your Info.plist and explain to the user why you want to write images. If you fail to do this your app will crash when you attempt to write out the image.

#Preview {
    ConvertASwiftUIViewToAnImage()
}
