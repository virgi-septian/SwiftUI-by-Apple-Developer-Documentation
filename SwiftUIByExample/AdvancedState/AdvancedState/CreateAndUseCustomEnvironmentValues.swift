//
//  CreateAndUseCustomEnvironmentValues.swift
//  AdvancedState
//
//  Created by Virgi Septian on 07/08/25.
//

import SwiftUI

/// The first step is to make an extension on EnvironmentValues, using @Entry inside there to create your custom environment key, give it a type, and also give it a default value:
extension EnvironmentValues {
    @Entry var iconColor: Color = .red
}
/// The @Entry macro automatically turns that into a fully fledged environment key and value, meaning that we can now use environment(\.iconColor, .blue) to set a value, and @Environment(\.iconColor) to read that value back out, like this:
struct BubblesView: View {
    @Environment(\.iconColor) var iconColor

    var body: some View {
        Image(systemName: "bubbles.and.sparkles.fill")
            .foregroundStyle(iconColor)
            .font(.largeTitle)
    }
}

struct CreateAndUseCustomEnvironmentValues: View {
    var body: some View {
        HStack {
           BubblesView()
               .environment(\.iconColor, .blue)

           BubblesView()
               .environment(\.iconColor, .red)
       }
    }
}

#Preview {
    CreateAndUseCustomEnvironmentValues()
}
