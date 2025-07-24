//
//  Vidio.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/07/25.
//

import SwiftUI

struct Vidio: Identifiable, Hashable {
    var id: UUID = .init()
    var fileURL: URL
    var thumbnail: UIImage?
}

/// Sample Videos
let files = [
    /// Video by Bruno Carper: https://www.pexels.com/video/sunset-over-sea-and-city-11359689/
    URL(filePath: Bundle.main.path(forResource: "Video 1", ofType: "mp4") ?? ""),
    /// Video by Ruvim Miksanskiy: https://www.pexels.com/video/a-rocky-river-in-the-forest-5896379/
    URL(filePath: Bundle.main.path(forResource: "Video 2", ofType: "mp4") ?? ""),
    /// Video by Edouard CHASSAIGNE: https://www.pexels.com/video/sea-foam-coming-to-the-seashore-5085845/
    URL(filePath: Bundle.main.path(forResource: "Video 3", ofType: "mp4") ?? ""),
    /// Video by Trippy Clicker: https://www.pexels.com/video/panning-shot-of-the-sea-at-sunset-6202759/
    URL(filePath: Bundle.main.path(forResource: "Video 4", ofType: "mp4") ?? ""),
    /// Video by Spencer Campbell: https://www.pexels.com/video/slow-motion-footage-of-multnomah-falls-7297870/
    URL(filePath: Bundle.main.path(forResource: "Video 5", ofType: "mp4") ?? ""),
    /// Video by Daniel Ponomarev from Pexels: https://www.pexels.com/video/view-from-flying-airplane-at-sunset-9669392/
    URL(filePath: Bundle.main.path(forResource: "Video 6", ofType: "mp4") ?? "")
].compactMap { Vidio(fileURL: $0) }
