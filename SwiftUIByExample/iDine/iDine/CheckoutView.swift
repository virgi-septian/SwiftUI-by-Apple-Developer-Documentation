//
//  CheckoutView.swift
//  iDine
//
//  Created by Virgi Septian on 05/05/25.
//

import SwiftUI

struct CheckoutView: View {
    @State private var paymentType = "Cash"
    @EnvironmentObject var order: Order
    let paymentTypes: [String] = ["Cash", "Transfer Bank", "iDhinePoints"]
    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay ?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        .navigationTitle(Text("Payment"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
