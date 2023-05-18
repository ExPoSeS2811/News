import Foundation

final class GeneralViewModel: NewsListViewModel {
    override func loadData(searchText: String? = nil) {
        super.loadData(searchText: searchText)
        
        ApiManager.getNews(from: .general, page: page, searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
