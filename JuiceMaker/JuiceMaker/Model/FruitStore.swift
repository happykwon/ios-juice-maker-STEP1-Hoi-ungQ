//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [String: Int] = [
        "딸기": 10,
        "바나나": 10,
        "파인애플": 10,
        "키위": 10,
        "망고": 10
    ]
    func updateFruitQuantity(fruit: String, quantity: Int) {
        if let currentQuantity = fruitInventory[fruit] {
            fruitInventory[fruit] = max(0, currentQuantity + quantity)
        }
    }
    func checkAvailability(for juiceIngredients: [String: Int]) -> Bool {
        for (fruit, requiredQuantity) in juiceIngredients {
            guard let availableQuantity = fruitInventory[fruit], requiredQuantity <= availableQuantity else {
                return false
            }
        }
        return true
    }
    func makeJuice(type: JuiceRecipe) -> String {
        var  ingredients = type.ingredients
        for (fruit, quantity) in ingredients {
            guard let available = fruitInventory[fruit], available >= quantity else {
                return "재료가 부족하여 \(type.name)를 제조할 수 없습니다."
            }
        }
        for (fruit, quantity) in ingredients {
            if let available = fruitInventory[fruit], let currentQuantity = fruitInventory[fruit], available >= quantity {
                fruitInventory[fruit] = currentQuantity - quantity
            }
        }
        return "\(type.name)가 제조되었습니다."
    }
    
}
