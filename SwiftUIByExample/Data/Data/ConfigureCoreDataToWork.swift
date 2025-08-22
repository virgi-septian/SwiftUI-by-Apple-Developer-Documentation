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
        sortDescriptors: [SortDescriptor(\.name)],
        predicate: NSPredicate(format: "name == %@", "Example Language 3")
    ) var languages: FetchedResults<ProgrammingLanguage>
    
    var body: some View {
        VStack {
            List(languages) { language in
                Text(language.name ?? "Unknown")
            }
        }
    }
}

#Preview {
    ConfigureCoreDataToWork()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
