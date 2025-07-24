//
//  Task.swift
//  InterestingUI
//
//  Created by Virgi Septian on 23/07/25.
//

import Foundation

struct TaskActivity: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var status: Status
}

enum Status {
    case todo
    case working
    case completed
}
