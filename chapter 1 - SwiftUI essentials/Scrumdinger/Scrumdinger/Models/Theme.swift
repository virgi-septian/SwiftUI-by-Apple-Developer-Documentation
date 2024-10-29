//
//  Theme.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 23/10/24.
//

import SwiftUI


enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }
    
    var mainColor: Color {
//        Main color for App Dev: NamedColor(name: "orange", bundle: nil)
//        Color(rawValue)
        switch self {
        case .bubblegum: return .pink
        case .buttercup: return .yellow
        case .indigo: return .indigo
        case .lavender: return .purple
        case .magenta: return .pink
        case .navy: return .blue
        case .orange: return .orange
        case .oxblood: return .red
        case .periwinkle: return .blue
        case .poppy: return .red
        case .purple: return .purple
        case .seafoam: return .green
        case .sky: return .blue
        case .tan: return .brown
        case .teal: return .teal
        case .yellow: return .yellow
        }
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
}

