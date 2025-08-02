//
//  ContentSystemTray.swift
//  InterestingUI
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct ContentSystemTray: View {
    @State private var show: Bool = false
    var body: some View {
        Button("Show Tray View") {
            show.toggle()
        }
        .systemTrayView($show) {
            Text("Hello From Tray")
                .frame(maxWidth: .infinity)
                .frame(height: 200)
        }
    }
}


#Preview {
    ContentSystemTray()
}

