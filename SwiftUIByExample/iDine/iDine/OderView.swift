//
//  OderView.swift
//  iDine
//
//  Created by Virgi Septian on 04/05/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
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
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
        
        
    }
}

#Preview {
    OrderView().environmentObject(Order())
}
