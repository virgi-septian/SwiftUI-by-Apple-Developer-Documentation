//
//  MultipleImageViewer.swift
//  InterestingUI
//
//  Created by Virgi Septian on 24/07/25.
//

import SwiftUI

struct ImageModel : Identifiable {
    var id: String = UUID().uuidString
    var altText: String
    var link: String
}

let sampleImages: [ImageModel] = [

    .init(
        altText: "No Eid",
        link: "https://images.pexels.com/photos/9002742/pexels-photo-9002742.jpeg?cs=srgb&dl=pexels-mo-eid-1268975-9002742.jpg&fm=jpg&w=640&h=480"
    ),
    .init(
        altText: "Codioful",
        link: "https://images.pexels.com/photos/7135121/pexels-photo-7135121.jpeg?cs=srgb&dl=pexels-codioful--7135121.jpg&fm=jpg&w=640&h=427"
    ),
    .init(
        altText: "Fanny Hagan",
        link: "https://images.pexels.com/photos/19896879/pexels-photo-19896879.jpeg?cs=srgb&dl=pexels-fanny-hagan-842972096-19896879.jpg&fm=jpg&w=640&h=550"
    ),
    .init(
        altText: "Han-Chieh Lee",
        link: "https://images.pexels.com/photos/22944463/pexels-photo-22944463.jpeg?cs=srgb&dl=pexels-han-chieh-lee-1234591379-22944463.jpg&fm=jpg&w=640&h=427"
    ),
    .init(
        altText: "Cottonbro",
        link: "https://images.pexels.com/photos/9669094/pexels-photo-9669094.jpeg?cs=srgb&dl=pexels-cottonbro-9669094.jpg&fm=jpg&w=640&h=950"
    ),
    .init(
        altText: "Gülyah Aydoğan",
        link: "https://images.pexels.com/photos/18873058/pexels-photo-18873058.jpeg?cs=srgb&dl=pexels-gulyah-aydogan-18873058.jpg&fm=jpg&w=640&h=480"
    )
]


struct MultipleImageViewer: View {
    
    var body: some View {
        /// Navigation Stack is must as this use the Zoom Transition API
        NavigationStack {
            VStack {
                ImageViewer(config: .init()) {
                    ForEach(sampleImages) { image in
                        AsyncImage(url: URL(string: image.link)) { image in
                            image
                                .resizable()
                                /// Fit/Fill resize will be done inside the image viewer
                        } placeholder: {
                            Rectangle()
                                .fill(.gray.opacity(0.4))
                                .overlay {
                                    ProgressView()
                                        .tint(.blue)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                        }
                        .containerValue(\.activeViewID, image.id)
                    }
                } overlay: {
                    OverlayView()
                }
                
            }
            .padding(15)
            .navigationTitle("Image Viewer")
        }
    }
}

/// Overlay View
struct OverlayView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(.ultraThinMaterial)
                    .padding(10)
                    .contentShape(.rect)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer(minLength: 0)
        }
        .padding(15)
    }
}

#Preview {
    MultipleImageViewer()
}
