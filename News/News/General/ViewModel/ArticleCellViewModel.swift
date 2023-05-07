//
//  ArticleCellViewModel.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 5/6/23.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    let imageUrl: String
    var imageData: Data?
    
    init(article: ArticleResponseObject) {
        self.title = article.title
        self.description = article.description
        self.date = article.date
        self.imageUrl = article.urlToImage
    }
}
