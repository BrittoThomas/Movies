//
//  NetworkRequest.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

class NetworkRequest {
    func request(request:Request, response:Response) {

        URLSession.shared.dataTask(with: request.urlRequest!) { (data, response, error) in
            
        }.resume()
    }
}
