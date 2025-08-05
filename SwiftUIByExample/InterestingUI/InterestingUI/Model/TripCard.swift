//
//  TripCard.swift
//  InterestingUI
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

/// Model Kartu Trip
struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

var tripCards: [TripCard] = [
    .init(title: "London", subTitle: "England", image: "pic 1"),
    .init(title: "New York", subTitle: "USA", image: "pic 2"),
    .init(title: "Prague", subTitle: "Czech Republic", image: "pic 3"),
]
