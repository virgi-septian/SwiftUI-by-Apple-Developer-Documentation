//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 24/10/24.
//

import SwiftUI


struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List(scrums, id: \.title) { scrum in
            
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
                .onAppear{
                    print("Main color for \(scrum.title): \(scrum.theme.mainColor)")
                }
        }
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
