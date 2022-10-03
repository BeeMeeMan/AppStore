//
//  UIButton+Extensions.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import UIKit

extension UIButton {
    func setImage(_ image: UIImage?, state: UIControl.State = .normal) -> Self {
        self.setImage(image, for: state)
        return self
    }
    
    func setTarget(_ target: Any?, selector: Selector, for event: UIControl.Event = .touchUpInside) -> Self {
        self.addTarget(target, action: selector, for: event)
        return self
    }
    
    func setTitle(_ title: String? = nil, color: UIColor? = nil, font: UIFont? = nil, state: UIControl.State = .normal) -> Self {
        if let title = title {
            self.setTitle(title, for: state)
        }
        
        if let color = color {
            self.setTitleColor(color, for: state)
        }
       
        if let font = font {
            self.titleLabel?.font = font
        }
        
        return self
    }
}

