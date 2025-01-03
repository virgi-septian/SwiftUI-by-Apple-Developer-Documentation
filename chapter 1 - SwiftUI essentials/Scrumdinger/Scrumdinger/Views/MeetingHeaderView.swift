//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 28/10/24.
//

import SwiftUI

struct MeetingHeaderView: View {
    var secondElapsed: Int
    var secondRemaining: Int
    let theme : Theme
    private var totalSecond: Int {
        secondElapsed + secondRemaining
    }
    
    private var progress : Double {
        guard totalSecond > 0 else { return 0 }
        return Double(secondElapsed) / Double(totalSecond)
    }
    
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(secondElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Second Remaining")
                        .font(.caption)
                    Label("\(secondRemaining)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondElapsed: 60, secondRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
