//
//  MakeAFixedSizeSpacer.swift
//  ViewLayout
//
//  Created by Virgi Septian on 22/07/25.
//

import SwiftUI

struct MakeAFixedSizeSpacer: View {
    var body: some View {
        List{
            Section{
                VStack {
                    Text("First Label")
                    Spacer()
                        .frame(height: 50)
                    Text("Second Label")
                }
            }
            
            Section{
                VStack {
                    Text("First Label")
                    Spacer(minLength: 50)
                    Text("Second Label")
                }
            }
        }
    }
}

#Preview {
    MakeAFixedSizeSpacer()
}
