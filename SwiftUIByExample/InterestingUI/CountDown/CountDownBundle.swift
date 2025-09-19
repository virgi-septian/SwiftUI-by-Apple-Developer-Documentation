//
//  CountDownBundle.swift
//  CountDown
//
//  Created by Virgi Septian on 19/09/25.
//

import WidgetKit
import SwiftUI

@main
struct CountDownBundle: WidgetBundle {
    var body: some Widget {
        CountDownControl()
        CountDownLiveActivity()
    }
}
