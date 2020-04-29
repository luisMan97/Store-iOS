//
//  StoreManager.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class StoreManager {
    
    var counterList: [Counter] = []
    
    private let manager = APIManager()
    
    func getCounters(handler: CallServiceHandler) {
        manager.callServiceObject(service: .Counters) { [weak self] (data, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            if let error = error {
                handler?(false, error)
            } else if let data = data {
                do {
                    strongSelf.counterList = try JSONDecoder().decode([Counter].self, from: data)
                } catch let jsonError {
                    let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
                    handler?(false, error)
                }
                handler?(true, nil)
            } else {
                handler?(nil, nil)
            }
        }
    }
    
    func callDecCounter(counter: Counter?, handler: CallServiceHandler) {
        let parameters = ["id": counter?.id] as [String: AnyObject]
        manager.callServiceObject(service: .Dec(parameters)) { [weak self] (data, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            if let error = error {
                handler?(false, error)
            } else if let data = data {
                do {
                    strongSelf.counterList = try JSONDecoder().decode([Counter].self, from: data)
                } catch let jsonError {
                    let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
                    handler?(false, error)
                }
                handler?(true, nil)
            } else {
                handler?(nil, nil)
            }
        }
    }
    
    func callIncCounter(counter: Counter?, handler: CallServiceHandler) {
        let parameters = ["id": counter?.id] as [String: AnyObject]
        manager.callServiceObject(service: .Inc(parameters)) { [weak self] (data, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            if let error = error {
                handler?(false, error)
            } else if let data = data {
                do {
                    strongSelf.counterList = try JSONDecoder().decode([Counter].self, from: data)
                } catch let jsonError {
                    let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
                    handler?(false, error)
                }
                handler?(true, nil)
            } else {
                handler?(nil, nil)
            }
        }
    }
    
    func deleteCounter(counter: Counter?, handler: CallServiceHandler) {
        let parameters = ["id": counter?.id] as [String: AnyObject]
        manager.callServiceObject(service: .DeleteCounter(parameters)) { [weak self] (data, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            if let error = error {
                handler?(false, error)
            } else if let data = data {
                do {
                    strongSelf.counterList = try JSONDecoder().decode([Counter].self, from: data)
                } catch let jsonError {
                    let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
                    handler?(false, error)
                }
                handler?(true, nil)
            } else {
                handler?(nil, nil)
            }
        }
    }
    
    func addCounter(title: String, handler: CallServiceHandler) {
        let parameters = ["title": title] as [String: AnyObject]
        manager.callServiceObject(service: .AddCounter(parameters)) { [weak self] (data, error) in
            guard let strongSelf = self else {
                handler?(nil, nil)
                return
            }
            
            if let error = error {
                handler?(false, error)
            } else if let data = data {
                do {
                    strongSelf.counterList = try JSONDecoder().decode([Counter].self, from: data)
                } catch let jsonError {
                    let error = NSError(domain: "error", code: 00, userInfo: [NSLocalizedDescriptionKey: "Error serializacion json \(jsonError)"])
                    handler?(false, error)
                }
                handler?(true, nil)
            } else {
                handler?(nil, nil)
            }
        }
    }

}
