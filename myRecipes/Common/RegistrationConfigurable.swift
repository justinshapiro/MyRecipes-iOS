//
//  RegistrationConfigurable.swift
//  myRecipes
//
//  Created by Patricia on 5/3/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

import UIKit

protocol RegistrationConfigurable: class {
    func configureForLogin()
    func configureForSignup()
}

extension RegistrationConfigurable {
    var mode: RegistrationMode? {
        get {
            objc_getAssociatedObject(self, &AssociationKeys.mode) as? RegistrationMode
        }
        
        set {
            switch newValue {
            case .login:  configureForLogin()
            case .signup: configureForSignup()
            case .none:   break
            }
            
            objc_setAssociatedObject(self, &AssociationKeys.mode, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension RegistrationConfigurable where Self: UIViewController {
    var isAnimatable: Bool {
        mode != nil
    }
}

fileprivate struct AssociationKeys {
    static var mode = "registrationMode"
}
