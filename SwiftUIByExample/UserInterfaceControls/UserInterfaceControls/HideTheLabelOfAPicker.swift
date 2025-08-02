//
//  HideTheLabelOfAPicker.swift
//  UserInterfaceControls
//
//  Created by Virgi Septian on 02/08/25.
//

import SwiftUI

///   Tip: If you want all your labels hidden you can apply the labelsHidden() modifier to a VStack or whatever you’re using as your outermost container.
struct HideTheLabelOfAPicker: View {
    @State private var selectedNumber = 0
    var body: some View {
        Picker("Select a number", selection: $selectedNumber) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
        
        Divider()
        /// To hide the label for a Picker – or indeed for a DatePicker, a Stepper, a Toggle, or any other view that requires a label – you should add the labelsHidden() modifier to the view, like this:
        
        Picker("Select a number", selection: $selectedNumber) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
        .labelsHidden()
        
        Divider()

        /// In case you were curious, the wrong way to hide labels is using EmptyView, like this:
        Picker(selection: $selectedNumber, label: EmptyView()) {
            ForEach(0..<10) {
                Text("\($0)")
            }
        }
    }
}

#Preview {
    HideTheLabelOfAPicker()
}
