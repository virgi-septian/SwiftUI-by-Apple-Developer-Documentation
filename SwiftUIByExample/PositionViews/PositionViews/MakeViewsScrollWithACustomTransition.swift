//
//  MakeViewsScrollWithACustomTransition.swift
//  PositionViews
//
//  Created by Virgi Septian on 25/07/25.
//

import SwiftUI

struct MakeViewsScrollWithACustomTransition: View {
    var body: some View {
        ScrollView {
            ForEach(0..<10) { i in
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(height: 80)
                    .scrollTransition(transition: { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1 : 0)
                            .scaleEffect(phase.isIdentity ? 1 : 0.8)
                            .blur(radius: phase.isIdentity ? 0 : 10)
                    })
                    .padding(.horizontal)
            }
        }
        
        Divider()
        
        /// For additional control, you can specify how much of the view needs to be visible before it’s displayed or removed. For example, we could say that we want our scrolling views to be inserted into our view hierarchy only when they are at least 90% visible:
        
        ScrollView {
            ForEach(0..<10) { i in
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(height: 80)
                    .scrollTransition(.animated.threshold(.visible(0.9))) { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1 : 0)
                            .scaleEffect(phase.isIdentity ? 1 : 0.75)
                            .blur(radius: phase.isIdentity ? 0 : 10)
                    }
                    .padding(.horizontal)
            }
        }
        
        /// If you need very precise control over the effects that are applied, read the value of the transition phase. This will be -1 for views in the top leading phase, 1 for views in the bottom trailing phase, and 0 for all other views.
        
        /// For example, this gently modifies the hue of each scrolling shape by combining phase.value with the hueRotation() modifier:
        
        ScrollView {
            ForEach(0..<10) { i in
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(height: 80)
                    .shadow(radius: 3)
                    .scrollTransition { content, phase in
                        content
                            .hueRotation(.degrees(90 * phase.value))
                    }
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MakeViewsScrollWithACustomTransition()
}
