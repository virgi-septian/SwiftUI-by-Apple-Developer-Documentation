//
//  SelectMultipleDates.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 02/08/25.
//

import SwiftUI

struct SelectMultipleDates: View {
    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []

    var body: some View {
//        MultiDatePicker("Select your preferred dates", selection: $dates)
        /// However, chances are you’re going to want to convert those date components to real dates, in which case you’ll want to read the user’s calendar from the environment and convert the data as needed:
//        VStack {
//            MultiDatePicker("Select your preferred dates", selection: $dates)
//
//            Text(summary)
//        }
//        .padding()
        
        /// By default, the user is able to choose any dates they like, but you can also restrict their selection to a range of your choosing. For example, this code allows them to select any date from today onwards, but nothing earlier:
        VStack {
            MultiDatePicker("Select your preferred dates", selection: $dates, in: Date.now...)

            Text(summary)
        }
        .padding()
    }
    
    var summary: String {
       dates.compactMap { components in
           calendar.date(from: components)?.formatted(date: .long, time: .omitted)
       }.formatted()
    }
}

#Preview {
    SelectMultipleDates()
}
