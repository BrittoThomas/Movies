//
//  Request.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

struct Request {
    let scheme:String
    let host:String
    let path:String
    let queries:[URLQueryItem]
    let headers:Dictionary<String, String>
    let method:Method
    let paramters:Dictionary<String, String>
    

    var urlRequest:URLRequest?{
        if let url = URL.init(scheme: "", host: "", path: "", queries: []){
            let request = URLRequest(url: url)
            return request
        }
        return nil
    }
}

extension URL {
    init?(scheme:String, host:String, path:String, queries:[URLQueryItem]) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queries
        if let url = components.url {
           self = url
        }
        return nil
    }
}
