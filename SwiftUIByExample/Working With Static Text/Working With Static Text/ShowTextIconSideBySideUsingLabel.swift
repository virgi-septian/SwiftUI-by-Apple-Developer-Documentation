//
//  ShowText&IconSideBySideUsingLabel.swift
//  Working With Static Text
//
//  Created by Virgi Septian on 14/05/25.
//

import SwiftUI

struct ShowTextIconSideBySideUsingLabel: View {
    var body: some View {
        List {
            Section {
                Label("Your account", systemImage: "folder.circle")
            }
            
            Section {
                Label("Welcome to the app", image: "star")
            }
            
            Section {
                Label("Your account", systemImage: "person.crop.circle")
                    .font(.title)
            }
            
            Section {
                VStack {
                    Label("Text Only", systemImage: "heart")
                        .font(.title)
                        .labelStyle(.titleOnly)

                    Label("Icon Only", systemImage: "star")
                        .font(.title)
                        .labelStyle(.iconOnly)

                    Label("Both", systemImage: "paperplane")
                        .font(.title)
                        .labelStyle(.titleAndIcon)
                }
            }
            
            Section {
                Label {
                    Text("Paul Hudson")
                        .foregroundStyle(.primary)
                        .font(.largeTitle)
                        .padding()
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                } icon: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: 64, height: 64)
                }
            }
        }
    }
}

#Preview {
    ShowTextIconSideBySideUsingLabel()
}
