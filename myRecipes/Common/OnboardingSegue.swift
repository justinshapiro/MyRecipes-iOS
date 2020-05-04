//
//  OnboardingSegue.swift
//  myRecipes
//
//  Created by Patricia on 5/3/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

import UIKit

protocol OnboardingSegue: class {}

extension OnboardingSegue where Self: UIStoryboardSegue {
    func performSegue(_ varient: RegistrationMode) {
        guard
            let onboardingViewController = source as? OnboardingViewController,
            let registrationViewController = destination as? RegistrationViewController,
            let keyWindow = UIApplication.shared.windows.first
        else {
            self.source.present(self.destination as UIViewController, animated: true)
            return
        }
        
        registrationViewController.loadViewIfNeeded()
        
        let realSourceButton: UIButton = {
            switch varient {
            case .login:  return onboardingViewController.loginButton
            case .signup: return onboardingViewController.signupButton
            }
        }()
        
        let sourceButton = realSourceButton.duplicate()
        let realSourceButtonFrame = realSourceButton.frame
        let destinationButton = registrationViewController.primaryButton!
        
        (destination as! RegistrationConfigurable).mode = varient
        
        realSourceButton.alpha = 0
        destinationButton.alpha = 0
        sourceButton.titleLabel?.font = destinationButton.titleLabel?.font
        destination.view.alpha = 0
        
        let transition = {
            keyWindow.addSubview(self.source.view)
            sourceButton.frame = realSourceButton.superview!.convert(realSourceButtonFrame, to: self.source.view)
            keyWindow.insertSubview(sourceButton, aboveSubview: self.source.view)
            
            let destinationButtonFrame = destinationButton.frame
            let yOffset = self.source.view.layoutMargins.top
            
            let animation = {
                sourceButton.frame = destinationButtonFrame.offsetBy(dx: 0, dy: yOffset)
                sourceButton.backgroundColor = .brandLightYellow
                sourceButton.layer.borderColor = .brandOrange
            }
            
            UIView.animate(withDuration: 0.25, animations: animation) { _ in
                let animations = {
                    self.destination.view.alpha = 1
                    self.source.view.removeFromSuperview()
                }
                
                UIView.animate(withDuration: 0.2, animations: animations) { _ in
                    realSourceButton.alpha = 1
                    destinationButton.alpha = 1
                    sourceButton.removeFromSuperview()
                }
            }
        }
        
        source.present(destination, animated: false, completion: transition)
    }
}
