//
//  APIManager.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

class APIManager {
    
    func callServiceObject(service: Router, completion: CallServiceHandlerWithData) {
        let session = URLSession(configuration: .default).dataTask(with: service.request) { [weak self] (data, response, error) -> Void in
            if let error = error {
                self?.logError(error)
                completion?(nil, error)
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "error", code: 404, userInfo: [NSLocalizedDescriptionKey: "error"])
                completion?(nil, error)
                return
            }
            
            if let dataAsStrin = String(data: data, encoding: .utf8) {
                print(dataAsStrin)
            }
            
            guard let response = response as? HTTPURLResponse else {
                let error = NSError(domain: "error", code: 404, userInfo: [NSLocalizedDescriptionKey: "error"])
                completion?(nil, error)
                return
            }
            
            if 200...299 ~= response.statusCode {
                completion?(data, nil)
            } else {
                let error = NSError(domain: "error", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "\(response.statusCode) error"])
                completion?(nil, error)
            }
        }
            
        session.resume()
    }
    
    private func logError(_ error: Error) {
        print("\n\n===========Error===========")
        print("Error Code: \(error._code)")
        print("Error Messsage: \(error.localizedDescription)")
        debugPrint(error as Any)
        print("===========================\n\n")
    }

}
