//
//  UIButtonExtensions.swift
//  myRecipes
//
//  Created by Patricia on 5/3/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

import UIKit

extension UIButton {
    func duplicate() -> UIButton {
        let newButton = UIButton()
        newButton.backgroundColor = backgroundColor
        newButton.setTitle(titleLabel?.text, for: .init())
        newButton.setTitleColor(titleLabel?.textColor, for: .init())
        newButton.titleLabel?.font = titleLabel?.font
        newButton.layer.cornerRadius = layer.cornerRadius
        newButton.layer.borderWidth = layer.borderWidth
        newButton.layer.borderColor = layer.borderColor
        
        return newButton
    }
}
