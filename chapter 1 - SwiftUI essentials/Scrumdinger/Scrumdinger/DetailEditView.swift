//
//  Untitled.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 26/10/24.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeNAme: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengInMinutesAsDouble, in: 5...30, step: 1){
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $scrum.theme)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees){ attendee in
                    Text("\(attendee.name)")
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee Name", text: $newAttendeeNAme)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeNAme)
                            scrum.attendees.append(attendee)
                            newAttendeeNAme = ""    
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add Attendee")
                    }
                    .disabled(newAttendeeNAme.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
