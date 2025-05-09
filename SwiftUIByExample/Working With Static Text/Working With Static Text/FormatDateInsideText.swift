//
//  FormatDateInsideText.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 09/05/25.
//

import SwiftUI

struct FormatDateInsideText: View {
    var body: some View {
        VStack {
            // show just the date
            Text(Date.now.addingTimeInterval(600), style: .date)

            // show just the time
            Text(Date.now.addingTimeInterval(600), style: .time)

            // show the relative distance from now, automatically updating
            Text(Date.now.addingTimeInterval(10), style: .relative)

            // make a timer style, automatically updating
            Text(Date.now.addingTimeInterval(10), style: .timer)
        }
    }
}

#Preview {
    FormatDateInsideText()
}
