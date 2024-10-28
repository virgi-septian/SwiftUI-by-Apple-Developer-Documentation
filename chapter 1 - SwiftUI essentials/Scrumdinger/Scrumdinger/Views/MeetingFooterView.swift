//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 28/10/24.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    private var speakerNumer: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
//        speakers.dropLast().reduce(true) { $0 && $1.isCompleted }
    }
    private var speakerText: String {
        guard let speakerNumer = speakerNumer else { return "No more speaker" }
        return "Speaker \(speakerNumer) of \(speakers.count)"
    }
    var body: some View {
        VStack {
            HStack{
                if isLastSpeaker {
                    Text("Last speaker")
                } else {
                    Text("\(speakerText)")
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View{
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
