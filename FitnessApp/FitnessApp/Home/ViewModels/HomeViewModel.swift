//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Virgi Septian on 30/12/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @State var calories: Int = 123
    @State var active: Int = 90
    @State var stand: Int = 40
    
    @Published var mockActivities = [
        Activity(id: 0, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9812"),
        Activity(id: 1, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9812"),
        Activity(id: 2, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9812"),
        Activity(id: 3, title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .purple, amount: "9812")
    ]
    
    @Published var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tinColor: .cyan, duration: "23 min", date: "Aug 23, 2024", calories: "232 kcal"),
        
        Workout(id: 1, title: "Strengh Training", image: "figure.strengthtraining.functional", tinColor: .purple, duration: "11 min", date: "Aug 23, 2024", calories: "232 kcal"),
        
        Workout(id: 2, title: "Durability Trining", image: "figure.mind.and.body", tinColor: .green, duration: "30 min", date: "Aug 23, 2024", calories: "232 kcal")
    ]
}
