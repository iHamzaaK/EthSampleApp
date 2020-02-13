//
//  UINavigation.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 08/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import UIKit

extension UINavigationController{
    func makeInitialVC(_ vc : UIViewController){
        self.viewControllers = [vc]
    }
}
