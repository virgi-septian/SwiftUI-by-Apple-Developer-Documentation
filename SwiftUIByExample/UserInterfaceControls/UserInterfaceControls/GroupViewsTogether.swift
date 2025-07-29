//
//  GroupViewsTogether.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 29/07/25.
//

import SwiftUI

struct GroupViewsTogether: View {
    var body: some View {
        ControlGroup {
            Button("First") { }
            Button("Second") { }
            Button("Third") { }
        }
        .padding()
        
        /// ControlGroup is particularly useful when creating customizable toolbars, where buttons in a control group must be added or removed together rather than split up.
    }
}

#Preview {
    GroupViewsTogether()
}
