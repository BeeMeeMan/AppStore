//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 03.10.2022.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel("App Section")
        .setFont(.boldSystemFont(ofSize: 30))
    
    // MARK: - Properties
    
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
    
    // MARK: - Helper Functions
    
    private func configureUI() {
        backgroundColor = .lightGray
       
        addSubview(titleLabel)
        titleLabel
            .pin(top: topAnchor, 6)
            .pin(leading: leadingAnchor, 12)
            .closeEdit()
    }
}

