import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? {get set}
    
    var numberOfCells: Int { get }

    func getArticle(for row: Int) -> ArticleCellViewModel

}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    // MARK: - Properties
    private var articles: [ArticleResponseObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()

            }
        }
    }
    
    var numberOfCells: Int {
        return articles.count
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        return ArticleCellViewModel(article: article)
    }
    
    private func loadData() {
        ApiManager.getNews { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
    
//    private func setupMockObjects() {
//        articles = [
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//            ArticleResponseObject(title: "asfopkfsa", description: "asofkaopsfk", urlToImage: "fksaljfoasjf", date: "seiojfiasfj"),
//        ]
//    }
}
