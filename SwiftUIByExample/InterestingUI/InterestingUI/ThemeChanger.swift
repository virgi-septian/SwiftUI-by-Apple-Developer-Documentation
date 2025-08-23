//
//  ThemeChanger.swift
//  InterestingUI
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct ThemeChanger: View {
    // View Properties
    @State private var changeTheme: Bool = false
    @AppStorage("userTheme") private var userTheme: Theme2 = .systemDefault
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
                .presentationDetents([.height(360)])
                .presentationBackground(.clear)
        })
    }
}

#Preview {
    ThemeChanger()
}
