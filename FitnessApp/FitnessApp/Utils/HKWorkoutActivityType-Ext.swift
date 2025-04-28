//
//  HKWorkoutActivityType-Ext.swift
//  FitnessApp
//
//  Created by Virgi Septian on 08/01/25.
//

import HealthKit
import SwiftUI

extension HKWorkoutActivityType {

    /*
     Simple mapping of available workout types to a human readable name.
     */
    var name: String {
        switch self {
        case .americanFootball:             return "Ameroican Football"
        case .archery:                      return "Archery"
        case .australianFootball:           return "Australian Football"
        case .badminton:                    return "Badminton"
        case .baseball:                     return "Baseball"
        case .basketball:                   return "Basketball"
        case .bowling:                      return "Bowling"
        case .boxing:                       return "Boxing"
        case .climbing:                     return "Climbing"
        case .crossTraining:                return "Cross Training"
        case .curling:                      return "Curling"
        case .cycling:                      return "Cycling"
        case .dance:                        return "Dance"
        case .danceInspiredTraining:        return "Dance Inspired Training"
        case .elliptical:                   return "Elliptical"
        case .equestrianSports:             return "Equestrian Sports"
        case .fencing:                      return "Fencing"
        case .fishing:                      return "Fishing"
        case .functionalStrengthTraining:   return "Functional Strength Training"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Gymnastics"
        case .handball:                     return "Handball"
        case .hiking:                       return "Hiking"
        case .hockey:                       return "Hockey"
        case .hunting:                      return "Hunting"
        case .lacrosse:                     return "Lacrosse"
        case .martialArts:                  return "Martial Arts"
        case .mindAndBody:                  return "Mind and Body"
        case .mixedMetabolicCardioTraining: return "Mixed Metabolic Cardio Training"
        case .paddleSports:                 return "Paddle Sports"
        case .play:                         return "Play"
        case .preparationAndRecovery:       return "Preparation and Recovery"
        case .racquetball:                  return "Racquetball"
        case .rowing:                       return "Rowing"
        case .rugby:                        return "Rugby"
        case .running:                      return "Running"
        case .sailing:                      return "Sailing"
        case .skatingSports:                return "Skating Sports"
        case .snowSports:                   return "Snow Sports"
        case .soccer:                       return "Soccer"
        case .softball:                     return "Softball"
        case .squash:                       return "Squash"
        case .stairClimbing:                return "Stair Climbing"
        case .surfingSports:                return "Surfing Sports"
        case .swimming:                     return "Swimming"
        case .tableTennis:                  return "Table Tennis"
        case .tennis:                       return "Tennis"
        case .trackAndField:                return "Track and Field"
        case .traditionalStrengthTraining:  return "Traditional Strength Training"
        case .volleyball:                   return "Volleyball"
        case .walking:                      return "Walking"
        case .waterFitness:                 return "Water Fitness"
        case .waterPolo:                    return "Water Polo"
        case .waterSports:                  return "Water Sports"
        case .wrestling:                    return "Wrestling"
        case .yoga:                         return "Yoga"

        // iOS 10
        case .barre:                        return "Barre"
        case .coreTraining:                 return "Core Training"
        case .crossCountrySkiing:           return "Cross Country Skiing"
        case .downhillSkiing:               return "Downhill Skiing"
        case .flexibility:                  return "Flexibility"
        case .highIntensityIntervalTraining:    return "High Intensity Interval Training"
        case .jumpRope:                     return "Jump Rope"
        case .kickboxing:                   return "Kickboxing"
        case .pilates:                      return "Pilates"
        case .snowboarding:                 return "Snowboarding"
        case .stairs:                       return "Stairs"
        case .stepTraining:                 return "Step Training"
        case .wheelchairWalkPace:           return "Wheelchair Walk Pace"
        case .wheelchairRunPace:            return "Wheelchair Run Pace"

        // iOS 11
        case .taiChi:                       return "Tai Chi"
        case .mixedCardio:                  return "Mixed Cardio"
        case .handCycling:                  return "Hand Cycling"

        // iOS 13
        case .discSports:                   return "Disc Sports"
        case .fitnessGaming:                return "Fitness Gaming"

        // Catch-all
        default:                            return "Other"
        }
    }
    
    var image: String {
            switch self {
            case .americanFootball:             return "football"
            case .archery:                      return "target"
            case .australianFootball:           return "soccerball"
            case .badminton:                    return "sportscourt"
            case .baseball:                     return "baseball"
            case .basketball:                   return "basketball"
            case .bowling:                      return "bowlingball"
            case .boxing:                       return "globe"
            case .climbing:                     return "figure.climbing"
            case .crossTraining:                return "figure.cross.training"
            case .curling:                      return "curling.stone"
            case .cycling:                      return "bicycle"
            case .dance:                        return "music.note"
            case .danceInspiredTraining:        return "figure.dance"
            case .elliptical:                   return "figure.elliptical"
            case .equestrianSports:             return "horse"
            case .fencing:                      return "fencing"
            case .fishing:                      return "fish"
            case .functionalStrengthTraining:   return "dumbbell"
            case .golf:                         return "golfball"
            case .gymnastics:                   return "figure.gymnastics"
            case .handball:                     return "hand.raised"
            case .hiking:                       return "figure.hiking"
            case .hockey:                       return "hockey.puck"
            case .hunting:                      return "target"
            case .lacrosse:                     return "lacrosse.stick"
            case .martialArts:                  return "figure.kickboxing"
            case .mindAndBody:                  return "person.and.arrow.left.and.arrow.right"
            case .mixedMetabolicCardioTraining: return "heart.circle"
            case .paddleSports:                 return "paddle"
            case .play:                         return "play.circle"
            case .preparationAndRecovery:       return "figure.preparation"
            case .racquetball:                  return "sportscourt"
            case .rowing:                       return "figure.rowing"
            case .rugby:                        return "figure.rugby"
            case .running:                      return "figure.run"
            case .sailing:                      return "sailboat"
            case .skatingSports:                return "figure.skating"
            case .snowSports:                   return "snowflake"
            case .soccer:                       return "soccerball"
            case .softball:                     return "sportscourt"
            case .squash:                       return "racquetball"
            case .stairClimbing:                return "figure.stairs"
            case .surfingSports:                return "wave.3.right"
            case .swimming:                     return "figure.swimming"
            case .tableTennis:                  return "pingpong"
            case .tennis:                       return "tennis.racket"
            case .trackAndField:                return "figure.track"
            case .traditionalStrengthTraining:  return "dumbbell"
            case .volleyball:                   return "volleyball"
            case .walking:                      return "figure.walk"
            case .waterFitness:                 return "waveform"
            case .waterPolo:                    return "figure.waterpolo"
            case .waterSports:                  return "waveform"
            case .wrestling:                    return "figure.gym"
            case .yoga:                         return "figure.yoga"

            // iOS 10
            case .barre:                        return "figure.yoga"
            case .coreTraining:                 return "figure.core"
            case .crossCountrySkiing:           return "figure.crosscountry"
            case .downhillSkiing:               return "figure.skate"
            case .highIntensityIntervalTraining:return"lowercase"
            case .flexibility:                  return "fig.dance"
            case .cricket:
                <#code#>
            case .jumpRope:
                <#code#>
            case .kickboxing:
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
                return "fig.dance"
            }
        }
    
    var color: Color {
            switch self {
            case .americanFootball:             return .brown
            case .archery:                      return .green
            case .australianFootball:           return .orange
            case .badminton:                    return .purple
            case .baseball:                     return .blue
            case .basketball:                   return .red
            case .bowling:                      return .teal
            case .boxing:                       return .gray
            case .climbing:                     return .indigo
            case .crossTraining:                return .yellow
            case .curling:                      return .gray
            case .cycling:                      return .cyan
            case .dance:                        return .pink
            case .danceInspiredTraining:        return .pink
            case .elliptical:                   return .gray
            case .equestrianSports:             return .brown
            case .fencing:                      return .green
            case .fishing:                      return .blue
            case .functionalStrengthTraining:   return .gray
            case .golf:                         return .green
            case .gymnastics:                   return .pink
            case .handball:                     return .red
            case .hiking:                       return .brown
            case .hockey:                       return .cyan
            case .hunting:                      return .green
            case .lacrosse:                     return .orange
            case .martialArts:                  return .gray
            case .mindAndBody:                  return .teal
            case .mixedMetabolicCardioTraining: return .purple
            case .paddleSports:                 return .blue
            case .play:                         return .yellow
            case .preparationAndRecovery:       return .gray
            case .racquetball:                  return .purple
            case .rowing:                       return .blue
            case .rugby:                        return .orange
            case .running:                      return .red
            case .sailing:                      return .cyan
            case .skatingSports:                return .gray
            case .snowSports:                   return .teal
            case .soccer:                       return .green
            case .softball:                     return .yellow
            case .squash:                       return .purple
            case .stairClimbing:                return .gray
            case .surfingSports:                return .blue
            case .swimming:                     return .blue
            case .tableTennis:                  return .orange
            case .tennis:                       return .green
            case .trackAndField:                return .red
            case .traditionalStrengthTraining:  return .gray
            case .volleyball:                   return .orange
            case .walking:                      return .green
            case .waterFitness:                 return .cyan
            case .waterPolo:                    return .blue
            case .waterSports:                  return .cyan
            case .wrestling:                    return .gray
            case .yoga:                         return .purple

            // iOS 10
            case .barre:                        return .pink
            case .coreTraining:                 return .yellow
            case .crossCountrySkiing:           return .teal
            case .downhillSkiing:               return .cyan
            case .flexibility:                  return .purple
            case .highIntensityIntervalTraining:return .red
            case .jumpRope:                     return .green
            case .kickboxing:                   return .gray
            case .pilates:                      return .pink
            case .snowboarding:                 return .teal
            case .stairs:                       return .gray
            case .stepTraining:                 return .yellow
            case .wheelchairWalkPace:           return .blue
            case .wheelchairRunPace:            return .red

            // iOS 11
            case .taiChi:                       return .purple
            case .mixedCardio:                  return .red
            case .handCycling:                  return .gray

            // iOS 13
            case .discSports:                   return .yellow
            case .fitnessGaming:                return .orange

            // Catch-all
            default:                            return .gray
            }
        }

}
