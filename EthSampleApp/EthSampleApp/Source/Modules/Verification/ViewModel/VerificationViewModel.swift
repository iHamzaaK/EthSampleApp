//
//  VerificationViewModel.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
import Web3swift

class VerificationViewModel
{
    private var title : String!
    var wallet : Wallet!
    let web3Rinkeby = Web3.InfuraRinkebyWeb3()
    
    init(_ title : String, _ wallet: Wallet){
        self.title = title
        self.wallet = wallet
    }
    
    func getTitle()->String{
        return title
    }
    func getWallet()->Wallet{
        return wallet
    }
    func didTapOnSign(_ message : String, completionHandler : @escaping(Data?)->Void){
        DispatchQueue.global().async {
            guard let data = self.signTransaction(message) else {
                completionHandler(nil)
                return }
            completionHandler(data)
        }
    }
    func signTransaction(_ message : String)-> Data?{
        guard let data = message.data(using: .utf8) else { return nil }
        do{
            web3Rinkeby.addKeystoreManager(wallet.getKeyStoreManager())
            let signature = try web3Rinkeby.personal.signPersonalMessage(message: data, from: wallet.ethAddress)
            return signature
        }
        catch{
            return nil
        }
        
    }
}
