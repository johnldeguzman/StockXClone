//
//  UIView+Extensions.swift
//  ShopWithFriends
//
//  Created by John De Guzman on 2019-03-19.
//  Copyright © 2019 John De Guzman. All rights reserved.
//

import UIKit

extension UIView {
    
    static func createStackView(direction: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView()
        stack.axis = direction
        return stack
    }
    
    public func fill(with view: UIView) {
        view.frame = bounds
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        view.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    }
}
