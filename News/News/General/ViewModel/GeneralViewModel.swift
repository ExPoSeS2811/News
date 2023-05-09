import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? {get set}
    var reloadCell: ((Int) -> Void)? { get set }
    
    var numberOfCells: Int { get }

    func getArticle(for row: Int) -> ArticleCellViewModel

}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadCell: ((Int) -> Void)?
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    // MARK: - Properties
    private var articles: [ArticleCellViewModel] = [] {
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
        loadImage(for: row)
        return article
    }
    
    private func loadData() {
        ApiManager.getNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.articles = self.converToCellViewModel(articles)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func converToCellViewModel(_ articles: [ArticleResponseObject]) -> [ArticleCellViewModel] {
        articles.map { ArticleCellViewModel(article: $0) }
    }
    
    private func loadImage(for row: Int) {
        // TODO: get image data
        guard let url = URL(string: articles[row].imageUrl),
              let data = try? Data(contentsOf: url) else { return }
        articles[row].imageData = data
        reloadCell?(row)
        
    }
}
