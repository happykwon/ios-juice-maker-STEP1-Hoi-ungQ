//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
        
        NotificationCenter.default.addObserver(fruitStore, selector: #selector(FruitStore().handleNotification(_:)), name: Notification.Name.no, object: <#T##Any?#>)
        
        func makeJuice(type: JuiceRecipe) -> String {
            return fruitStore.makeJuice(juiceRecipe: type)
        }
    }
}
