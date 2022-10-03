//
//  UIView+Anchors.swift
//  AppStore
//
//  Created by Yevhenii Korsun on 02.10.2022.
//

import UIKit

extension UIView {
    enum AxisType {
        case xAxis
        case yAxis
        case allAxis
    }
    
    func pin(top: NSLayoutYAxisAnchor, _ padding: CGFloat = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: top, constant: padding).isActive = true
        return self
    }
    
    func pin(bottom: NSLayoutYAxisAnchor, _ padding: CGFloat = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: bottom, constant: -padding).isActive = true
        return self
    }
    
    func pin(leading: NSLayoutXAxisAnchor, _ padding: CGFloat = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: leading, constant: padding).isActive = true
        return self
    }
    
    func pin(trailing: NSLayoutXAxisAnchor, _ padding: CGFloat = .zero) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: trailing, constant: -padding).isActive = true
        return self
    }
    
    func pinDimentions(height: CGFloat? = nil , width: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        return self
    }
    
    func center(by: AxisType,
                constant: CGFloat = 0,
                constantAllX: CGFloat = 0,
                constantAllY: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        
        switch by {
        case .xAxis:
            if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: constant).isActive = true
            }
        case .yAxis:
            if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor, constant: constant).isActive = true
            }
        case .allAxis:
            if let superviewCenterXAnchor = superview?.centerXAnchor,
               let superviewCenterYAnchor = superview?.centerYAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: constantAllX).isActive = true
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor, constant: constantAllY).isActive = true
            }
        }
        
        return self
    }
    
    func pinAll(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func closeEdit() { }
}
