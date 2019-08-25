//
//  Page.swift
//  Movies
//
//  Created by apple on 25/08/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

// MARK: - Page
struct Page: Codable {
    let title: String
    let totalContentItems: String
    let pageNum: String
    let pageSize: String
    let movies: Movies
    
    enum CodingKeys: String, CodingKey {
        case title
        case totalContentItems = "total-content-items"
        case pageNum = "page-num"
        case pageSize = "page-size"
        case movies = "content-items"
    }
}
