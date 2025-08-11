//
//  GroupViewsVisually.swift
//  Containers
//
//  Created by Virgi Septian on 11/08/25.
//

import SwiftUI

struct GroupViewsVisually: View {
    var body: some View {
        /// SwiftUI’s GroupBox view groups views together and places a light background color behind them so they stand out. You can optionally also include a header to make group titles, if you need to.
        
        /// By default GroupBox with align its views vertically. For example, this will show three text views one above the other:
        GroupBox {
            Text("Your account")
                .font(.headline)
            Text("Username: tswift89")
            Text("City: Nashville")
        }
        
        /// If you want to control that layout, such as changing axis or adjusting the alignment, create a stack yourself:
        GroupBox {
            VStack(alignment: .leading) {
                Text("Your account")
                    .font(.headline)
                Text("Username: tswift89")
                Text("City: Nashville")
            }
        }
        
        /// One real power feature of GroupBox is that if you nest them they will automatically adapt their colors so they are neatly distinguished:
        GroupBox {
            Text("Outer Content")

            GroupBox {
                Text("Middle Content")

                GroupBox {
                    Text("Inner Content")
                }
            }
        }
        
        /// you can add titles to your GroupBox and although it looks okay on macOS it doesn’t look nice at all on iOS:
        GroupBox("Your account") {
            VStack(alignment: .leading) {
                Text("Username: tswift89")
                Text("City: Nashville")
            }
        }
    }
}

#Preview {
    GroupViewsVisually()
}
