//
//  BaseNavigationViewController.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 08/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
}
// MARK: Custom Functions
extension BaseNavigationViewController{
    private func setupView(){
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: Constants.font, size: Constants.navigationTitleFontSize) ??
                UIFont.boldSystemFont(ofSize: Constants.navigationTitleFontSize)]
    }
}
