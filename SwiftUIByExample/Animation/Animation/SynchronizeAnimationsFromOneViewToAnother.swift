//
//  SynchronizeAnimationsFromOneViewToAnother.swift
//  Animation
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

/// First, you need to use the @Namespace property wrapper to create a global namespace for your views. In practice this isn’t anything other than a property on your view, but behind the scenes this lets us attach views together.

/// So, you might add a property like this one: @Namespace private var animation.

/// Next you need to add .matchedGeometryEffect(id: YourIdentifierHere, in: animation) to all the views you want to animate with a synchronized effect. The YourIdentifierHere part should be replaced with some unique number that is shared by each part of your pair.

struct SynchronizeAnimationsFromOneViewToAnother: View {
    @Namespace private var animation
    @State private var isFlipped = false
    
    @State private var isZoomed = false

    var frame: Double {
        isZoomed ? 300 : 44
    }

    var body: some View {
//        VStack {
//            if isFlipped {
//                Circle()
//                    .fill(.red)
//                    .frame(width: 44, height: 44)
//                    .matchedGeometryEffect(id: "Shape", in: animation)
//                Text("Taylor Swift – 1989")
//                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                    .font(.headline)
//            } else {
//                Text("Taylor Swift – 1989")
//                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
//                    .font(.headline)
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 44, height: 44)
//                    .matchedGeometryEffect(id: "Shape", in: animation)
//            }
//        }
//        .onTapGesture {
//            withAnimation {
//                isFlipped.toggle()
//            }
//        }
        
        
        /// /// For a more advanced example, try this – it borrows the album display style from Apple Music, expanding a small view up to something larger when tapped. In this example only the text is animated because it’s changing location:
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(width: frame, height: frame)
                    .padding(.top, isZoomed ? 20 : 0)

                if isZoomed == false {
                    Text("Taylor Swift – 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                    Spacer()
                }
            }

            if isZoomed == true {
                Text("Taylor Swift – 1989")
                    .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                    .font(.headline)
                    .padding(.bottom, 60)
                Spacer()
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                isZoomed.toggle()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        .background(Color(white: 0.9))
        .foregroundStyle(.black)
    }
}


#Preview {
    SynchronizeAnimationsFromOneViewToAnother()
}
