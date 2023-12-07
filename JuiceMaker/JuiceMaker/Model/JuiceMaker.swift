//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(_ juice: Juice) -> Bool {
        switch juice {
        case .strawberry:
            return fruitStore.removeFruits(.strawberry, quantity: 16)
        case .banana:
            return fruitStore.removeFruits(.banana, quantity: 2)
        case .kiwi:
            return fruitStore.removeFruits(.kiwi, quantity: 3)
        case .pineapple:
            return fruitStore.removeFruits(.pineapple, quantity: 2)
        case .strawberryBanana:
            return fruitStore.removeFruits(.strawberry, quantity: 10) && fruitStore.removeFruits(.banana, quantity: 1)
        case .mango:
            return fruitStore.removeFruits(.mango, quantity: 3)
        case .mangoKiwi:
            return fruitStore.removeFruits(.mango, quantity: 2) && fruitStore.removeFruits(.kiwi, quantity: 1)
        }
    }
}

var test2 = JuiceMaker()

