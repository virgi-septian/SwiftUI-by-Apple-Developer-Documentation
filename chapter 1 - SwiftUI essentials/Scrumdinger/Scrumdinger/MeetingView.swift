//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 23/10/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
        }
        HStack {
            VStack(alignment: .leading) {
                Text("Second Elapsed")
                    .font(.caption)
                Label("300", systemImage: "hourglass.tophalf.fill")
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                    .font(.caption)
                Label("600", systemImage: "hourglass.bottomhalf.fill")
            }
        }
        Circle()
            .strokeBorder(lineWidth: 24)
        HStack{
            Text("Speaker 1 of 3")
            Spacer()
            Button(action: {}) {
                Image(systemName: "forward.fill")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
