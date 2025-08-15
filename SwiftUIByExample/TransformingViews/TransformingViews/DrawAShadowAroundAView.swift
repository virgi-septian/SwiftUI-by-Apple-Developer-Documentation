//
//  DrawAShadowAroundAView.swift
//  TransformingViews
//
//  Created by Virgi Septian on 15/08/25.
//

import SwiftUI

struct DrawAShadowAroundAView: View {
    var body: some View {
        /// SwiftUI gives us two ways of creating shadows: we can attach shadows directly to shape styles, but there’s also a dedicated shadow() modifier to draw shadows around views.
//        Circle()
//            .fill(.red.shadow(.drop(color: .black, radius: 10)))
//            .padding()
        
        /// And you can create inner shadows for those shapes just as easily:
//        Circle()
//            .fill(.blue.shadow(.inner(color: .black, radius: 100)))
//            .overlay {
//                Circle()
//                    .frame(width: 100, height: 100)
//            }
        
        /// If you want to attach a shadow to other kinds of views, you should use the shadow() modifier instead. In its basic form, you can add a shadow just by specifying the radius of the blur,
        Text("Testing")
            .foregroundStyle(.black)
            .padding()
            .shadow(color: .black, radius: 2)
            .border(.red, width: 4)
            .background(.white)
        
        /// You can also specify which color you want along with the X and Y offset from the original view. For example, this creates a strong red shadow with a 5-point blur, centered on the text:
        Text("TEsting 2")
            .padding()
            .shadow(color: .red, radius: 5)
            .border(.red, width: 4)
        
        /// If you want to specify offsets for the shadow, add x and/or y parameters to the modifier, like this:
        Text("Testing 3")
            .padding()
            .shadow(color: .red, radius: 3, x: 4, y: 8)
            .border(.red, width: 9)
        
        /// SwiftUI applies modifiers in the order you list them, so if you want you can have your shadow apply to the border as well just by putting the border modifier before the shadow modifier:
        Text("Testing 4")
            .padding()
            .border(.red, width: 4)
            .shadow(color: .black, radius: 2, x: 4, y: 4)
        /// Tip: If you find your shadow effect isn’t strong enough, add another shadow() modifier – you can stack them up to create more complex shadow effects.
    }
}

#Preview {
    DrawAShadowAroundAView()
}
