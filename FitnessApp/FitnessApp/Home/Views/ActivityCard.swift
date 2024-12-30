//
//  ActivityCard.swift
//  FitnessApp
//
//  Created by Virgi Septian on 27/12/24.
//

import SwiftUI

struct ActivityCard: View {
    @State var activity: Activity
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(20)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.title)
                        Text(activity.subtitle)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Image(systemName: activity.image)
                        .foregroundStyle(activity.tintColor)
                }
                
                Text(activity.amount)
                    .bold()
                    .padding()
                    .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    ActivityCard(activity: Activity(id: 0, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9812"))
}
