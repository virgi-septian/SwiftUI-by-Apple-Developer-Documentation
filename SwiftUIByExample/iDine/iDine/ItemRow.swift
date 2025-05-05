//
//  ItemRow.swift
//  iDine
//
//  Created by Virgi Septian on 30/04/25.
//

import SwiftUI

struct ItemRow: View {
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: MenuItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(2)
                    .background(colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundStyle(.white)
            }
        }
    }
}


#Preview {
    let sampleItem = MenuItem(id: UUID(uuidString: "E13E2B1D-1FA1-4B9A-9A99-2F9A5D939AE2")!,name: "Test Item", photoCredit: "", price: 2, restrictions: ["D", "G"], description: "tes")
    ItemRow(item: sampleItem)
}
