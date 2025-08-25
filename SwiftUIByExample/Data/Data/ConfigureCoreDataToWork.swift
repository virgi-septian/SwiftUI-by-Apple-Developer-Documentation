//
//  ConfigureCoreDataToWork.swift
//  Data
//
//  Created by Virgi Septian on 22/08/25.
//

import SwiftUI
import CoreData

struct ConfigureCoreDataToWork: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
//    @FetchRequest(
//        sortDescriptors: [SortDescriptor(\.name)]
//      predicate: NSPredicate(format: "name == %@", "Example Language 3")
//    ) var languages: FetchedResults<ProgrammingLanguage>
    
    @FetchRequest var languages: FetchedResults<ProgrammingLanguage>
        
//    init() {
//        let request: NSFetchRequest<ProgrammingLanguage> = ProgrammingLanguage.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true)]
//        request.fetchLimit = 10
//        
//        // inisialisasi property wrapper @FetchRequest
//        _languages = FetchRequest(fetchRequest: request)
//    }
    
    /// if we wanted to have filtering, sorting, and row limiting

    init() {

        let request: NSFetchRequest<ProgrammingLanguage> = ProgrammingLanguage.fetchRequest()
        request.predicate = NSPredicate(format: "creator == %@", "A. Programmer")

        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \ProgrammingLanguage.name, ascending: true)
        ]

        request.fetchLimit = 10
        _languages = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        NavigationStack {
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
                .toolbar {
                    EditButton()
                }
            }
        }
    }
    
    func removeLanguages(at offsets: IndexSet) {
        for index in offsets {
            let language = languages[index]
            managedObjectContext.delete(language)
            
            do {
                try managedObjectContext.save()
                PersistenceController.shared.save()
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
