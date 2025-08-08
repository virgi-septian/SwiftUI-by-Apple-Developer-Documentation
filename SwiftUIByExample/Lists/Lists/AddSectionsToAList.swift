//
//  AddSectionsToAList.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

struct TaskRow: View {
    var body: some View {
        Text("Task data goes here")
    }
}

struct AddSectionsToAList: View {
    var body: some View {
        /// As an example, we could create a row that holds task data for a reminders app, then create a list view that has two sections: one for important tasks and one for less important tasks.
        List {
            Section(header: Text("Importan Data")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }
            
            Section(header: Text("Other tasks")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }
            
            /// You can also add footer text to sections, like this:
            Section(header: Text("Other tasks"), footer: Text("End")) {
                TaskRow()
                TaskRow()
                TaskRow()
            }
        }
        
        /// By default your section headers will match the default iOS style, but you can request larger, bolder section text using the headerProminence() modifier and specifying .increased, like this:
        List {
            Section(header: Text("Tasks")) {
                Text("Row")
            }
            .headerProminence(.increased)
            /// If you're targeting iOS 26 or later, you can use the listSectionMargins() modifier to add custom margins to individual sections, like this:
//            .listSectionMargins(.bottom, 150)
            /// This is particularly useful for places when you have a large hero section at the top – perhaps with some background color or image – that must be treated separately from other sections.
        }
        .listStyle(.grouped)
    }
}

#Preview {
    AddSectionsToAList()
}
