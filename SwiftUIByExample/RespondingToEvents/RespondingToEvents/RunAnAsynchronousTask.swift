//
//  RunAnAsynchronousTask.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 05/08/25.
//

import SwiftUI

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let text: String
}

struct RunAnAsynchronousTask: View {
    @State private var messages = [Message]()

//    var body: some View {
//        NavigationStack {
//            List(messages) { message in
//                VStack(alignment: .leading) {
//                    Text(message.from)
//                        .font(.headline)
//                    Text(message.text)
//                }
//            }
//            .navigationTitle("Inbox")
//        }
//        .task {
//            do {
//                let url = URL(string: "https://www.hackingwithswift.com/samples/messages.json")!
//                let (data, _) = try await URLSession.shared.data(from: url)
//                messages = try JSONDecoder().decode([Message].self, from: data)
//            } catch {
//                messages = []
//            }
//        }
//    }
    
    let sites = ["Apple.com", "HackingWithSwift.com", "Swift.org"]

    var body: some View {
        NavigationStack {
            List(sites, id: \.self) { site in
                NavigationLink(site) {
                    SourceViewer(site: site)
                }
            }
            .navigationTitle("View Source")
        }
    }
}

struct SourceViewer: View {
    let site: String
    @State private var sourceCode = "Loading…"

    var body: some View {
        ScrollView {
            Text(sourceCode)
                .font(.system(.body, design: .monospaced))
        }
        .task {
            guard let url = URL(string: "https://\(site)") else {
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
            } catch {
                sourceCode = "Failed to fetch site."
            }
        }
    }
    
    /// Both task() and onAppear() are able to run synchronous functions when you view is shown, so there’s no particular reason to choose one or the other beyond personal taste – there’s a nice balance to having both onAppear() and onDisappear() together.
}

#Preview {
    RunAnAsynchronousTask()
}


/// Tip: By default, Swift tasks created using the task() modifier will run at the highest available priority, but you can pass a custom priority into the modifier if you know the work is less important.
