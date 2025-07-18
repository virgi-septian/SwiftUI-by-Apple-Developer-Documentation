//
//  CreateAnAdaptiveLayout.swift
//  ViewLayout
//
//  Created by Virgi Septian on 18/07/25.
//

import SwiftUI

struct OptionsView: View {
    var body: some View {
        Button("Log in") { }
            .buttonStyle(.borderedProminent)

        Button("Create Account") { }
            .buttonStyle(.bordered)

        Button("Settings") { }
            .buttonStyle(.bordered)

        Spacer().frame(width: 50, height: 50)

        Button("Need Help?") { }
    }
}

struct CreateAnAdaptiveLayout: View {
    let terms = String(repeating: "abcde ", count: 100)
    var body: some View {
//        ViewThatFits {
//            Label("Welcome to AwesomeApp", systemImage: "bolt.shield")
//                .font(.largeTitle)
//
//            Label("Welcome", systemImage: "bolt.shield")
//                .font(.largeTitle)
//                .background(Color.blue)
//
//            Label("Welcome", systemImage: "bolt.shield")
//        }
        //MARK: - this creates a view with four different buttons, then decides to arrange them horizontally or vertically depending on how much space there is:
        
//        ViewThatFits {
//            HStack(content: OptionsView.init)
//            VStack(content: OptionsView.init)
//        }
        
        //MARK: - when space is limited code like this will default to a VStack rather than use a HStack with wrapping text:
        
//        ViewThatFits {
//            HStack {
//                Text("The rain")
//                Text("in Spain")
//                Text("falls mainly")
//                Text("on the Spaniards")
//            }
//
//            VStack {
//                Text("The rain")
//                Text("in Spain")
//                Text("falls mainly")
//                Text("on the Spaniards")
//            }
//        }
//        .font(.title)
        
        //MARK: - For example, say you wanted to display some terms and conditions to the user, and have it as fixed text if it can be fitted into the space, but scrolling text otherwise.
        
//        ViewThatFits {
//           Text(terms)
//
//           ScrollView {
//               Text(terms)
//           }
//       }
        
        //MARK: - Unless you have a huge screen, that will always choose the scrolling version because we asked ViewThatFits to care about both horizontal and vertical axes for our text. This means as soon as the text runs across more than one line, SwiftUI will prefer to avoid that layout.To fix this we need to restrict ViewThatFits to measure only the vertical axis, like this:
        
        
        
        ViewThatFits(in: .vertical) {
            Text(terms)

            ScrollView {
                Text(terms)
            }
        }
    }
}

#Preview {
    CreateAnAdaptiveLayout()
}

