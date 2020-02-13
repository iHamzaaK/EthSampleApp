//
//  SignatureBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit

class SignatureBuilder
{
    static func build(_ img : UIImage, msg : String)-> SignatureViewController{
        let sb = Utility.getStoryboard(sbName: Storyboards.main.getStoryboardName())
        let vc = sb.instantiateViewController(identifier: Controllers.signature.getIdentifier()) as! SignatureViewController
        vc.viewModel = SignatureViewModel(Controllers.verification.getNavigationBarTitle(), img, msg: msg)
        return vc
    }
}
