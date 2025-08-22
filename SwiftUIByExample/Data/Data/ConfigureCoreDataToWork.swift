//
//  ConfigureCoreDataToWork.swift
//  Data
//
//  Created by Virgi Septian on 22/08/25.
//

import SwiftUI

struct ConfigureCoreDataToWork: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.name),
        SortDescriptor(\.creator, order: .reverse)
    ]) var languages: FetchedResults<ProgrammingLanguage>
    
    var body: some View {
        VStack {
            Text("TEst")
            
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
