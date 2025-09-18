//
//  LatteOrderManager.swift
//  InterestingUI
//
//  Created by Virgi Septian on 18/09/25.
//

import SwiftUI

class LatteOrderManager {
    var choise: LocalizedStringResource = ""
    var count: Int = 1
    var milkPercentage: Int = 20
    
    func orderLatte() async throws {
        /// Dummy Delay
        try? await Task.sleep(for: .seconds(1))
        print("Orderer latte with \(count) cups, \(milkPercentage)% milk, \(choise)")
    }
}

