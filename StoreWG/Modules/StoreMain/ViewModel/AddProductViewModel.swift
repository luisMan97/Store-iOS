//
//  AddProductViewModel.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 29/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class AddProductViewModel {
    
    private var manager = StoreManager()
    
    var counterList: [Counter] {
        return manager.counterList
    }
    
    func addCounter(title: String?, handler: CallServiceHandler) {
        guard let title = title, title.count != 0 else {
            let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "The product field is required"])
            handler?(nil, error)
            return
        }
        manager.addCounter(title: title, handler: handler) 
    }

}
