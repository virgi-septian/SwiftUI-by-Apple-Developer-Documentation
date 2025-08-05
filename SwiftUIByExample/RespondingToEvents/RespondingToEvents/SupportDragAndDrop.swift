//
//  SupportDragAndDrop.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct SupportDragAndDrop: View {
    @State private var message = "test"
    @State private var image = Image(systemName: "photo")
    @State private var images = [Image]()
    
    let sports = ["figure.badminton", "figure.cricket", "figure.fencing"]
    @State private var dropImage = Image(systemName: "photo")

    var body: some View {
//        Canvas { context, size in
//            let formattedText = Text(message).font(.largeTitle).foregroundStyle(.red)
//            context.draw(formattedText, in: CGRect(origin: .zero, size: size))
//        }
//        .dropDestination(for: String.self) { items, location in
//            message = items.first ?? ""
//            return true
//        }
//        
//        Divider()
        
//        image
//            .resizable()
//            .scaledToFit()
//            .frame(width: 300, height: 300)
//            .dropDestination(for: Data.self) { items, location in
//                guard let item = items.first else { return false }
//                guard let uiImage = UIImage(data: item) else { return false }
//                image = Image(uiImage: uiImage)
//                return true
//            }
//        
//        Divider()
        
        /// Accepting arrays of data – for example letting the user drag multiple images into our – follows the same procedure: using dropDestination(for: Data.self), but now rather than just reading the first item you should use them all.

        /// For example, this shows several pictures in a ScrollView by converting each Data instance into a UIImage, and then into a SwiftUI Image:
        
//        ScrollView {
//            VStack {
//                ForEach(0..<images.count, id: \.self) { i in
//                    images[i]
//                        .resizable()
//                        .scaledToFit()
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//        .dropDestination(for: Data.self) { items, location in
//            images = items.compactMap {
//                UIImage(data: $0).map(Image.init)
//            }
//
//            return true
//        }
        
        /// When you want to add dragging to your views, add the draggable() modifier using whatever Transferable content you want. By default SwiftUI will use the view itself for the drag preview, and if you’re dragging an image from within your app you’ll find you can use the drop type of Image.self rather than having to convert Data to UIImage first.

        /// For example, this shows three different SF Symbols and lets the user drag any of them into the box below:
        
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    /// Important: When you’re dragging an SF Symbol image, SwiftUI will send the image pixel data and not the neatly scalable vector we’re used to. This means dropped Image data won’t respond to things like font() or foregroundStyle() like you might expect.

                    
                    Image(systemName: sport)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.red)
                        .foregroundStyle(.white)
//                        .draggable(Image(systemName: sport))
                    
                        /// If you want to show a custom drag preview, add a trailing closure with some SwiftUI views. For example, this makes a draggable golf image and adds the text “Figure playing golf” next to it:
                        .draggable(Image(systemName: sport)) {
                                Label("Figure \(sport)", systemImage: sport)
                            }
                    
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)

            dropImage
                .frame(width: 150, height: 150)
                .background(.green)
                .foregroundStyle(.white)
                .dropDestination(for: Image.self) { items, location in
                    dropImage = items.first ?? Image(systemName: "photo")
                    return true
                }
        }
    }
}

#Preview {
    SupportDragAndDrop()
}
