//
//  ThemeChangerView.swift
//  InterestingUI
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct ThemeChangeView: View {
    var scheme: ColorScheme
    @AppStorage("userTheme") private var userTheme: Theme2 = .systemDefault

    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "moonphase.first.quarter")
                .imageScale(.large)

            Text("New! Maps in Dark Mode")
                .font(.headline)

            ForEach(Theme2.allCases, id: \.rawValue) { theme in
                HStack {
                    Text(theme.rawValue)
                    Spacer()
                    
                    if userTheme == theme {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .onTapGesture {
                    userTheme = theme
                }
            }

            Button {
                
            } label: {
                Text("Save")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .overlay {
                Capsule()
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            }
            .padding()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 360)
        .background(.themeBG)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal, 15)
        .environment(\.colorScheme, scheme)
    }
}

//#Preview {
//    ThemeChangeView()
//}

enum Theme2: String, CaseIterable {
    case systemDefault = "Same as device setting"
    case light = "Always in light mode"
    case dark = "Always in dark mode"
    
    var colorScheme: ColorScheme? {
        switch self {
        case .systemDefault: return nil
        case .dark: return .dark
        case .light: return .light
        }
    }
}

#Preview {
    ThemeChanger()
}
