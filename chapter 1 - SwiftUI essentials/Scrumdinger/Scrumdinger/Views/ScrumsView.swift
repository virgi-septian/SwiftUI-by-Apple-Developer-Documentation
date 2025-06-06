//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Virgi Septian on 24/10/24.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: ()->Void

    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    List($scrums) { $scrum in
                        NavigationLink(destination: DetailView(scrum: $scrum)) {
                            CardView(scrum: scrum)
                        }
                        .listRowBackground(scrum.theme.mainColor)
                    }
                    .navigationTitle("Daily Scrums")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                isPresentingNewScrumView = true
                            }) {
                                Image(systemName: "plus")
                            }
                            .accessibilityLabel("New Scrum")
                        }
                    }
                }
            } else {
                NavigationView {
                    List($scrums) { $scrum in
                        NavigationLink(destination: DetailView(scrum: $scrum)) {
                            CardView(scrum: scrum)
                        }
                        .listRowBackground(scrum.theme.mainColor)
                    }
                    .navigationTitle("Daily Scrums")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                isPresentingNewScrumView = true
                            }) {
                                Image(systemName: "plus")
                            }
                            .accessibilityLabel("New Scrum")
                        }
                    }
                }
            }
        }
        
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
