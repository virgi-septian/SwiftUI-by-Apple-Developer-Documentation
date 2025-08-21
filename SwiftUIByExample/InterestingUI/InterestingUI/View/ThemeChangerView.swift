//
//  ThemeChangerView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct ThemeChangeView: View {
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault

    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "moonphase.first.quarter")
                .imageScale(.large)

            Text("New! Maps in Dark Mode")
                .font(.headline)

            ForEach(Theme.allCases, id: \.rawValue) {
                
            }

            Button {
                
            } label: {
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .overlay {
                
            }
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 360)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal, 15)
    }
}

#Preview {
    ThemeChangeView()
}
