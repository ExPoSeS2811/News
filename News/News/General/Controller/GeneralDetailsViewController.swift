//
//  GeneralDetailsViewController.swift
//  News
//
//  Created by MacBook Pro 13 2019 on 4/29/23.
//

import UIKit

final class GeneralDetailsViewController: UIViewController {
    // MARK: - GUI Variables
    private lazy var newsScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.contentSize = contentSize
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image =  #imageLiteral(resourceName: "image")
        imageView.layer.cornerRadius = 24
        imageView.layer.cornerCurve = .continuous
        imageView.layer.shadowColor = UIColor.systemIndigo.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.shadowOpacity = 1
        imageView.layer.masksToBounds = true


        
        return imageView
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        label.text = "Title for u"
        label.textColor = .black

        
        return label
    }()
    
    private lazy var newsDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .italicSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "oifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjjoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjfaslfjasoifjsaoifjj"
        label.translatesAutoresizingMaskIntoConstraints = false // установите это в false

        
        return label
    }()

    // MARK: - Properties
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: 10000)
    }
    
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
        newsScrollView.addSubview(newsImageView)
        newsScrollView.addSubview(newsTitleLabel)
        newsScrollView.addSubview(newsDescriptionLabel)
        view.addSubview(newsScrollView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        newsScrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        newsImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(8)
            make.left.right.equalTo(newsImageView)
        }
        
        newsDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(16)
            make.left.right.equalTo(newsTitleLabel)
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
