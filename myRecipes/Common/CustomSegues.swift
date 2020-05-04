//
//  CustomSegues.swift
//  myRecipes
//
//  Created by Patricia on 4/18/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

import UIKit

final class SignUpButtonSlideInAndExpandSegue: UIStoryboardSegue, OnboardingSegue {
    override func perform() {
        performSegue(.signup)
    }
}

final class LoginButtonSlideInAndExpandSegue: UIStoryboardSegue, OnboardingSegue {
    override func perform() {
        performSegue(.login)
    }
}
