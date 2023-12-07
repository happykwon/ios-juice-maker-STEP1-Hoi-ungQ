//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation



// 과일 저장소 타입
class FruitStore {
    var fruitCount: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func addFruits(_ fruit: Fruit, number: Int) {
        fruitCount[fruit, default: 0] += number
    }
    func removeFruits(_ fruit: Fruit, quantity: Int) -> Bool {
        guard let currentCount = fruitCount[fruit], currentCount >= quantity else {
            return false
        }
        fruitCount[fruit] = currentCount - quantity
        return true
    }
}

