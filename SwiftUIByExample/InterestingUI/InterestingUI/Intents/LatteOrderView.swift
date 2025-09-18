//
//  LatteOrderView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 18/09/25.
//

import SwiftUI
import AppIntents

enum LatteOrderPage: String {
    case page1 = "Updating Milk Presentage"
    case page2 = "Updating Latte Count"
    case page3 = "Order Finished"
}

/// struct Latte Order View
struct LatteOrderView: View {
    var choise: LocalizedStringResource
    var count: Int
    var milkPercentage: Int
    
    var page: LatteOrderPage
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 15) {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Caffe Latte")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Group {
                        Text(choise)
                        
                        if page == .page2 {
                            Text("\(milkPercentage)% Milk")
                        }
                        
                        if page == .page3 {
                            HStack(spacing: 0) {
                                Text("\(milkPercentage)% Milk")
                                Text(" | \(count)% Shots")
                            }
                        }
                    }
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                }
            }
            .foregroundStyle(.white)
            
            /// Displaying Order placed View
            if page == .page3 {
                Label("Order Placed", systemImage: "checkmark")
                    .frame(height: 40)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial, in: .capsule)
                
            } else {
                HStack(spacing: 8) {
                    Group {
                        if page == .page2 {
                            Text("\(count) Shots")
                        }

                        if page == .page1 {
                            Text("\(milkPercentage)% Milk")
                        }
                    }
                    .font(.title3)
                    .fontWeight(.semibold)

                    Spacer(minLength: 0)

                    ActionButton(false)
                    ActionButton(true)
                }
                .foregroundStyle(.white)
            }
        }
        .padding(15)
        .background {
            LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing)
                .clipShape(.containerRelative)
        }
    }
    
    @ViewBuilder
    func ActionButton(_ isIncrement: Bool) -> some View {
        Button(intent: LatteActionIntent(isUpdatingPercentage: page == .page1, isIncremental: isIncrement)) {
            Image(systemName: isIncrement ? "plus" : "minus")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(maxWidth: 100)
                .frame(height: 40)
                .background {
                    UnevenRoundedRectangle(
                        topLeadingRadius: isIncrement ? 10 : 30,
                        bottomLeadingRadius: isIncrement ? 10 : 30,
                        bottomTrailingRadius: isIncrement ? 30 : 10,
                        topTrailingRadius: isIncrement ? 30 : 10,
                        style: .continuous
                    )
                    .fill(.ultraThinMaterial)
                }
        }
        .buttonStyle(.plain)
    }
}


