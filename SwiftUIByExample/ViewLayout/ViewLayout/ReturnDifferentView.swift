//
//  ReturnDifferentView.swift
//  ViewLayout
//
//  Created by Virgi Septian on 12/07/25.
//

import SwiftUI

//struct ReturnDifferentView: View {
//    var tossResult: some View {
//        Group {
//            if Bool.random() {
//                Image("laser-show")
//                    .resizable()
//                    .scaledToFit()
//            } else {
//                Text("Better luck next time")
//                    .font(.title)
//            }
//        }
//        .frame(width: 400, height: 300)
//    }
//
//    var body: some View {
//        VStack {
//            Text("Coin Flip")
//                .font(.largeTitle)
//
//            tossResult
//        }
//    }
    
//    var tossResult: some View {
//        if Bool.random() {
//            return AnyView(Image("laser-show").resizable().scaledToFit())
//        } else {
//            return AnyView(Text("Better luck next time").font(.title))
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Text("Coin Flip")
//                .font(.largeTitle)
//
//            tossResult
//                .frame(width: 400, height: 300)
//        }
//    }
    
//    @ViewBuilder var tossResult: some View {
//        if Bool.random() {
//            Image("laser-show")
//                .resizable()
//                .scaledToFit()
//        } else {
//            Text("Better luck next time")
//                .font(.title)
//        }
//    }
//
//    var body: some View {
//        VStack {
//            Text("Coin Flip")
//                .font(.largeTitle)
//
//            tossResult
//                .frame(width: 400, height: 300)
//        }
//    }
    
//}


struct TossResult: View {
    var body: some View {
        if Bool.random() {
            Image("laser-show")
                .resizable()
                .scaledToFit()
        } else {
            Text("Better luck next time")
                .font(.title)
        }
    }
}

struct ReturnDifferentView: View {
    var body: some View {
        VStack {
            Text("Coin Flip")
                .font(.largeTitle)

            TossResult()
                .frame(width: 400, height: 300)
        }
    }
}
#Preview {
    ReturnDifferentView()
}
