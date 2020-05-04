//
//  ViewController.swift
//  myRecipes
//
//  Created by Patricia on 4/13/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private(set) var loginButton: UIButton!
    @IBOutlet private(set) var signupButton: UIButton!
    @IBOutlet private var imageViews: [UIImageView]!
    @IBOutlet private var pageControl: UIPageControl!
    @IBOutlet private var scrollView: UIScrollView!
    
    // MARK: - Overrides
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginButton.layer.borderColor = .brandLightGrey
        signupButton.layer.borderColor = .brandLightGrey
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // this needs to happen in viewDidLayoutSubviews
        // to ensure the image view is always a perfect circle
        imageViews.forEach {
            $0.layer.borderColor = .white
            $0.layer.cornerRadius = min($0.bounds.width, $0.bounds.height) / 2
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        UIApplication.shared.windows.first?.backgroundColor = .white
    }
}

// MARK: - UIScrollViewDelegate

extension OnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
