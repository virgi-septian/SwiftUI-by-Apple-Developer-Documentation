//
//  SearchTokenTextField.swift
//  Lists
//
//  Created by Virgi Septian on 08/08/25.
//

import SwiftUI

// MARK: - Represent UIView UISearchTextField
struct SearchTokenTextField: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UISearchTextField {
        let searchTextField = UISearchTextField()

        // Tambahkan token
        let appleToken = UISearchToken(icon: UIImage(systemName: "applelogo"), text: "Apple")
        let bananaToken = UISearchToken(icon: UIImage(systemName: "leaf"), text: "Banana")
        searchTextField.tokens = [appleToken, bananaToken]

        searchTextField.delegate = context.coordinator

        return searchTextField
    }

    func updateUIView(_ uiView: UISearchTextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}



// MARK: - SwiftUI View
struct SearchToken: View {
    @State private var searchText = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Search Text: \(searchText)")
                .padding()

            SearchTokenTextField(text: $searchText)
                .frame(height: 40)
                .padding(.horizontal)
        }
    }
}

// MARK: - Preview
struct SearchToken_Previews: PreviewProvider {
    static var previews: some View {
        SearchToken()
    }
}
