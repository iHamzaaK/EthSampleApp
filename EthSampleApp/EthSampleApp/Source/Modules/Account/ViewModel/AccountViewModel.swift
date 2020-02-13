//
//  AccountViewModel.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
import Web3swift
class AccountViewModel
{
    private var title : String!
    private var wallet : Wallet!
    let web3Rinkeby = Web3.InfuraRinkebyWeb3()
    let repo : BalanceRepo!
    
    init(_ title : String, wallet : Wallet, repo : BalanceRepo){
        self.title = title
        self.wallet = wallet
        self.repo = repo
    }
    
    func getTitle()->String{
        return title
    }
    func getAddress()->String{
        return wallet.getAddress()
    }
    func getBalance(completionHandler : @escaping (String)->Void){
        if Reachability.isConnectedToNetwork(){
            self.repo.getAccountBalance(address: wallet.ethAddress.address) { (success, message, balance) in
                if success{
                    completionHandler(balance)
                }
                else{
                    completionHandler(AlertMessage.notAvailable)
                }
            }
        }
        else{
            completionHandler(AlertMessage.notAvailable)
        }
        
    }
    func didTapOnSign(completionHandler : (_ vc : UIViewController)->Void){
        let signingVC = SigningBuilder.build(wallet: wallet)
        completionHandler(signingVC)
    }
    func didTapOnVerify(completionHandler: (_ vc : UIViewController)->Void){
        let verificationVC = VerificationBuilder.build(wallet: wallet)
        completionHandler(verificationVC)
    }
    
}
