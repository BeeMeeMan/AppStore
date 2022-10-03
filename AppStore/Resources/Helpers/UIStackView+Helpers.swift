//
//  UIStackView+Extensions.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import UIKit

class VStack: UIStackView {
    init(subviews: [UIView] = [], spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill) {
        super.init(frame: .zero)
        subviews.forEach { addArrangedSubview($0) }
        self.axis = .vertical
        self.spacing = spacing
        
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class HStack: UIStackView {
    init(subviews: [UIView] = [], spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill) {
        super.init(frame: .zero)
        subviews.forEach { addArrangedSubview($0) }
        self.axis = .horizontal
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIStackView {
    func setPadding(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> Self {
        self.layoutMargins = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        self.isLayoutMarginsRelativeArrangement = true
        return self
    }
}
