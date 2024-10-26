//
//  Untitled.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 26/10/24.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    
    var body: some View {
        Form{
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengInMinutesAsDouble, in: 5...3, step: 1){
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
