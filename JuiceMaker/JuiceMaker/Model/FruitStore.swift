//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

//1. checkAvailability에서
//2. displayCurrentInventory = 남은재고 파악하는 메서드 추가하기



// 과일 저장소 타입
class FruitStore {
    var fruitInventory: [String: Int] = [
        "딸기": 10,
        "바나나": 10,
        "파인애플": 10,
        "키위": 10,
        "망고": 10
    ]
    func displayCurrentyFruitInventory() {
        for(fruit, quantity) in fruitInventory {
            print("\(fruit): 현재고:\(quantity)")
        }
    }
    
    let notificationName = Notification.Name("currentFruitInventory")
    
    func didChangeFruitInventory() {
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: fruitInventory)
        displayCurrentyFruitInventory()
    }
    
    @objc func handleNotification(_ notification: Notification) {
        didChangeFruitInventory()
    }
    
    func updateFruitQuantity(fruit: String, quantity: Int) {
        if let currentQuantity = fruitInventory[fruit] {
            fruitInventory[fruit] = max(0, currentQuantity + quantity)
        }
        displayCurrentyFruitInventory()
    }
    
    func checkAvailability(for juiceIngredients: [String: Int]) -> Bool {
        for (fruit, requiredQuantity) in juiceIngredients {
            guard let availableQuantity =
                    fruitInventory[fruit], requiredQuantity <= availableQuantity
            else { return false }
        }
        return true
    }
    
    func makeJuice(juiceRecipe: JuiceRecipe) -> String {
        var  ingredients = juiceRecipe.ingredients
        for (fruit, quantity) in ingredients {
            guard let available =
                    fruitInventory[fruit], available >= quantity
            else { return "재료가 부족하여 \(juiceRecipe.name)를 제조할 수 없습니다." }
        }
        for (fruit, quantity) in ingredients {
            if let available = fruitInventory[fruit], let currentQuantity = fruitInventory[fruit], available >= quantity {
                fruitInventory[fruit] = currentQuantity - quantity
            }
        }
        return "\(juiceRecipe.name)가 제조되었습니다."
    }
}
 



