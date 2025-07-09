//
//  ContentView.swift
//  ViewLayout
//
//  Created by Virgi Septian on 10/07/25.
//

import SwiftUI

struct GiveCustomFrame: View {
    var body: some View {
        //        VStack {
        //            ScrollView {
        //                Section {
        //                    Button {
        //                        print("Button tapped")
        //                    } label: {
        //                        Text("Welcome")
        //                            .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
        //                            .font(.largeTitle)
        //                    }
        //                }
        //
        //                Section {
        //                    Text("Please log in")
        //                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        //                        .font(.largeTitle)
        //                        .foregroundStyle(.white)
        //                        .background(.red)
        //                }
        //            }
        //        }
        
        ZStack {            
            Text("Please log in")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .background(.red)
        }
        
    }
}

#Preview {
    GiveCustomFrame()
}
