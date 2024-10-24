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
        Text("Hello World!")
    }
}

#Preview {
    NavigationStack{
        DetailView(scrum: DailyScrum.sampleData[0])
    }
    
}
