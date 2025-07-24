//
//  LetUsersSelectPictures.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 02/07/25.
//

import SwiftUI
import PhotosUI

struct LetUsersSelectPictures: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    var body: some View {
        VStack {
            Text("How to let users select pictures using PhotosPicker")
            
            List {
                Section {
                    VStack {
                        PhotosPicker("Select avatar", selection: $avatarItem, matching: .images)

                        avatarImage?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                    .onChange(of: avatarItem) {
                        Task {
                            if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                                avatarImage = loaded
                            } else {
                                print("Failed")
                            }
                        }
                    }
                }
                
                Section {
                    NavigationStack {
                        ScrollView {
                            LazyVStack {
                                ForEach(0..<selectedImages.count, id: \.self) { i in
                                    selectedImages[i]
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300, height: 300)
                                }
                            }
                        }
                        .toolbar {
                            PhotosPicker("Select images", selection: $selectedItems, matching: .images)
                        }
                        .onChange(of: selectedItems) {
                            Task {
                                selectedImages.removeAll()

                                for item in selectedItems {
                                    if let image = try? await item.loadTransferable(type: Image.self) {
                                        selectedImages.append(image)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LetUsersSelectPictures()
}
