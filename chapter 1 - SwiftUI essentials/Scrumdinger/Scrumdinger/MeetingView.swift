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
                Label("300", systemImage: "hourglass.tophalf.fill")
            }
            VStack(alignment: .trailing) {
                Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                Label("600", systemImage: "hourglass.bottomhalf.fill")
            }
        }
    }
}

#Preview {
    MeetingView()
}
