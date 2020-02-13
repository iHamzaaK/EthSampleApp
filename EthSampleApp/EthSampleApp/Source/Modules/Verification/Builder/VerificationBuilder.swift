//
//  VerificationBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit
class VerificationBuilder
{
    static func build(wallet : Wallet)-> VerificationViewController{
        let sb = Utility.getStoryboard(sbName: Storyboards.main.getStoryboardName())
        let vc = sb.instantiateViewController(identifier: Controllers.verification.getIdentifier()) as! VerificationViewController
        vc.viewModel = VerificationViewModel(Controllers.verification.getNavigationBarTitle(), wallet)
        return vc
    }
}
