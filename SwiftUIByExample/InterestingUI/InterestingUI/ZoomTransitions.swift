//
//  ZoomTransitions.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI

struct ZoomTransitions: View {
    var sharedModel = SharedModel()
    @Namespace private var animation
    var body: some View {
        @Bindable var bindings = sharedModel
        GeometryReader {
            let screenSize: CGSize = $0.size
            NavigationStack {
                VStack(spacing: 0) {
                    /// Header View
                    HeaderView()
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count:
                            2), spacing: 10) {
                            ForEach($bindings.videos) { $video in
                                /// Card View
                                NavigationLink(value: video) {
                                    CardView2(screenSize: screenSize, video: $video)
                                        .environment(sharedModel)
                                        .frame(height: screenSize.height * 0.4)
                                        .matchedTransitionSource(id: video.id, in:
                                            animation) {
                                            $0
                                                .background(.clear)
                                                .clipShape(.rect(cornerRadius: 15))
                                        }
                                }
                                .buttonStyle(CustomButtonStyle())
                            }
                        }
                        .padding(15)
                    }
                }
                .navigationDestination(for: Vidio.self) { video in
                    DetailZoomTransition(video: video, animation: animation)
                        .environment(sharedModel)
                        .toolbarVisibility(.hidden, for: .navigationBar)
                }
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
            }
            
            Spacer(minLength: 0)
            
            Button {
                
            } label: {
                Image(systemName: "person.fill")
                    .font(.title3)
            }
        }
        .overlay {
            Text("Stories")
                .font(.title3.bold())
        }
        .foregroundStyle(Color.primary)
        .padding(15)
        .background(.ultraThinMaterial)
        
    }
}

struct CardView2: View {
    var screenSize: CGSize
    @Binding var video: Vidio
    @Environment(SharedModel.self) private var sharedModel
    var body: some View {
        GeometryReader {
            let size = $0.size

            if let thumbnail = video.thumbnail {
                Image(uiImage: thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipShape(.rect(cornerRadius: 15))
            } else {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.fill)
                    .task(priority: .high) {
                        await sharedModel.generateThumbnail($video, size: screenSize)
                    }
            }
        }
    }
}

/// Custom button
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

#Preview {
    ZoomTransitions()
}
