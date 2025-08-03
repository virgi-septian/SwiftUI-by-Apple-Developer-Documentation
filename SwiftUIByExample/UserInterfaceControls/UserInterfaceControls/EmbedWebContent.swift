//
//  EmbedWebContent.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 03/08/25.
//

import SwiftUI
import WebKit

struct EmbedWebContent: View {
    @State private var page = WebPage()
    
    @State private var page2: WebPage = {
        WebPage(navigationDecider: NavigationDecider())
    }()
    
    /// we could add some custom text to our browser's user agent, so it becomes possible to recognize our app in server logs:
    @State private var page: WebPage = {
        var config = WebPage.Configuration()
        config.applicationNameForUserAgent = "Example User Agent"
        return WebPage(configuration: config)
    }()
    var body: some View {
        WebView(url: URL(string: "https://www.swift.org"))
        
        /// But in practice you'll almost certainly want to use a local instance of @WebPage like this, then tell it to load a starting URL when shown:
        WebView(page)
            .onAppear {
                page.load(URLRequest(url: URL(string: "https://www.swift.org")!))
            }
         
        /// Note: WebView(url:) accepts an optional URL, whereas loading using WebPage means having a non-optional URL wrapped inside of a URLRequest; it's a bit clunky.
        /// Because the WebPage type conforms to Observable, it will update as the user navigates around. For example, we could display the current page's title above the web view like this, and have it change as they follow links:
        VStack {
            Text(page.title)
            WebView(page)
        }
        .onAppear {
            page.load(URLRequest(url: URL(string: "https://www.swift.org")!))
        }
        
        /// We could then use that when creating our web view, ensuring that only pages on Swift.org can be visited until we decide otherwise:
        WebView(page2)
            .onAppear {
                page2.load(URLRequest(url: URL(string: "https://www.swift.org")!))
            }
        
    }
}

/// For even more control, you can also use some of the built-in protocols to customize things like how dialogs are shown or how navigation is handled.

/// As an example, we could make a custom struct that conforms to NavigationDeciding – a protocol that determines whether an embedded web view should be allowed to visit a URL or not.

/// So, we might say the web view can go to any page as long as it's on Swift.org:

struct NavigationDecider: WebPage.NavigationDeciding {
    func decidePolicy(for response: WebPage.NavigationResponse) async -> WKNavigationResponsePolicy {
        if response.response.url?.absoluteString.starts(with: "https://www.swift.org") == true {
            .allow
        } else {
            .cancel
        }
    }
}

#Preview {
    EmbedWebContent()
}

//MARK: - You can do literally everything with this, including calling custom JavaScript – it's a massive win for developers.
