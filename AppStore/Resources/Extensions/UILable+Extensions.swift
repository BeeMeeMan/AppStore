//
//  UILable+Extensions.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import UIKit

extension UILabel {
    convenience init(_ title: String) {
        self.init(frame: .zero)
        self.text = title
    }

    func setFont(_ font: UIFont = .systemFont(ofSize: 12), textColor: UIColor = .black) -> UILabel {
        self.font = font
        self.textColor = textColor
        return self
    }
    
    func setAlignment(_ alignment: NSTextAlignment) -> UILabel {
        self.textAlignment = alignment
        return self
    }
}
