//
//  ProductViewModel.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class ProductViewModel {
    
    private var manager = StoreManager()
    
    var counter: Counter?
    
    var counterList: [Counter] {
        return manager.counterList
    }
    
    init(counter: Counter?) {
        self.counter = counter
    }
    
    func callDecCounter(handler: CallServiceHandler) {
        manager.callDecCounter(counter: counter, handler: handler) // TODO: Check me
    }

}
