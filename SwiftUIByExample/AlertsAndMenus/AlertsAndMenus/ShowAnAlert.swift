//
//  ContentView.swift
//  AlertsAndMenus
//
//  Created by Virgi Septian on 14/08/25.
//

import SwiftUI

struct ShowAnAlert: View {
    @State private var showingAlert = false
    @State private var selectedShow: TVShow?
    var body: some View {
        /// Let’s look at the iOS 15 approach first. To show an alert, create some Boolean state that determines whether the alert should be visible, then attach that to an alert() modifier along with all the buttons you want to show in the alert. All buttons dismiss the alert when tapped, so you can provide an empty action for simple dismissal.
        
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
//            Button("OK", role: .cancel) { }
            
            /// /// You can provide as many buttons as you need, and if you provide no buttons then you’ll automatically be given a default “OK” to dismiss the alert. As these are standard SwiftUI buttons, you can assign other roles such as .destructive to have the system style them appropriately.
            Button("OK", role: .destructive) { }
        }
        /// Tip: Presenting an alert like this will automatically set showingAlert back to false when the button is tapped.
        

        
        
        /// If you need to support iOS 14 and 13, you should instead use the dedicated Alert struct, which looks like this:
//        Alert(
//            title: Text("Important message"),
//            message: Text("Wear sunscreen"),
//            dismissButton: .default(Text("Got it!"))
//        )
        
        
        /// For example, this code creates a showingAlert Boolean that tracks whether the sunscreen message should be shown or not, sets that Boolean to true when a button is tapped, then creates and attaches an alert view using that Boolean so it appears when the button is tapped:
        Button("Show Alert") {
            showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
        
        
        /// The second approach to creating alerts is to bind to some optional state that conforms to Identifiable, which will cause the alert to be shown whenever the object’s value changes.
        
        /// There are two advantages to this method:

        /// - You can attach any object you like at runtime, so your alert can show any number of different pieces of data.
        /// -SwiftUI automatically unwraps the optional when it has value, so you can be sure it exists by the time you want to show your alert – no need to check and unwrap the value yourself.
        VStack(spacing: 20) {
            Text("What is your favorite TV show?")
                .font(.headline)

            Button("Select Ted Lasso") {
                selectedShow = TVShow(name: "Ted Lasso")
            }

            Button("Select Bridgerton") {
                selectedShow = TVShow(name: "Bridgerton")
            }
        }
        .alert(item: $selectedShow) { show in
            Alert(title: Text(show.name), message: Text("Great choice!"), dismissButton: .default(Text("Baiklah")))
        }
    }
}

struct TVShow: Identifiable {
    var id: String { name }
    let name: String
}

#Preview {
    ShowAnAlert()
}
