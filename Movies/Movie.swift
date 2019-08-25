//
//  Movie.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

// MARK: - Content
struct Movie: Codable {
    let name: String
    let posterImage: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case posterImage = "poster-image"
    }
}
