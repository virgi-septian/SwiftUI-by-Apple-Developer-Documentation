//
//  Date+Extention.swift
//  InterestingUI
//
//  Created by Virgi Septian on 22/07/25.
//

import SwiftUI

extension Date {
    /// Gives the current week dates
    static var currentWeek: [Day] {
        let calendar = Calendar.current
        guard let firstWeekday = calendar.dateInterval(of: .weekOfMonth, for: .now)?.start else {
            return []
        }

//        var week: [Date] = []
        var week: [Day] = []
        
        for index in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: index, to: firstWeekday) {
//                week.append(day)
                week.append(.init(date: day))
            }
        }
        return week
    }

    /// Convert date to string in the given format
    func string(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    /// Check if both the dates are same
    func isSame(_ date: Date?) -> Bool {
        guard let date else { return false }
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    
    struct Day: Identifiable {
        var id: String = UUID().uuidString
        var date: Date
    }
}
