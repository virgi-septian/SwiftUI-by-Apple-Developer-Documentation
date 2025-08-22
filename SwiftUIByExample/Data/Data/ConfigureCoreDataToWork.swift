//
//  ConfigureCoreDataToWork.swift
//  Data
//
//  Created by Virgi Septian on 22/08/25.
//

import SwiftUI

struct ConfigureCoreDataToWork: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.name)]
//        predicate: NSPredicate(format: "name == %@", "Example Language 3")
    ) var languages: FetchedResults<ProgrammingLanguage>
    
    var body: some View {
        Button("Insert example language") {
            let language = ProgrammingLanguage(context: managedObjectContext)
            language.name = "Python"
            language.creator = "Guido van Rossum"
            // more code here
//            PersistenceController.shared.save()
            do {
                try managedObjectContext.save()
            } catch {
                // handle the Core Data error
            }
        }
        
        VStack {
            List {
                ForEach(languages) { language in
                    Text("Creator: \(language.creator ?? "Anonymous")")
                }
                .onDelete(perform: removeLanguages)
            }
        }
    }
    
    func removeLanguages(at offsets: IndexSet) {
        for index in offsets {
            let language = languages[index]
            managedObjectContext.delete(language)
            
            do {
                try managedObjectContext.save()
            } catch {
                // handle the Core Data error
            }
        }
    }
}

#Preview {
    ConfigureCoreDataToWork()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
