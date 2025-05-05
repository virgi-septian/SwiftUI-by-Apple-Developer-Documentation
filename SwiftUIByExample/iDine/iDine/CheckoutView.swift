//
//  CheckoutView.swift
//  iDine
//
//  Created by Virgi Septian on 05/05/25.
//

import SwiftUI

struct CheckoutView: View {
    @State private var addLoyaltyDetail = false
    @State private var loyaltyNumber = ""
    @State private var paymentType = "Cash"
    @EnvironmentObject var order: Order
    let paymentTypes = ["Cash", "Transfer Bank", "iDhinePoints"]
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipAmount = 10
    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add iDhine loyalty card", isOn: $addLoyaltyDetail.animation())
                
                if addLoyaltyDetail {
                    TextField("Enter your iDhine ID", text: $loyaltyNumber)
                }
        
            }
            
            Section("Add a tip ?") {
                Picker("Percentage: ", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total: $100") {
                Button("Confirm Order") {
                    
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
