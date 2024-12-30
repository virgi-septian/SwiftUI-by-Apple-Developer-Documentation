//
//  WorkoutCard.swift
//  FitnessApp
//
//  Created by Virgi Septian on 30/12/24.
//

import SwiftUI

struct WorkoutCard: View {
    @State var workout: Workout
    
    var body: some View {
        
        HStack {
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .foregroundColor(workout.tinColor)
                .frame(width: 48, height: 48)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            VStack(spacing: 16) {
                HStack {
                    Text(workout.title)
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text(workout.duration)
                        .font(.caption)
                }
                
                HStack {
                    Text(workout.date)
                        .font(.caption)
                    Spacer()
                    Text(workout.calories)
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    WorkoutCard(workout: Workout(id: 0, title: "Running", image: "figure.run", tinColor: .cyan, duration: "23 min", date: "Aug 30, 2024", calories: "1223 kcal"))
    
}

