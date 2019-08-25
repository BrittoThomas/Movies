//
//  Movies.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

// MARK: - ContentItems
struct Movies: Codable {
    let list: [Movie]
    enum CodingKeys: String, CodingKey {
        case list = "content"
    }
}
