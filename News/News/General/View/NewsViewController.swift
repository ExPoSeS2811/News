import UIKit

final class NewsViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var newsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = view.frame.size
        
        return scrollView
    }()
    
    private lazy var containerForNewsImageView: UIView = {
        let view = UIView()
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 4)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 4
        
        view.alpha = 0
        UIView.animate(withDuration: 1) {
            view.alpha = 1
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        return view
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = #imageLiteral(resourceName: "image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 48
        imageView.layer.cornerCurve = .continuous
        
        return imageView
    }()
    
    private lazy var newsDateLabel: UILabel = {
        let label = UILabel()
        
        label.text = "23.01.02"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .darkGray
        
        return label
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.font = .boldSystemFont(ofSize: 32)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var newsDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "lsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosgelsdfasejlfapoegpoiaehkejglahelkgaekgoidgjergjposerhj;laerjgkaehtkjkhtposkykaesbkjjeotakr[pohjadljkgwkjgjaosge"
        label.font = .italicSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .systemIndigo
        setupUI()
    }
        
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        
        containerForNewsImageView.addSubview(newsImageView)
        newsScrollView.addSubview(containerForNewsImageView)
        newsScrollView.addSubview(newsDateLabel)
        newsScrollView.addSubview(newsTitleLabel)
        newsScrollView.addSubview(newsDescriptionLabel)
        view.addSubview(newsScrollView)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        newsScrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerForNewsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        newsImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        newsDateLabel.snp.makeConstraints { make in
            make.top.equalTo(containerForNewsImageView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerForNewsImageView)
        }
        
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsDateLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(newsDateLabel)
        }
        
        newsDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(newsTitleLabel)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    @objc
    private func handleTap(_ sender: UITapGestureRecognizer) {
        let containerLayer = containerForNewsImageView.layer
        
        UIView.animate(withDuration: 0.2, animations: {
            containerLayer.shadowOpacity = 0
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                UIView.animate(withDuration: 0.2) {
                    containerLayer.shadowOpacity = 1
                }
            }
        }
    }
}
