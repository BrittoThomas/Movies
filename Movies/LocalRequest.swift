//
//  LocalRequest.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class LocalRequest {
    static var shared = LocalRequest()
    
    func read(fromFile fileName:String) -> Data?{
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
            return data
        }
        return nil
    }
}


