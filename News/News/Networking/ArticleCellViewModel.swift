import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    
    init(article: ArticleResponseObject) {
        self.title = article.title
        self.description = article.description
        self.date = article.date
    }
}
