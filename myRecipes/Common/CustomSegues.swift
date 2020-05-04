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

final class RegistrationSheetSlideDownSegue: UIStoryboardSegue {
    override func perform() {
        guard let onboardingViewController = destination as? OnboardingViewController else {
            return
        }
        
        let completion: () -> Void = {
            let animations = {
                onboardingViewController.sheetViewExpandedConstraint.isActive = false
                onboardingViewController.sheetViewCollapsedConstraint.isActive = true
                onboardingViewController.view.layoutIfNeeded()
            }
            
            UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: animations) { _ in
                onboardingViewController.sheetView.isHidden = true
                
            }
        }
        
        source.dismiss(animated: false, completion: completion)
    }
}
