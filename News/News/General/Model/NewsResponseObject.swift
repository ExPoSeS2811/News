//
//  NewsResponseObject.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 5/5/23.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
