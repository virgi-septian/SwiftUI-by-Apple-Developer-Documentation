//
//  AddInAppPurchasesInSwiftUI.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI
import StoreKit

struct AddInAppPurchasesInSwiftUI: View {
    @State private var showingSignIn = false
    var body: some View {
        /// At its simplest, just add a ProductView with a single product identifier, like this:
//        ProductView(id: "com.hackingwithswift.plus.subscription")
//        
//        Divider()
        
        /// However, in practice you’re likely to want to configure how the product looks, such as adjusting the layout or adding other styling:
//        VStack {
//            Text("Welcome to my store")
//                .font(.title)
//
//            ProductView(id: "com.hackingwithswift.plus.subscription") {
//                Image(systemName: "crown")
//            }
//            .productViewStyle(.compact)
//            .padding()
//        }
//        
//        Divider()
        
        /// If you want to display multiple products at the same time, you can either arrange groups of ProductView instances however you want in a custom UI, or switch over to a StoreView with the list of product IDs you want to display, like this:
//        VStack {
//            Text("Hacking with Swift+")
//                .font(.title)
//
//            StoreView(ids: ["com.hackingwithswift.plus.subscription", "com.hackingwithswift.plus.lifetime"])
//        }
//        
//        Divider()
        
        /// Again, that looks pretty vanilla by default, but it’s configurable with a range of modifiers. For example, you can configure the system to show a “Restore Missing Purchases” button like this:
//        VStack {
//            Text("Hacking with Swift+")
//                .font(.title)
//
//            StoreView(ids: ["com.hackingwithswift.plus.subscription", "com.hackingwithswift.plus.lifetime"])
//                .storeButton(.visible, for: .restorePurchases)
//        }
//        
//        Divider()
        
        /// Where things get really interesting is how we can customize this screen further. For example, we could add buttons for custom sign in, terms of service, and privacy policy, attach screens to display both those things, add a sheet to show when the sign in button is pressed, and adopt a more prominent subscription selection design:
        SubscriptionStoreView(productIDs:  ["com.hackingwithswift.plus.subscription"])
            .storeButton(.visible, for: .restorePurchases, .redeemCode, .policies, .signIn)
            .subscriptionStorePolicyDestination(for: .privacyPolicy) {
                Text("Privacy policy here")
            }
            .subscriptionStorePolicyDestination(for: .termsOfService) {
                Text("Terms of service here")
            }
            .subscriptionStoreSignInAction {
                showingSignIn = true
            }
            .sheet(isPresented: $showingSignIn) {
                Text("Sign in here")
            }
            .subscriptionStoreControlStyle(.prominentPicker)
        /// Tip: Both privacy and terms of service can be provided as URLs rather than custom SwiftUI views.
        
        
        /// For example, this shows a custom marketing header for my subscriptions, placing a blue gradient behind it:
        SubscriptionStoreView(productIDs:  ["com.hackingwithswift.plus.subscription"]) {
            VStack {
                Text("HWS+")
                    .font(.largeTitle)
                    .fontWeight(.black)

                Text("Take your Swift learning to the next level by subscribing to Hacking with Swift+!")
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(.white)
            .containerBackground(.blue.gradient, for: .subscriptionStore)
        }
        .storeButton(.visible, for: .restorePurchases, .redeemCode)
        .subscriptionStoreControlStyle(.prominentPicker)
        /// Note: You can add code to monitor for in-app purchase transactions, but this does not replace a full StoreKit implementation where you monitor them correctly.
        
        
        
        /// In the code below, we print a message when a product starts, then print one of two other messages depending on how the transaction goes:
        ProductView(id: "com.hackingwithswift.plus.subscription") {
            Image(systemName: "crown")
        }
        .productViewStyle(.compact)
        .padding()
        .onInAppPurchaseStart { product in
            print("User has started buying \(product.id)")
        }
        .onInAppPurchaseCompletion { product, result in
            if case .success(.success(let transaction)) = result {
                print("Purchased successfully: \(transaction.signedDate)")
            } else {
                print("Something else happened")
            }
        }
        /// Be careful: that code alone isn’t enough, because one of the possible completion status is pending: the purchase is in the process of happening but hasn’t completed yet, so you still need to watch the transaction queue manually to be absolutely sure of handling the process completely.
    }
}

#Preview {
    AddInAppPurchasesInSwiftUI()
}
