//
//  VideoModel.swift
//  InterestingUI
//
//  Created by Virgi Septian on 30/06/25.
//

import SwiftUI

struct Video: Identifiable {
    var id: Int
    var title: String
    var videoURL: String
    var channelName: String
    var channelIcon: String
}

/// MARK: Sample Video List
let videosList: [Video] = [
    .init(id: 0, title: "Ghibli Style Video", videoURL: "https://cdn.pixabay.com/video/2025/04/29/275498_large.mp4", channelName: "Let's Animate", channelIcon: "https://image01.cf.vidu.studio/vidu/template/892858-bQIjSvSP8OJJLSSyn.png"),
    .init(id: 1, title: "Transformer The Last Night", videoURL: "https://cdn.pixabay.com/video/2025/04/29/275498_large.mp4", channelName: "Transformer", channelIcon: "https://image01.cf.vidu.studio/vidu/template/085455-HOITNYBttA3zkHV.png"),
    .init(id: 2, title: "Blossom", videoURL: "https://cdn.pixabay.com/video/2025/04/29/275498_large.mp4", channelName: "Travel With Me", channelIcon: "https://image01.cf.vidu.studio/vidu/template/104002-h2BbfsQjUzqK3iK.png"),
    .init(id: 3, title: "Cat and Dog Bestfriends", videoURL: "https://cdn.pixabay.com/video/2025/04/29/275498_large.mp4", channelName: "Let's Animate", channelIcon: "https://image01.cf.vidu.studio/vidu/template/892858-bQIjSvSP8OJJLSSyn.png"),
    .init(id: 4, title: "Christmas Party", videoURL: "https://cdn.pixabay.com/video/2025/04/29/275498_large.mp4", channelName: "Travel With Me", channelIcon: "https://image01.cf.vidu.studio/vidu/template/104002-h2BbfsQjUzqK3iK.png"),
    .init(id: 5, title: "Ghibli Style Video", videoURL: "https://cdn.pixabay.com/video/2025/04/29/275498_large.mp4", channelName: "Let's Animate", channelIcon: "https://image01.cf.vidu.studio/vidu/template/892858-bQIjSvSP8OJJLSSyn.png")
]
