//
//  ContentView.swift
//  RespondingToEvents
//
//  Created by Virgi Septian on 04/08/25.
//

import SwiftUI

struct DetectWhenYourAppMoves: View {
    @Environment(\.scenePhase) var scenePhase

   var body: some View {
       Text("Example Text")
           .onChange(of: scenePhase) { newPhase in
               if newPhase == .inactive {
                   print("Inactive")
               } else if newPhase == .active {
                   print("Active")
               } else if newPhase == .background {
                   print("Background")
               }
           }
   }
}

#Preview {
    DetectWhenYourAppMoves()
}
