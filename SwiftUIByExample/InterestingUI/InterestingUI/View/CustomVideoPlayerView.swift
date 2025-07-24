//
//  CustomVideoPlayerView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI
import AVKit

struct CustomVideoPlayerView: UIViewControllerRepresentable {
    @Binding var player: AVPlayer?

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false // Menyembunyikan kontrol pemutaran
        controller.videoGravity = .resizeAspectFill
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player // Memperbarui player saat ada perubahan
    }
}
