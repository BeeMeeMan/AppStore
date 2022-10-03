//
//  UILable+Extensions.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import UIKit

extension UILabel {
    func setText(_ text: String) -> Self {
        self.text = text
        return self
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
