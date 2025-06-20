//
//  LoadARemoteImage.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 16/06/25.
//

import SwiftUI

struct LoadARemoteImage: View {
    var body: some View {
        VStack {
            Text("How to load a remote image from a URL")
            
            List {
                Section {
                    AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"))
                }
                
                Section {
                    AsyncImage(url: URL(string: "https://hws.dev/paul2.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 128, height: 128)
                    .clipShape(.rect(cornerRadius: 25))
                }
                
                Section {
                    AsyncImage(url: URL(string: "https://hws.dev/paul.jpg"), scale: 2)
                }
                
                Section {
                    AsyncImage(url: URL(string: "https://hws.dev/paul3.jpg")) { phase in
                                switch phase {
                                case .failure:
                                    Image(systemName: "photo")
                                        .font(.largeTitle)
                                case .success(let image):
                                    image
                                        .resizable()
                                default:
                                    ProgressView()
                                }
                            }
                            .frame(width: 256, height: 256)
                            .clipShape(.rect(cornerRadius: 25))
                }
            }
        }
    }
}

#Preview {
    LoadARemoteImage()
}
