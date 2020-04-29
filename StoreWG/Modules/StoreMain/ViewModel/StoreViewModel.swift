//
//  StoreViewModel.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class StoreViewModel {
    
    private var manager = StoreManager()
        
    var counterList: [Counter] {
        get {
            return manager.counterList
        }
        set {
            manager.counterList = newValue
        }
    }
    
    var counterListCount: Int {
        return counterList.count
    }
    
    var totalString: String {
        return String(counterList.map({$0.count ?? 0}).reduce(0, +))
    }
    
    func getCounters(handler: CallServiceHandler) {
        manager.getCounters(handler: handler)
    }
    
    func callDecCounter(_ counter: Counter?, handler: CallServiceHandler) {
        manager.callDecCounter(counter: counter, handler: handler)
    }
    
    func callIncCounter(_ counter: Counter?, handler: CallServiceHandler) {
        manager.callIncCounter(counter: counter, handler: handler)
    }
    
    func deleteCounter(_ counter: Counter?, handler: CallServiceHandler) {
        manager.deleteCounter(counter: counter, handler: handler)
    }

}
