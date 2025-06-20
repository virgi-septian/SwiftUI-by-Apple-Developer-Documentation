//
//  PlayMoviesWithVideoPlayer.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 13/06/25.
//

import SwiftUI
import AVKit

struct PlayMoviesWithVideoPlayer: View {
    var body: some View {
        VStack {
            Text("How to play movies with VideoPlayer")
            
            //            if you had video.mp4 in your app bundle and wanted to play it back, you’d use this:
            VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video", withExtension: "mp4")!))
                .frame(height: 400)
                .padding(.bottom, 10)
            
            
            //                For example, this places the text “Watermark” at the very top of the video area:
            VideoPlayer(player: AVPlayer(url:  URL(string: "https://cdn.pixabay.com/video/2021/07/14/81496-576306063_large.mp4")!)) {
                VStack {
                    Text("Watermark")
                        .foregroundStyle(.black)
                        .background(.white.opacity(0.7))
                    Spacer()
                }
                .frame(width: 400, height: 300)
            }
            
        }
    }
}

#Preview {
    PlayMoviesWithVideoPlayer()
}
