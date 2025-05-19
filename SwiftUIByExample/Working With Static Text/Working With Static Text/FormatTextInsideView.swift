//
//  FormatTextInsideView.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 09/05/25.
//

import SwiftUI

struct FormatTextInsideView: View {
    @State private var ingredients = [String]()
    @State private var rolls = [String]()
    let measurements = Measurement(value: 227, unit: UnitLength.centimeters)
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    let dueDate = Date.now
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text(ingredients, format: .list(type: .and))
                    
                    Button("Add ingredients") {
                        let possibleIngredients = ["Tomato", "Onion", "Cucumber"]
                        if let newIngridient = possibleIngredients.randomElement() {
                            if ingredients.count > 2 {
                                ingredients.removeFirst()
                            } else {
                                ingredients.append(newIngridient)
                            }
                        }
                        
                    }
                }
                
                Section {
                    Text(rolls, format: .list(type: .and))
                    
                    Button("rolls") {
                        let randomNumber = Int.random(in: 1...10)
                        if rolls.count > 8 {
                            rolls.removeFirst()
                        } else {
                            rolls.append(String(randomNumber))
                        }
                    }
                }
                
                Section {
                    Text(measurements, format: .measurement(width: .wide))
                }
                
                Section {
                    Text(43212, format: .currency(code: "CAD"))
                }
                
                Section {
                    Text("Task due to data \(dueDate, formatter: Self.taskDateFormat)")
                }
            }
            
            
        }
    }
}

#Preview {
    FormatTextInsideView()
}
