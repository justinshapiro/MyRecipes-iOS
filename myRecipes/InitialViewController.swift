//
//  InitialViewController.swift
//  myRecipes
//
//  Created by Patricia on 4/18/20.
//  Copyright © 2020 Patricia Figueroa. All rights reserved.
//

import UIKit

final class InitialViewController: UIViewController {
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.windows.first?.backgroundColor = .brandLightYellow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performSegue(withIdentifier: "toOnboarding", sender: nil)
    }
}
