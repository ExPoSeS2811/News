import UIKit

final class GeneralDetailsViewController: UIViewController {
    // MARK: - GUI Variables
    lazy var newsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = true
        scrollView.contentSize = view.frame.size
        
        return scrollView
    }()
    
    lazy var containerForNewsImageView: UIView = {
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
    
    lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 48
        imageView.layer.cornerCurve = .continuous
        
        return imageView
    }()
    
    lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 32)
        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var newsDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .italicSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
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
        newsScrollView.addSubview(newsTitleLabel)
        newsScrollView.addSubview(newsDescriptionLabel)
        view.addSubview(newsScrollView)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        newsScrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view.safeAreaLayoutGuide)
        }
    
        containerForNewsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        newsImageView.snp.makeConstraints { make in
            make.top.trailing.leading.bottom.equalToSuperview()
        }
        
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerForNewsImageView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(containerForNewsImageView)
        }
        
        newsDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(newsTitleLabel)
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
