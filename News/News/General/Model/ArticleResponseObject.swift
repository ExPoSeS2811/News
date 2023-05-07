//
//  ArticleResponseObject.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 4/29/23.
//

import UIKit

struct ArticleResponseObject: Codable {
    let title: String
    let urlToImage: String
    let description: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
