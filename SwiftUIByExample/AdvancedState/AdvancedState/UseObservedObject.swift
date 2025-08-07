//
//  UseObservedObject.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI
/// Tip: It is really important that you use @ObservedObject only with views that were passed in from elsewhere. You should not use this property wrapper to create the initial instance of an observable object – that’s what @StateObject is for.

class UserProgress: ObservableObject {
    @Published var score = 0
}

/// SwiftUI is doing a remarkable amount on our behalf! There are two things that matter in there:

/// - The ObservableObject conformance allows instances of this class to be used inside views, so that when important changes happen the view will reload.

/// - The @Published property wrapper tells SwiftUI that changes to score should trigger view reloads.
struct InnerView: View {
    @ObservedObject var progress: UserProgress

    var body: some View {
        Button("Increase Score") {
            progress.score += 1
        }
    }
}

struct UseObservedObject: View {
    @StateObject var progress = UserProgress()

    var body: some View {
        VStack {
            Text("Your score is \(progress.score)")
            InnerView(progress: progress)
        }
    }
}

#Preview {
    UseObservedObject()
}
