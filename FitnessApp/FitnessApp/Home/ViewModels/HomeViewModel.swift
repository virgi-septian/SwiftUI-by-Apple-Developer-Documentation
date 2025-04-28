//
//  HomeViewModel.swift
//  FitnessApp
//
//  Created by Virgi Septian on 30/12/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 0
    @Published var exercise: Int = 0
    @Published var stand: Int = 0
    
    @Published var activities = [Activity]()
    
    @Published var mockActivities = [
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9812"),
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "9812"),
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "9812"),
        Activity(title: "Today Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .purple, amount: "9812")
    ]
    
    @Published var mockWorkouts = [
        Workout(id: 0, title: "Running", image: "figure.run", tinColor: .cyan, duration: "23 min", date: "Aug 23, 2024", calories: "232 kcal"),
        
        Workout(id: 1, title: "Strengh Training", image: "figure.strengthtraining.functional", tinColor: .purple, duration: "11 min", date: "Aug 23, 2024", calories: "232 kcal"),
        
        Workout(id: 2, title: "Durability Trining", image: "figure.mind.and.body", tinColor: .green, duration: "30 min", date: "Aug 23, 2024", calories: "232 kcal")
    ]
    
    init() {
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fecthTodaySteps()
                fechTodayCalories()
                fechTodayStandHours()
                fechTodayExerciseTime()
                fetchCurrentWeekActivities()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fechTodayCalories() {
        healthManager.fecthTodayCaloriesBurned { result in
            switch result {
            case .success(let calories):
                DispatchQueue.main.async {
                    self.calories = Int(calories)
                    let activity = Activity(title: "Calories Burned", subtitle: "today", image: "flame", tintColor: .green, amount: calories.formattedNumberString())
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fechTodayExerciseTime() {
        healthManager.fecthTodayExercise { result in
            switch result {
            case .success(let exercise):
                DispatchQueue.main.async {
                    self.exercise = Int(exercise)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fechTodayStandHours() {
        healthManager.fecthTodayStandHours { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = hours
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    //MARK: - Fitness Activity
    func fecthTodaySteps() {
        healthManager.fecthTodayActivity { result in
            switch result {
                case .success(let activity):
                DispatchQueue.main.async {
                    self.activities.append(activity)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchCurrentWeekActivities() {
        healthManager.fetchCurrentWeekWorkoutStats { result in
            switch result {
                case .success(let activities):
                DispatchQueue.main.async {
                    self.activities.append(contentsOf: activities)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
