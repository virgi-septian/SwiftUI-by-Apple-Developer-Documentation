//
//  EnablePullToRefresh.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct NewsItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let strap: String
}

struct EnablePullToRefresh: View {
    /// SwiftUI’s refreshable() modifier lets you attach functionality to a List to be triggered when the user drags down far enough. iOS will automatically show an activity indicator for as long as it takes for your code to finish running.
    
    @State private var news = [
           NewsItem(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")
       ]
    @State private var isRefreshing = false
    var body: some View {
        /// To get started, simply add a refreshable() modifier to your list where you do your work, like this:
        NavigationStack {
            List(1..<50) { i in
                Text("Item \((i))")
            }
            .refreshable {
                print("kerefresh kink")
            }
        }
        
        /// The code you place inside refreshable() is already running in an async context, so it’s the perfect place to put something like networking. For example, here’s a complete example that uses pull to refresh to download some news stories into a List:
        NavigationStack {
            List(news) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.strap)
                        .foregroundStyle(.secondary)
                }
            }
            .refreshable {
                isRefreshing.toggle()
            
                do {
                    // Fetch and decode JSON into news items

                    let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    news = try JSONDecoder().decode([NewsItem].self, from: data)
                } catch {
                    // Something went wrong; clear the news
                    news = []
                }
                
//                if isRefreshing == false {
//                    news = []
//                }
            }
        }
    }
}

#Preview {
    EnablePullToRefresh()
}
