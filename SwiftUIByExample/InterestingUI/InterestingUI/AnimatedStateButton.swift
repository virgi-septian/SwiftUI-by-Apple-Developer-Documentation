//
//  AnimatedStateButton.swift
//  InterestingUI
//
//  Created by Virgi Septian on 30/07/25.
//

import SwiftUI

enum TransactionState: String {
    case idle = "Click to pay"
    case analyzing = "Analyzing Transaction"
    case processing = "Processing Transaction"
    case completed = "Transaction Completed"
    case failed = "Transaction Failed"

    var color: Color {
        switch self {
        case .idle:
            return .black
        case .analyzing:
            return .blue
        case .processing:
            return Color(red: 0.8, green: 0.35, blue: 0.2)
        case .completed:
            return .green
        case .failed:
            return .red
        }
    }

    var image: String? {
        switch self {
        case .idle: "apple.logo"
        case .analyzing: nil
        case .processing: nil
        case .completed: "checkmark.circle.fill"
        case .failed: "xmark.circle.fill"
        }
    }
}

struct AnimatedStateButton: View {
    @State private var transactionState: TransactionState = .idle
    var body: some View {
        NavigationStack {
            VStack {
                let config = AnimatedButton.Config(title: transactionState.rawValue, foregroundColor: .white, background: transactionState.color, symbolImage: transactionState.image)
                
                AnimatedButton(config: config) {
                    transactionState = .analyzing
                    try? await Task.sleep(for: .seconds(3))
                    transactionState = .processing
                    try? await Task.sleep(for: .seconds(3))
                    transactionState = .failed
                    try? await Task.sleep(for: .seconds(1))
                    transactionState = .idle
                }
//                .animation(.easeInOut(duration: 0.25), value: transactionState)
            }
            .navigationTitle("Custom Button")
        }
    }
}

#Preview {
    AnimatedStateButton()
}
