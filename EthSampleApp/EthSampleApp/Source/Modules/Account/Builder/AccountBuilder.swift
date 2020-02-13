//
//  AccountBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit
class AccountBuilder
{
    static func build(wallet : Wallet)-> AccountViewController{
        let sb = Utility.getStoryboard(sbName: Storyboards.main.getStoryboardName())
        let vc = sb.instantiateViewController(identifier: Controllers.account.getIdentifier()) as! AccountViewController
        let repo = BalanceRepoImplementation()
        vc.viewModel = AccountViewModel(Controllers.account.getNavigationBarTitle(), wallet: wallet, repo : repo)
        return vc
    }
}
