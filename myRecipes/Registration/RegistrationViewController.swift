//
//  RegistrationViewController.swift
//  myRecipes
//
//  Created by Patricia on 4/18/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private(set) var primaryButton: UIButton!
    @IBOutlet private(set) var secondaryButton: UIButton!
    @IBOutlet private var emailAddressTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var logoConstraintForLogin: NSLayoutConstraint!
    @IBOutlet private var logoConstraintForSignup: NSLayoutConstraint!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var secondaryPromptLabel: UILabel!
    
    // MARK: - Overrides
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        primaryButton.layer.borderColor = .brandOrange
        secondaryButton.layer.borderColor = .brandLightGrey
    }
    
    // MARK: - Helper methods
    
    @IBAction private func secondaryButtonTapped(_ sender: UIButton) {
        mode?.toggle()
        swapButtons()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toOnboarding", sender: nil)
    }
    
    private func animate(completion: (() -> Void)? = nil, animations: @escaping () -> Void) {
        UIView.animate(
            withDuration: isAnimatable ? 0.25 : 0,
            animations: animations,
            completion: { _ in completion?() }
        )
    }
    
    private func swapButtons() {
        let duplicatedPrimaryButton = primaryButton.duplicate()
        let duplicatedSecondaryButton = secondaryButton.duplicate()
        
        primaryButton.alpha = 0
        secondaryButton.alpha = 0
        
        let absolutePrimaryButtonFrame = CGRect(
            origin: primaryButton.superview!.convert(primaryButton.frame.origin, to: view),
            size: primaryButton.frame.size
        )
        
        let absoluteSecondaryButtonFrame = CGRect(
            origin: secondaryButton.superview!.convert(secondaryButton.frame.origin, to: view),
            size: secondaryButton.frame.size
        )
        
        duplicatedPrimaryButton.frame = absolutePrimaryButtonFrame
        duplicatedSecondaryButton.frame = absoluteSecondaryButtonFrame
        
        view.addSubview(duplicatedPrimaryButton)
        view.addSubview(duplicatedSecondaryButton)
        
        let swapAnimation = {
            duplicatedPrimaryButton.frame = absoluteSecondaryButtonFrame
            duplicatedPrimaryButton.backgroundColor = .white
            duplicatedPrimaryButton.layer.borderColor = .brandLightGrey
            
            duplicatedSecondaryButton.frame = absolutePrimaryButtonFrame
            duplicatedSecondaryButton.backgroundColor = .brandLightYellow
            duplicatedSecondaryButton.layer.borderColor = .brandOrange
        }
        
        let cleanUpAnimation = {
            self.primaryButton.alpha = 1
            self.secondaryButton.alpha = 1
        }
        
        let cleanUpCompletion: () -> Void = {
            duplicatedPrimaryButton.removeFromSuperview()
            duplicatedSecondaryButton.removeFromSuperview()
        }
        
        let swapCompletion: () -> Void = {
            self.animate(completion: cleanUpCompletion, animations: cleanUpAnimation)
        }
        
        animate(completion: swapCompletion, animations: swapAnimation)
    }
}

// MARK: - RegistrationConfigurable

extension RegistrationViewController: RegistrationConfigurable {
    func configureForLogin() {
        logoConstraintForLogin.isActive = true
        logoConstraintForSignup.isActive = false
        animate { self.view.layoutIfNeeded() }
        
        let primaryButtonTitle = NSLocalizedString("log in", comment: "Registration primary button title for login mode")
        primaryButton.setTitle(primaryButtonTitle, for: .init())
        
        let secondaryButtonTitle = NSLocalizedString("sign up", comment: "Registration secondary button title for login mode")
        secondaryButton.setTitle(secondaryButtonTitle, for: .init())
        
        secondaryPromptLabel.text = NSLocalizedString(
            "don't have an account?",
            comment: "Registration secondary prompt title for login mode"
        )
        
        passwordTextField.placeholder = NSLocalizedString(
            "Password",
            comment: "Registration password text field prompt for login mode"
        )
        
        titleLabel.text = NSLocalizedString(
            "Welcome back!\n",
            comment: "Registration screen title for sign up mode"
        )
    }
    
    func configureForSignup() {
        logoConstraintForLogin.isActive = false
        logoConstraintForSignup.isActive = true
        animate { self.view.layoutIfNeeded() }
        
        let primaryButtonTitle = NSLocalizedString("sign up", comment: "Registration primary button title for sign up mode")
        primaryButton.setTitle(primaryButtonTitle, for: .init())
        
        let secondaryButtonTitle = NSLocalizedString("log in", comment: "Registration secondary button title for sign up mode")
        secondaryButton.setTitle(secondaryButtonTitle, for: .init())
        
        secondaryPromptLabel.text = NSLocalizedString(
            "already have an account?",
            comment: "Registration secondary prompt title for sign up mode"
        )
        
        passwordTextField.placeholder = NSLocalizedString(
            "Create a password",
            comment: "Registration password text field prompt for sign up mode"
        )
        
        titleLabel.text = NSLocalizedString(
            "keep track of your\nfood and recipes",
            comment: "Registration screen title for sign up mode"
        )
    }
}
