//
//  SetupBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit



class SetupBuilder
{
    static func build()-> SetupViewController{
        let sb = Utility.getStoryboard(sbName: Storyboards.main.getStoryboardName())
        let vc = sb.instantiateViewController(identifier: Controllers.setup.getIdentifier()) as! SetupViewController
        vc.viewModel = SetupViewModel(Controllers.setup.getNavigationBarTitle())
        return vc
    }
}
