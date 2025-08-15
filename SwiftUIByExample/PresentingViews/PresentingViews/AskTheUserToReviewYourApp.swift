//
//  AskTheUserToReviewYourApp.swift
//  PresentingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI
import StoreKit

struct AskTheUserToReviewYourApp: View {
    @Environment(\.requestReview) var requestReview

    var body: some View {
        Button("Review the app") {
            requestReview()
        }
        
        
        /// Important: Apple hasn’t documented this because, well, Apple, but I would imagine this works the same as the older UIKit equivalent where this is a request to show the review dialog – there’s a good chance it will do nothing, because the system doesn’t want to spam the user with messages.
        
        /// So, even though I’ve just shown you a code example using a button, please be much smarter in your own projects: wait until the user has used your app successfully quite a few times so they are happy, then call requestReview() in a way that is not in response to a button press – remember, it might do nothing at all.
    }
}

#Preview {
    AskTheUserToReviewYourApp()
}
