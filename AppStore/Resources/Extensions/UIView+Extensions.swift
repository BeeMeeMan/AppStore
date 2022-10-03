//
//  UIView+Extensions.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import Foundation
import UIKit

extension UIView {
    func setBackgroundColor(_ color: UIColor, opacity: Double = 1) -> Self {
        self.backgroundColor = color.withAlphaComponent(opacity)
        return self
    }
    
    func setCornerRadius(_ radius: CGFloat) -> Self {
        self.layer.cornerRadius = radius
        return self
    }
    
    func setBorder(_ width: CGFloat, color: UIColor = .black) -> Self {
        self.clipsToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = color.cgColor
        return self
    }
}
