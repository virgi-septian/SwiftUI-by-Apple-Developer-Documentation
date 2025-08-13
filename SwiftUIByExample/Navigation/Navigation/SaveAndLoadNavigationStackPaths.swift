//
//  SaveAndLoadNavigationStackPaths.swift
//  Navigation
//
//  Created by Virgi Septian on 13/08/25.
//

import SwiftUI

class PathStore: ObservableObject {
    @Published var path = NavigationPath() {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")

    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
    }

    func save() {
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct DetailView2: View {
    var id: Int

    var body: some View {
        VStack {
            Text("View \(id)")
                .font(.largeTitle)
            NavigationLink("Jump to random", value: Int.random(in: 1...100))
        }
    }
}

struct SaveAndLoadNavigationStackPaths: View {
    @StateObject private var pathStore = PathStore()
    var body: some View {
        /// When managing SwiftUI’s NavigationStack path using a NavigationPath object, we can save and load our whole path using Codable – we can store the complete navigation stack and restore it later, so the user comes back to the app exactly where they left it.
        
        /// This is best handled by wrapping up your storage in a separate ObservableObject class, which can take the responsibility of loading and saving path data away from your views. For example, this class loads a saved when it’s created, and saves the path whenever its NavigationPath property gets changed:
        NavigationStack(path: $pathStore.path) {
            DetailView2(id: 0)
                .navigationDestination(for: Int.self, destination: DetailView2.init)
                .navigationTitle("Navigation")
        }
    }
}

#Preview {
    SaveAndLoadNavigationStackPaths()
}
