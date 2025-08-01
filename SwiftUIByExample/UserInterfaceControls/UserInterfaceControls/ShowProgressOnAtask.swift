//
//  ShowProgressOnAtask.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct ShowProgressOnAtask: View {
    @State private var downloadAmount = 0.0

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
//        VStack {
//            ProgressView("Downloading…", value: downloadAmount, total: 100)
//        }
        
        /// with timer :
        ProgressView("Downloading…", value: downloadAmount, total: 100)
                    .onReceive(timer) { _ in
                        if downloadAmount < 100 {
                            downloadAmount += 2
                        }
                    }
    }
}

#Preview {
    ShowProgressOnAtask()
}
