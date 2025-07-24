//
//  DetailZoomTransition.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI
import AVKit

struct DetailZoomTransition: View {
    var video: Vidio
    var animation: Namespace.ID
    @Environment(SharedModel.self) private var sharedModel
    /// View Properties
    @State private var hidesThumbnail: Bool = false
    @State private var scrollID: UUID?
    var body: some View {
        GeometryReader {
            let size = $0.size
            Color.black
            ScrollView(.vertical) {
                LazyVStack(spacing: 0) {
                    ForEach(sharedModel.videos) { video in
//                        if let thumbnail = video.thumbnail {
//                            Image(uiImage: thumbnail)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: size.width, height: size.height)
//                                .clipShape(.rect(cornerRadius: 15))
//                        }
                        VideoPlayerView(video: video)
                            .frame(width: size.width, height: size.height)
                        
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollID)
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
            .zIndex(hidesThumbnail ? 1 : 0)

            if let thumbnail = video.thumbnail, !hidesThumbnail {
                Image(uiImage: thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipShape(.rect(cornerRadius: 15))
                    .task {
                        scrollID = video.id
                        try? await Task.sleep(for: .seconds(0.15))
                        hidesThumbnail = true
                    }
            }
        }
        .ignoresSafeArea()
        .navigationTransition(.zoom(sourceID: hidesThumbnail ? scrollID ?? video.id : video.id, in: animation))
    }
}

struct VideoPlayerView: View {
    var video: Vidio
    /// View Properties
    @State private var player: AVPlayer?
    var body: some View {
        CustomVideoPlayerView(player: $player)
            .onAppear {
                // Memastikan player diinisialisasi hanya jika belum ada
                guard player == nil else { return }
                player = AVPlayer(url: video.fileURL)
            }
            .onScrollVisibilityChange { isVisible in
                // Mengontrol pemutaran video berdasarkan visibilitas scroll
                if isVisible {
                    player?.play()
                } else {
                    player?.pause()
                }
            }
            .onGeometryChange(for: Bool.self) { proxy in
                // Mendapatkan posisi Y minimum dari video dalam scroll view
                let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
                // Menghitung tinggi threshold untuk memicu seek
                let height = proxy.size.height * 0.97
                
                // Mengembalikan true jika video sudah melewati ambang batas atas atau bawah
                return -minY > height || minY > height
            } action: { newValue in
                // Jika video melewati ambang batas, seek ke awal (0)
                if newValue {
                    player?.seek(to: .zero)
                }
            }
    }
}

#Preview {
    ZoomTransitions()
}
