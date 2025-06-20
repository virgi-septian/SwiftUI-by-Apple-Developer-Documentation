//
//  Post.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/06/25.
//

import Foundation

struct Post: Identifiable {
    var id: UUID = .init()
    var author: String
    var title: String
    var image: String
    var url: String
}

var posts: [Post] = [
    .init(
        author: "iJustine",
        title: "First look at the M3 MacBook Air 👀",
        image: "profile",
        url: "profile"
    ),
    .init(
        author: "iJustine",
        title: "Apple Vision Pro – Unboxing, Review and demos!",
        image: "profile",
        url: "profile"
    ),
    .init(
        author: "Joseba Garcia Moya",
        title: "Rabbit on Grass",
        image: "profile",
        url: "profile"
    ),
    .init(
        author: "Toa Heftiba Șinca",
        title: "Photograph of a Wall With Grafitti",
        image: "profile",
        url: "profile"
    )
]
