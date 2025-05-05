//
//  CheckoutView.swift
//  iDine
//
//  Created by Virgi Septian on 05/05/25.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    @State private var addLoyaltyDetail = false
    @State private var loyaltyNumber = ""
    
    @State private var paymentType = "Cash"
    let paymentTypes = ["Cash", "Transfer Bank", "iDhinePoints"]
    
    @State private var tipAmount = 15
    let tipAmounts = [10, 15, 20, 25, 0]

    @State private var showingPaymentAlert = false
    
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section{
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
            
            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
            //
        } message: {
            Text("Your total was \(totalPrice) - Thank You!")
        }
        
        Spacer()
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
