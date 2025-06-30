//
//  YTThumnailPreview.swift
//  InterestingUI
//
//  Created by Virgi Septian on 30/06/25.
//

import SwiftUI
import AVKit
import AVFoundation


struct HomeView: View {
    @State private var currentActiveId: Int? = nil

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(videosList) { video in
                    VideoThumbnailView(video: video, activeId: $currentActiveId)
                }
            }
            .scrollTargetLayout()
        }
        .onAppear() {
            currentActiveId = videosList.first?.id
        }
        .onScrollTargetVisibilityChange(idType: Int.self, { visibleVideos in
            if let firstVisible = visibleVideos.first {
                currentActiveId = firstVisible
            }
        })
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeView()
}

// MARK: Video Thumbnail View
struct VideoThumbnailView: View {
    let video: Video
    @Binding var activeId: Int?
    @State private var player: AVQueuePlayer? = nil
    @State private var looper: AVPlayerLooper? = nil
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .aspectRatio(16/9, contentMode: .fill)
                .clipped()
                .onAppear {
                    guard player == nil else { return }
                    
                    let item = AVPlayerItem(url: URL(string: video.videoURL)!)
                    let queuePlayer = AVQueuePlayer()
                    
                    looper = AVPlayerLooper(player: queuePlayer, templateItem: item)
                    queuePlayer.isMuted = true
                    player = queuePlayer
                }
                .onDisappear {
                    player?.pause()
                    player = nil
                    looper = nil
                }
                .onChange(of: activeId) { oldActiveId, newActiveId in
                    if newActiveId == video.id {
                        player?.play()
                    } else {
                        player?.pause()
                    }
                }
            
            HStack {
                AsyncImage(url: URL(string: video.channelIcon)) {_ in }
                placeholder: {}
                
                VStack(alignment: .leading) {
                    Text(video.title)
                        .font(.headline)
                        .foregroundStyle(.black)
                    Text(video.channelName)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
    }
}
