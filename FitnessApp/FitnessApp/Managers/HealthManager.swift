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
    
    static var startOfWeek: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2
        return calendar.date(from: components) ?? Date()
    }
    
    func fetchMonthStartAndEndDate() -> (Date, Date) {
        let calendar = Calendar.current
        let startDateComponent = calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: self))
        let startDate = calendar.date(from: startDateComponent) ?? self
        
        let endDate = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startDate) ?? self
        
        return (startDate, endDate)
    }
    
    func formatWorkoutDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
}

extension Double {
    func formattedNumberString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
//        formatter.minimumFractionDigits = decimalPlaces
        return formatter.string(from: NSNumber(value: self)) ?? "0"
    }
}

extension Int {
    func formattedNumberString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
//        formatter.minimumFractionDigits = decimalPlaces
        return formatter.string(from: NSNumber(value: self)) ?? "0"
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
        let steps = HKQuantityType(.stepCount)
        let workout = HKSampleType.workoutType()
        let healthTypes: Set = [calories, exercise, stand, steps, workout]
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
                let error = NSError(domain: "com.versdev.FitnessApp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch exercise"])
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
    
    func fecthTodayActivity(completion: @escaping(Result<Activity, Error>) -> Void) {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfToday, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, results, error in
            guard let quantity = results?.sumQuantity(), error == nil else {
                let error = NSError(domain: "com.versdev.FitnessApp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch activity"])
                completion(.failure(error))
                return
            }
            
            let steps = quantity.doubleValue(for: .count())
            let activity = Activity(title: "Today Steps", subtitle: "Goal 800", image: "figure.walk", tintColor: .green, amount: steps.formattedNumberString())
            completion(.success(activity))
        }
        
        healthStore.execute(query)
    }
    
    func fetchCurrentWeekWorkoutStats(completion: @escaping(Result<[Activity], Error>) -> Void) {
        let workout = HKSampleType.workoutType()
        let predicate = HKQuery.predicateForSamples(withStart: .startOfWeek, end: Date())
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) {[weak self] _, results, error in
            guard let workout = results as? [HKWorkout], let self, error == nil else {
                let error = NSError(domain: "com.versdev.FitnessApp", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch activity"])
                completion(.failure(error))
                return
            }
            
            var runningCount : Int = 0
            var strenghtCount : Int = 0
            var soccerCount : Int = 0
            var basketballCount : Int = 0
            var cyclingCount : Int = 0
            var swimmingCount : Int = 0
            var walkingCount : Int = 0
            var kickBoxingCount : Int = 0
            
            workout.forEach {
                let duration = Int($0.duration) / 60
                switch $0.workoutActivityType {
                case .running:
                    runningCount += duration
                case .traditionalStrengthTraining:
                    runningCount += 1
                case .soccer:
                    runningCount += 1
                case .basketball:
                    runningCount += 1
                case .stairClimbing:
                    runningCount += 1
                case .walking:
                    runningCount += 1
                case .kickboxing:
                    runningCount += 1
                case .americanFootball:
                    <#code#>
                case .archery:
                    <#code#>
                case .australianFootball:
                    <#code#>
                case .badminton:
                    <#code#>
                case .baseball:
                    <#code#>
                case .bowling:
                    <#code#>
                case .boxing:
                    <#code#>
                case .climbing:
                    <#code#>
                case .cricket:
                    <#code#>
                case .crossTraining:
                    <#code#>
                case .curling:
                    <#code#>
                case .cycling:
                    <#code#>
                case .dance:
                    <#code#>
                case .danceInspiredTraining:
                    <#code#>
                case .elliptical:
                    <#code#>
                case .equestrianSports:
                    <#code#>
                case .fencing:
                    <#code#>
                case .fishing:
                    <#code#>
                case .functionalStrengthTraining:
                    <#code#>
                case .golf:
                    <#code#>
                case .gymnastics:
                    <#code#>
                case .handball:
                    <#code#>
                case .hiking:
                    <#code#>
                case .hockey:
                    <#code#>
                case .hunting:
                    <#code#>
                case .lacrosse:
                    <#code#>
                case .martialArts:
                    <#code#>
                case .mindAndBody:
                    <#code#>
                case .mixedMetabolicCardioTraining:
                    <#code#>
                case .paddleSports:
                    <#code#>
                case .play:
                    <#code#>
                case .preparationAndRecovery:
                    <#code#>
                case .racquetball:
                    <#code#>
                case .rowing:
                    <#code#>
                case .rugby:
                    <#code#>
                case .sailing:
                    <#code#>
                case .skatingSports:
                    <#code#>
                case .snowSports:
                    <#code#>
                case .softball:
                    <#code#>
                case .squash:
                    <#code#>
                case .surfingSports:
                    <#code#>
                case .swimming:
                    <#code#>
                case .tableTennis:
                    <#code#>
                case .tennis:
                    <#code#>
                case .trackAndField:
                    <#code#>
                case .volleyball:
                    <#code#>
                case .waterFitness:
                    <#code#>
                case .waterPolo:
                    <#code#>
                case .waterSports:
                    <#code#>
                case .wrestling:
                    <#code#>
                case .yoga:
                    <#code#>
                case .barre:
                    <#code#>
                case .coreTraining:
                    <#code#>
                case .crossCountrySkiing:
                    <#code#>
                case .downhillSkiing:
                    <#code#>
                case .flexibility:
                    <#code#>
                case .highIntensityIntervalTraining:
                    <#code#>
                case .jumpRope:
                    <#code#>
                case .pilates:
                    <#code#>
                case .snowboarding:
                    <#code#>
                case .stairs:
                    <#code#>
                case .stepTraining:
                    <#code#>
                case .wheelchairWalkPace:
                    <#code#>
                case .wheelchairRunPace:
                    <#code#>
                case .taiChi:
                    <#code#>
                case .mixedCardio:
                    <#code#>
                case .handCycling:
                    <#code#>
                case .discSports:
                    <#code#>
                case .fitnessGaming:
                    <#code#>
                case .cardioDance:
                    <#code#>
                case .socialDance:
                    <#code#>
                case .pickleball:
                    <#code#>
                case .cooldown:
                    <#code#>
                case .swimBikeRun:
                    <#code#>
                case .transition:
                    <#code#>
                case .underwaterDiving:
                    <#code#>
                case .other:
                    <#code#>
                @unknown default:
                    runningCount += 0
                }
            }
            
            completion(.success(self.generateActivitiesFromDurations(running: runningCount, strength: strenghtCount, soccer: soccerCount, basketball: basketballCount, cycling: cyclingCount, swimming: swimmingCount, walking: walkingCount, kickBoxing: kickBoxingCount)))
        }
        
        healthStore.execute(query)
    }
    
    func generateActivitiesFromDurations(running: Int, strength: Int, soccer: Int, basketball: Int, cycling: Int, swimming: Int, walking: Int, kickBoxing: Int) -> [Activity]{
        return [
            Activity(title: "Runing", subtitle: "This Week", image: "figure.run", tintColor: .green, amount: "\(running) mins"),
            Activity(title: "Strength Training", subtitle: "This Week", image: "dumbbell", tintColor: .blue, amount: "\(strength) mins"),
            Activity(title: "Soccer", subtitle: "This Week", image: "figure.outdoor.soccer", tintColor: .indigo, amount: "\(soccer) mins"),
            Activity(title: "Basket Ball", subtitle: "This Week", image: "figure.basketball", tintColor: .green, amount: "\(basketball) mins"),
            Activity(title: "Cycling", subtitle: "This Week", image: "figure.outdor.cycling", tintColor: .green, amount: "\(cycling) mins"),
            Activity(title: "Swimming", subtitle: "This Week", image: "figure.open.water.swim", tintColor: .green, amount: "\(swimming) mins"),
            Activity(title: "Walking", subtitle: "This Week", image: "figure.walk", tintColor: .green, amount: "\(walking) mins"),
            Activity(title: "Kick Boxing", subtitle: "This Week", image: "figure.boxing", tintColor: .green, amount: "\(kickBoxing) mins")
        ]
    }
    
    func fetchWorkourForMonth(month: Date, completion: @escaping (Result<[Workout], Error>) -> Void) {
        let workout = HKSampleType.workoutType()
        let (startDate, endDate) = month.fetchMonthStartAndEndDate()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let query = HKSampleQuery(sampleType: workout, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, results, error) in
            guard let workouts = results as? [HKWorkout], error == nil else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            let workoutArray = workouts.map({ Workout(id: nil ,title: $0.workoutActivityType.name, image: $0.workoutActivityType.image, tinColor: $0.workoutActivityType.color, duration: "\(Int($0.duration)/60)", date: $0.startDate.formatWorkoutDate(), calories: $0.totalEnergyBurned?.doubleValue(for: .kilocalorie()).formattedNumberString() ?? "-" ) })
            completion(.success(workoutArray))
        }
        healthStore.execute(query)
        
    }
}

