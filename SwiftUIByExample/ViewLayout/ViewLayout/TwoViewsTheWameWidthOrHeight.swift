//
//  TwoViewsTheWameWidthOrHeight.swift
//  ViewLayout
//
//  Created by Virgi Septian on 14/07/25.
//

import SwiftUI

struct TwoViewsTheWameWidthOrHeight: View {
    var body: some View {
        VStack {
            HStack {
                Text("This is a short string.")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(.red)

                Text("This is a very long string with lots and lots of text that will definitely run across multiple lines because it's just so long.")
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(.green)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxHeight: 200)
            .padding(.bottom, 30)
            
            VStack {
                Button("Log in") { }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .clipShape(Capsule())

                Button("Reset Password") { }
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red)
                    .clipShape(Capsule())
            }
            .fixedSize(horizontal: true, vertical: false)
        }
    }
}

#Preview {
    TwoViewsTheWameWidthOrHeight()
}
