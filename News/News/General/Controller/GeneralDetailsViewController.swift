//
//  GeneralDetailsViewController.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 4/29/23.
//

import UIKit

final class GeneralDetailsViewController: UIViewController {
    // MARK: - GUI Variables
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        if let generalImage {
            view.image = generalImage
        }
        
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = UIColor.systemIndigo.cgColor
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 1
            
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
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        // configureImageView()
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(imageView)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(titleLabel)

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
