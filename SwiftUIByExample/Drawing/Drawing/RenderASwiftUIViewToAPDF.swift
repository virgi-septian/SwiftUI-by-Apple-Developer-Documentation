//
//  RenderASwiftUIViewToAPDF.swift
//  Drawing
//
//  Created by Virgi Septian on 19/08/25.
//

import SwiftUI

@MainActor
struct RenderASwiftUIViewToAPDF: View {
    var body: some View {
        ShareLink("Export PDF", item: render())
    }
    
    func render() -> URL {
        // 1: Render Hello World with some modifiers
        let renderer = ImageRenderer(content:
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(Capsule())
        )

        // 2: Save it to our documents directory
        let url = URL.documentsDirectory.appending(path: "output.pdf")

        // 3: Start the rendering process
        renderer.render { size, context in
            // 4: Tell SwiftUI our PDF should be the same size as the views we're rendering
            var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)

            // 5: Create the CGContext for our PDF pages
            guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                return
            }

            // 6: Start a new PDF page
            pdf.beginPDFPage(nil)

            // 7: Render the SwiftUI view data onto the page
            context(pdf)

            // 8: End the page and close the file
            pdf.endPDFPage()
            pdf.closePDF()
        }

        return url
    }
}

#Preview {
    RenderASwiftUIViewToAPDF()
}
