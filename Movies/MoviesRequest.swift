//
//  MoviesRequest.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

class MoviesRequest {
    func load(moviesAt index: Int, completion:((MoviesResponse)->())){
        let fileName:String
        switch index % 3 {
        case 0:
            fileName = "CONTENTLISTINGPAGE-PAGE1"
        case 1:
            fileName = "CONTENTLISTINGPAGE-PAGE2"
        case 2:
            fileName = "CONTENTLISTINGPAGE-PAGE3"
        default:
            fileName = "CONTENTLISTINGPAGE-PAGE3"
        }
        if let data = LocalRequest.shared.read(fromFile: fileName),
            let response = try? JSONDecoder().decode(MoviesResponse.self, from: data) {
            completion(response)
        }
    }
    
}
