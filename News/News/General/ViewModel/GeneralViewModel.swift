import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? {get set}
    var reloadCell: ((Int) -> Void)? { get set }
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
    
    private func loadData() {
        // TODO: PAGE
        ApiManager.getNews(from: .general, page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                self.articles = self.convertToCellViewModel(articles)
                self.loadImage()
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func loadImage() {
        // TODO: get image data
//        guard let url = URL(string: articles[row].imageUrl),
//              let data = try? Data(contentsOf: url) else { return }
        for (index, article) in articles.enumerated() {
            guard let url = article.imageUrl else { return }
            ApiManager.getImageData(url: url) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.articles[index].imageData = data
                        self?.reloadCell?(index)
                    case .failure(let error):
                        self?.showError?(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    private func convertToCellViewModel(_ articles: [ArticleResponseObject]) -> [ArticleCellViewModel] {
        articles.map { ArticleCellViewModel(article: $0) }
    }
    
}
