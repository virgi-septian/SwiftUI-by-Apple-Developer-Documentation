//
//  OderView.swift
//  iDine
//
//  Created by Virgi Septian on 04/05/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationStack {
            
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("price \(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink("Place Order") {
                        Text("Checkout")
                    }
                }
            }
            .navigationTitle("Order")
        }
        
        
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
