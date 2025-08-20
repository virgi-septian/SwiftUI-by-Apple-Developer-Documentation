//
//  OverrideAnimationsWithTransactions.swift
//  Animation
//
//  Created by Virgi Septian on 20/08/25.
//

import SwiftUI

struct OverrideAnimationsWithTransactions: View {
    @State private var isZoomed = false
    var body: some View {
        /// Transactions allow us to override existing animations on a case by case basis. For example, you might decide that in one particular circumstance you want the text’s animation to happen in a fast, linear way rather than it’s existing animation.
        
        /// To do that, first create a new Transaction instance using whatever animation you want, then set its disablesAnimations value to true so you override any existing animations that would apply. When you’re ready, call withTransaction() using your transaction object, then go ahead and adjust all the state you want to change – it will all be animated using your transaction.
//        VStack {
//            Button("Toggle Zoom") {
//                var transaction = Transaction(animation: .bouncy)
//                transaction.disablesAnimations = true
//
//                withTransaction(transaction) {
//                    isZoomed.toggle()
//                }
//            }
//
//            Spacer()
//                .frame(height: 100)
//
//            Text("Zoom Text")
//                .font(.title)
//                .scaleEffect(isZoomed ? 3 : 1)
//                .animation(.easeInOut(duration: 2), value: isZoomed)
//        }
        
        
        /// For even more control you can attach a transaction() modifier to any view you want, allowing you to override any transactions that apply to the view.
        
        /// For example, we could add a second zooming text view to our example, still using a transaction to trigger the zoom animation, but this time we’re going to use the transaction() modifier on the second text view so we disable any transactions on that one view – we’re overriding the override, in effect:
        VStack {
            Button("Toggle Zoom") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true

                withTransaction(transaction) {
                    isZoomed.toggle()
                }
            }

            Spacer()
                .frame(height: 100)

            Text("Zoom Text 1")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)

            Spacer()
                .frame(height: 100)

            Text("Zoom Text 2")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .transaction { t in
                    t.animation = .none
                }
        }
    }
}

#Preview {
    OverrideAnimationsWithTransactions()
}
