//
//  AnimateSFSymbols.swift
//  ImagesShapesMedia
//
//  Created by Virgi Septian on 04/07/25.
//

import SwiftUI

struct AnimateSFSymbols: View {
    @State private var petCount: Double = 0
    @State private var isFavorite = false
    @State private var isFavorite2 = false
    @State private var isFavorite3 = false
    @State private var animate = false
    @State private var animationsRunning = false
    var body: some View {
        VStack {
            Text("How to animate SF Symbols")
            List {
                Section {
                    Button {
                        petCount += 1
                    } label: {
                        Label("Pet the Dog", systemImage: "dog")
                    }
                    .symbolEffect(.bounce, value: petCount)
                    .font(.largeTitle)
                }
                
                Section {
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Label("Activate Inbox Zero", systemImage: "mail.stack")
                    }
                    .symbolEffect(.bounce.down, value: isFavorite)
                    .font(.largeTitle)
                }
                
                Section {
                    Button {
                        animate.toggle()
                    } label: {
                        Image(systemName: "arrow.clockwise.square")
                            .symbolEffect(.rotate, value: animate)
                            .font(.largeTitle)
                    }
                }
                
                Section {
                    Button {
                        isFavorite2.toggle()
                    } label: {
                        Label("Activate Inbox Zero", systemImage: "mail.stack")
                    }
                    .symbolEffect(.bounce, options: .speed(3).repeat(3), value: isFavorite2)
                    .font(.largeTitle)
                }
                
                Section {
                    Button("Start Animations") {
                        withAnimation {
                            animationsRunning.toggle()
                        }
                    }

                    VStack {
                        HStack {
                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.iterative, value: animationsRunning)

                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.cumulative, value: animationsRunning)

                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.reversing.iterative, value: animationsRunning)

                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.reversing.cumulative, value: animationsRunning)
                        }

                        HStack {
                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.iterative, options: .repeating, value: animationsRunning)

                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.cumulative, options: .repeat(3), value: animationsRunning)

                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.reversing.iterative, options: .speed(3), value: animationsRunning)

                            Image(systemName: "square.stack.3d.up")
                                .symbolEffect(.variableColor.reversing.cumulative, options: .repeat(3).speed(3), value: animationsRunning)
                        }
                    }
                    .font(.largeTitle)
                }
                
                Section {
                    VStack {
                        Button {
                            withAnimation {
                                isFavorite3.toggle()
                            }
                        } label: {
                            Label("Toggle Favorite", systemImage: isFavorite3 ? "checkmark": "heart")
                        }
                        .contentTransition(.symbolEffect(.replace))
                    }
                    .font(.largeTitle)
                }
            }
        }
    }
}

#Preview {
    AnimateSFSymbols()
}
