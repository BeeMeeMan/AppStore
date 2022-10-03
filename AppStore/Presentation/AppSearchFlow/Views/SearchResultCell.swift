//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import UIKit
import Kingfisher

class SearchResultCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var resultVM: ResultViewModel! {
        didSet {
            configureWithViewModel()
        }
    }
    
    private let imageView = UIImageView()
        .setBackgroundColor(.green)
        .pinDimentions(height: 64, width: 64)
        .setCornerRadius(12)
    
    private let nameLabel = UILabel("APP NAME")
        .setFont()
    
    private let categoryLabel = UILabel("Photos & video")
        .setFont()
    
    private let ratingsLabel = UILabel("9.26M")
        .setFont()
    
    private let getButton = UIButton(type: .system)
        .setTitle("GET", color: .blue, font: .boldSystemFont(ofSize: 14))
        .setBackgroundColor(.lightGray)
        .pinDimentions(width: 80)
        .setCornerRadius(12)
    
    private lazy var screenshotImages: [UIImageView] = {
        var subImages =  [UIImageView]()
        (0...2).forEach { _ in
            let imageView = UIImageView()
            imageView.setCornerRadius(8)
                .setBorder(0.5, color: .init(white: 0.5, alpha: 0.5))
                .contentMode = .scaleAspectFill
            
            subImages.append(imageView)
        }
        
        return subImages
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    // MARK: - API
    
    private func configureWithViewModel() {
        if let viewModel = resultVM {
            nameLabel.text = viewModel.name
            categoryLabel.text = viewModel.category
            ratingsLabel.text = viewModel.rating
            KF.url(viewModel.iconImageUrl)
                .placeholder(UIImage(systemName: "photo"))
                .fade(duration: 0.25)
                .set(to: imageView)
            
            viewModel.previewImagesUrl.enumerated() .forEach { index, url in
                if index < 3 {
                    KF.url(url)
                        .fade(duration: 0.25)
                        .set(to: screenshotImages[index])
                }
            }
        }
    }
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        backgroundColor = .white
        
        let labelsStack = VStack(subviews: [nameLabel, categoryLabel, ratingsLabel])
        let imageStack = HStack(subviews: screenshotImages, spacing: 12, distribution: .fillEqually)
        let infoStack = HStack(subviews: [imageView, labelsStack, getButton], spacing: 12, alignment: .center)
        let overallStack = VStack(subviews: [infoStack, imageStack], spacing: 12)
            .setPadding(top: 16, left: 16, bottom: 16, right: 16)
        
        addSubview(overallStack)
        overallStack.pinAll()
    }
}
