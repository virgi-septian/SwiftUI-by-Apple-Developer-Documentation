//
//  PositionViewsInAFixedGrid.swift
//  PositionViews
//
//  Created by Virgi Septian on 24/07/25.
//

import SwiftUI

struct PositionViewsInAFixedGrid: View {
    @State private var redScore = 0
    @State private var blueScore = 0
    var body: some View {
        ScrollView {
            LazyVStack {
                //MARK: - As a basic example, this creates a 2x2 grid with text reflecting where each cell with be positioned:
                Grid {
                    GridRow {
                        Text("Top Leading")
                            .background(.red)

                        Text("Top Trailing")
                            .background(.orange)
                    }

                    GridRow {
                        Text("Bottom Leading")
                            .background(.green)

                        Text("Bottom Trailing")
                            .background(.blue)
                    }
                }
                .font(.title)
            }
            
            Divider()
            
            /// First, if you do nothing, SwiftUI will automatically insert empty cells to make sure the rows are equal. So, in this code we can add to the red and blue scores freely, and SwiftUI will keep the whole thing balanced:
            Grid {
                GridRow {
                    Text("Red")

                    ForEach(0..<redScore, id: \.self) { _ in
                        Rectangle()
                            .fill(.red)
                            .frame(width: 20, height: 20)
                    }
                }

                GridRow {
                    Text("Blue")

                    ForEach(0..<blueScore, id: \.self) { _ in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .font(.title)

            Button("Add to Red") { redScore += 1 }
            Button("Add to Blue") { blueScore += 1 }
            
            Divider()
            /// The second option is to place views into the grid without wrapping them in a GridRow, which will cause them to occupy a whole row by themselves. This is great for the Divider view. The third option is to use the gridCellColumns() modifier, to make one cell span multiple columns.
            
            Grid {
                GridRow {
                    Text("Food")
                    Text("$200")
                }

                GridRow {
                    Text("Rent")
                    Text("$800")
                }

                GridRow {
                    Text("Candles")
                    Text("$3600")
                }

                Divider()

                GridRow {
                    Text("$4600")
                        .gridCellColumns(2)
                        .multilineTextAlignment(.trailing)
                }

            }
            .font(.title)
            
            Divider()
            /// Grids are fantastic choices when you need exact layouts – we can use them to make a tic-tac-toe board:
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    Image(systemName: "xmark")
                    Image(systemName: "xmark")
                    Image(systemName: "xmark")
                }

                GridRow {
                    Image(systemName: "circle")
                    Image(systemName: "xmark")
                    Image(systemName: "circle")
                }

                GridRow {
                    Image(systemName: "xmark")
                    Image(systemName: "circle")
                    Image(systemName: "circle")
                }
            }
            .font(.largeTitle)
            
            Divider()
            /// Chessboard
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                ForEach(0..<8) { row in
                    GridRow {
                        ForEach(0..<8) { col in
                            if (row + col).isMultiple(of: 2) {
                                Rectangle()
                                    .fill(.black)
                            } else {
                                Rectangle()
                                    .fill(.white)
                            }
                        }
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .border(.black, width: 1)
            .padding()
        }
    }
}

#Preview {
    PositionViewsInAFixedGrid()
}
