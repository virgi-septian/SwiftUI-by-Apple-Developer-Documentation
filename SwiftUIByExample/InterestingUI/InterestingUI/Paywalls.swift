//
//  Paywalls.swift
//  InterestingUI
//
//  Created by Virgi Septian on 06/08/25.
//

import SwiftUI

struct Paywalls: View {
    /// View Properties
    @State private var showIAPView: Bool = false
    @State private var model: PaywallModel?
    @State private var showDefaultView: Bool = false
    var body: some View {
        VStack {
            Button("Subscription View") {
                showIAPView.toggle()
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.black)
            .tint(.white)
        }
        .fullScreenCover(isPresented: $showIAPView, content: {
            CustomPaywallView(
                model: $model,
                showDefaultView: $showDefaultView
            )
        })
        .task {
            do {
                try await fetchPaywallData()
            } catch {
                print(error.localizedDescription)
                showDefaultView = true
            }
        }
    }

    func fetchPaywallData() async throws {
//        guard let jsonDict = try await Purchases.shared.offerings().current?.metadata else {
//            showDefaultView = true
//            return
//        }

        /// Mengubah ke JSON Data
//        let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options:
//            .prettyPrinted)
//        let model = try JSONDecoder().decode(PaywallModel.self, from: jsonData)
        self.model = model
//        showDefaultView = model.showDefaultView
        showDefaultView = ((model?.showDefaultView) != nil)
    }


}

#Preview {
    Paywalls()
}
