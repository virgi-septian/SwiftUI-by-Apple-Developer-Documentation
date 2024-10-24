//
//  DedailView.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 24/10/24.
//

import SwiftUI

struct DetailView: View {
    let scrum : DailyScrum
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                Label("start meeting", systemImage: "timer")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
        }
    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: DailyScrum.sampleData[0])
    }
    
}
