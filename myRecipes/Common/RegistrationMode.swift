//
//  RegistrationMode.swift
//  myRecipes
//
//  Created by Patricia on 5/3/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

enum RegistrationMode {
    case login
    case signup
    
    mutating func toggle() {
        switch self {
        case .login:  self = .signup
        case .signup: self = .login
        }
    }
}
