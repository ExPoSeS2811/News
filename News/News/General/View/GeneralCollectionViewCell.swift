//
//  GeneralCollectionViewCell.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 4/29/23.
//

import UIKit
import SnapKit

final class GeneralCollectionViewCell: UICollectionViewCell {
    // MARK: - GUI variables
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image") ?? UIImage.remove
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "title"
        label.textColor = .white
        
        return label
    }()
    
    private lazy var blackView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.5
        
        return view
    }()
    
    // MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure(news: News) {
        imageView.image = news.imageNews
        titleLabel.text = news.title
    }
    
    // MARK: - Private methods
    private func setupUI() {
        
        addSubview(imageView)
        addSubview(blackView)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview()
        }
        
        blackView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(blackView)
            make.leading.trailing.equalTo(blackView).offset(5)
        }
    }
}

/*
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let generalDetailsVC = segue.destination as? GeneralDetailsViewController {
         guard let indexPath = collectionView.indexPathsForSelectedItems else { return false }
         generalDetailsVC
     }
 }
 */
