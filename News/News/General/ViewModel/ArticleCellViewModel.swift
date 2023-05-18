import Foundation

final class ArticleCellViewModel: TableCollectionViewItemsProtocol {
    let title: String
    let description: String
    let date: String
    let imageUrl: String?
    var imageData: Data?
    
    init(article: ArticleResponseObject) {
        self.title = article.title ?? " "
        self.description = article.description ?? " "
        self.date = article.date ?? " "
        self.imageUrl = article.urlToImage ?? " "
    }
}
