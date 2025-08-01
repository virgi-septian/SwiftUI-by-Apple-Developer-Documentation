//
//  CreateADatePicker.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 01/08/25.
//

import SwiftUI

struct CreateADatePicker: View {
//    @State private var birthDate = Date.now
//
//    var body: some View {
//        VStack {
//            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
//                Text("Select a date")
//            }
//
//            Text("Date is \(birthDate.formatted(date: .long, time: .omitted))")
//        }
//    }
    
    /// Important: If you’re using Xcode 12 you should create and use your own local date formatter, like this:
//    let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        return formatter
//    }()
//
//    @State private var birthDate = Date.now
//
//    var body: some View {
//        VStack {
//            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
//                Text("Select a date")
//            }
//
//            Text("Date is \(birthDate, formatter: dateFormatter)")
//        }
//    }
    
    /// From iOS 14 onwards, you can use the new GraphicalDatePickerStyle() to get a more advanced date picker, that shows a calendar plus space to enter a precise time:
    @State private var date = Date.now

    var body: some View {
        VStack {
            Text("Enter your birthday")
                .font(.largeTitle)
            DatePicker("Enter your birthday", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
        }
    }
}

#Preview {
    CreateADatePicker()
}
