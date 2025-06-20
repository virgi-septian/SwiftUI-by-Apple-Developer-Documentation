//
//  Color & Opacity in SF Symbols.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 17/06/25.
//

import SwiftUI

struct ColorOpacityInSFSymbols: View {
    var body: some View {
        
        List {
            Section {
                Image(systemName: "theatermasks")
                    .symbolRenderingMode(.hierarchical)
                    .font(.system(size: 144))
            }
            
            Section {
                Image(systemName: "theatermasks")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.blue)
                    .font(.system(size: 144))
            }
            
            Section {
                Image(systemName: "shareplay")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .black)
                    .font(.system(size: 144))
            }
            
            Section {
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .green, .red)
                    .font(.system(size: 144))
            }
            
            Section {
                Image(systemName: "person.3.sequence.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(
                        .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
                        .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
                    )
                    .font(.system(size: 144))
            }
        }
        
    }
}

#Preview {
    ColorOpacityInSFSymbols()
}
