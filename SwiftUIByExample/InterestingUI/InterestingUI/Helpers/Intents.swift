//
//  Intents.swift
//  InterestingUI
//
//  Created by Virgi Septian on 19/09/25.
//

import SwiftUI
import AppIntents
import AlarmKit

@available(iOS 26.0, *)
struct AlarmActionIntent: LiveActivityIntent {
    static var title: LocalizedStringResource = "Alarm Action"
    static var isDiscoverable: Bool = false

    @Parameter
    var id: String

    @Parameter
    var isCancel: Bool

    @Parameter
    var isResume: Bool
    
    init(id: UUID, isCancel: Bool = false, isResume: Bool = false) {
        self.id = id.uuidString
        self.isCancel = isCancel
        self.isResume = isResume
    }
    
    init() {
        
    }

    func perform() async throws -> some IntentResult {
        if let alarmID = UUID(uuidString: id) {
            if isCancel {
                try AlarmManager.shared.cancel(id: alarmID)
            } else {
                if isResume {
                    /// Resume Alarm
                    try AlarmManager.shared.resume(id: alarmID)
                    
                } else {
                    /// Cancel Alarm
                    try AlarmManager.shared.pause(id: alarmID)
                    
                }
            }
        }

        return .result()
    }
}
