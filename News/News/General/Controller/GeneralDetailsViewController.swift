//
//  GeneralDetailsViewController.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 4/29/23.
//

import UIKit

final class GeneralDetailsViewController: UIViewController {
    // MARK: - GUI Variables
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = true
        scroll.contentSize = view.frame.size
        return scroll
        
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        if let generalImage {
            view.image = generalImage
        }
        
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
            
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        if let generalTitle {
            label.text = generalTitle
        }
        
        label.font = .boldSystemFont(ofSize: 32)
        label.numberOfLines = 0

        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .italicSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    // MARK: - Properties
    var generalImage: UIImage?
    var generalTitle: String?
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .systemIndigo
        setupUI()
    }
    
    // MARK: - Methods
    
    // MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(descriptionLabel)

        setupConstraints()
    }
    
    private func setupConstraints() {
        // configureImageView()
        scrollView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(view.safeAreaLayoutGuide)            
        }

        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(imageView)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
