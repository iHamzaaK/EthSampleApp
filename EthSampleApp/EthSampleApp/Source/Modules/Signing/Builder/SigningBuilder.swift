//
//  SigningBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit
class SigningBuilder
{
    static func build(wallet : Wallet)-> SigningViewController{
        let sb = Utility.getStoryboard(sbName: Storyboards.main.getStoryboardName())
        let vc = sb.instantiateViewController(identifier: Controllers.signing.getIdentifier()) as! SigningViewController
        vc.viewModel = SigningViewModel(Controllers.signing.getNavigationBarTitle(), wallet)
        return vc
    }
}
