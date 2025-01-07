//
//  HealtKitManaget.swift
//  FitnessApp
//
//  Created by Virgi Septian on 06/01/25.
//

import Foundation
import HealthKit

extension Date {
    static var startOfToday: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: Date())
    }
}

class HealthManager {
    static let shared = HealthManager()
    
    private let healthStore = HKHealthStore()
    
    private init () {
        Task {
            do {
                try await requestHealthKitAccess()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func requestHealthKitAccess() async throws {
        let calories = HKQuantityType(.activeEnergyBurned)
        let exercise = HKQuantityType(.appleExerciseTime)
        let stand = HKCategoryType(.appleStandHour)
        
        let healthTypes: Set = [calories, exercise, stand]
        try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
    }
    
    func fecthTodayCaloriesBurned(completion: @escaping(Result<Double, Error>) -> Void) {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfToday, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                let error = NSError(domain: "com.versdev.FitnessApp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch calories"])
                completion(.failure(error))
                return
            }
            
            let caloriesCount = quantity.doubleValue(for: .kilocalorie())
            completion(.success(caloriesCount))
        }
        
        healthStore.execute(query)
    }
    
    func fecthTodayExercise(completion: @escaping(Result<Double, Error>) -> Void) {
        let exercise = HKQuantityType(.appleExerciseTime)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfToday, end: Date())
        let query = HKStatisticsQuery(quantityType: exercise, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                let error = NSError(domain: "com.versdev.FitnessApp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch calories"])
                completion(.failure(error))
                return
            }
            
            let exerciceCount = quantity.doubleValue(for: .minute())
            completion(.success(exerciceCount))
        }
        
        healthStore.execute(query)
    }
    
    func fecthTodayStandHours(completion: @escaping(Result<Int, Error>) -> Void) {
        let stand = HKCategoryType(.appleStandHour)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfToday, end: Date())
        let query = HKSampleQuery(sampleType: stand, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, results, error in
            guard let samples = results as? [HKCategorySample] , error == nil else {
                completion(.failure(NSError()))
                return
            }
            
            let standCout = samples.filter({ $0.value == 0 }).count
            completion(.success(standCout))
        }
        
        healthStore.execute(query)
    }
}
