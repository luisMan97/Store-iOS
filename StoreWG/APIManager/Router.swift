//
//  Router.swift
//  StoreWG
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import Foundation

enum ApiManagerConstants {
    enum keys {
        static let endpoint = "http://localhost:3000/api/v1/"
    }
}

enum Router {
    
    case Counters
    case Dec([String: Any])
    case Inc([String: Any])
    case DeleteCounter([String: Any])
    case AddCounter([String: Any])
    
    private var method: String {
        switch self {
        case .Counters:
            return "GET"
        case .Dec,
             .Inc,
            .AddCounter:
            return "POST"
        case .DeleteCounter:
            return "DELETE"
        }
    }
    
    private var path: String {
        switch self {
        case .Counters:
            return "counters"
        case .DeleteCounter,
             .AddCounter:
            return "counter"
        case .Dec:
            return "counter/dec"
        case .Inc:
            return "counter/inc"
        }
    }
    
    var request: URLRequest {
        guard let url = URL(string: ApiManagerConstants.keys.endpoint) else {
            return URLRequest(url: URL(fileURLWithPath: ""))
        }
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method
        
        switch self {
        case .Counters:
            return request
        case .Dec(let params),
             .Inc(let params),
             .DeleteCounter(let params),
             .AddCounter(let params):
            let jsonString = params.reduce("") { "\($0)\($1.0)=\($1.1)&" }
            let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false)!
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
            request.httpBody  = jsonData
            return request
        }
    }
}
