//
//  create a document-basedApp.swift
//  Data
//
//  Created by Virgi Septian on 25/08/25.
//

import SwiftUI
import UniformTypeIdentifiers

//struct TextFile: FileDocument {
//    // tell the system we support only plain text
//    static var readableContentTypes = [UTType.plainText]
//
//    // by default our document is empty
//    var text = ""
//
//    // a simple initializer that creates new, empty documents
//    init(initialText: String = "") {
//        text = initialText
//    }
//
//    // this initializer loads data that has been saved previously
//    init(configuration: ReadConfiguration) throws {
//        if let data = configuration.file.regularFileContents {
//            text = String(decoding: data, as: UTF8.self)
//        } else {
//            throw CocoaError(.fileReadCorruptFile)
//        }
//    }
//
//    // this will be called when the system wants to write our data to disk
//    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
//        let data = Data(text.utf8)
//        return FileWrapper(regularFileWithContents: data)
//    }
//}

struct TextFile: FileDocument {
    // tell the system we support only plain text
    static var readableContentTypes = [UTType.plainText]

    // by default our document is empty
    var text = ""

    // a simple initializer that creates new, empty documents
    init(initialText: String = "") {
        text = initialText
    }

    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }

    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}

struct CreateADocumentBasedApp: View {
    @State private var showingExporter = false
    @Binding var document: TextFile
    var body: some View {
        VStack {
            TextEditor(text: $document.text)
                .padding()
        }
        .toolbar {
            Button("Export") {
                showingExporter = true
            }
        }
        .fileExporter(
            isPresented: $showingExporter,
            document: document,
            contentType: .plainText
        ) { result in
            switch result {
            case .success(let url):
                print("Saved to \(url)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    CreateADocumentBasedApp(
        document: .constant(TextFile(initialText: "Hello from Preview!"))
    )
}
