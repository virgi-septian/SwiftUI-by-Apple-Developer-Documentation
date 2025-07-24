//
//  CustomizeStackLayouts.swift
//  ViewLayout
//
//  Created by Virgi Septian on 22/07/25.
//

import SwiftUI

struct CustomizeStackLayouts: View {
    var body: some View {
        VStack {
            Text("customize stack layouts with alignment and spacing")
            
            List{
                Section{
                    VStack(spacing: 50) {
                        Text("SwiftUI")
                        Text("rocks")
                    }
                }
                
                Section{
                    VStack {
                        Text("SwiftUI")
                        Divider()
                        Text("rocks")
                    }
                }
                
                Section{
                    VStack(alignment: .leading) {
                        Text("SwiftUI")
                        Text("rocks")
                    }
                }
                
                Section{
                    VStack(alignment: .leading, spacing: 20) {
                        Text("SwiftUI")
                        Text("rocks")
                    }
                }
            }
        }
    }
}

#Preview {
    CustomizeStackLayouts()
}
