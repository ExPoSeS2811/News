import Foundation

struct NewsResponseObject: Codable {
    let totalResult: Int
    let articles: [ArticleResponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResult
        case articles
    }
}
