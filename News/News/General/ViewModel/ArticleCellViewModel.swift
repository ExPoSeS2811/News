import Foundation

final class ArticleCellViewModel: TableCollectionViewItemsProtocol {
    let title: String
    let description: String
    let imageUrl: String?
    var imageData: Data?
    var date: String
    
    init(article: ArticleResponseObject) {
        self.title = article.title ?? " "
        self.description = article.description ?? " "
        self.date = article.date
        self.imageUrl = article.urlToImage ?? " "
        
        if let formatDate = convertToDate(dateString: self.date) {
            self.date = formatDate
        }
    }
    
    private func convertToDate(dateString: String) -> String? {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"

        return dateFormatter.string(from: date)
    }
}
