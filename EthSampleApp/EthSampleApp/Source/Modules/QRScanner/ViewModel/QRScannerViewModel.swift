//
//  QRScannerViewModel.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
import Web3swift
class QRScannerViewModel
{
    private let web3Rinkeby = Web3.InfuraRinkebyWeb3()
    private var wallet : Wallet!
    private var title : String!
    private var verificationData : Data!
    init(_ title : String, _ wallet: Wallet, verificationData : Data ){
        self.title = title
        self.wallet = wallet
        self.verificationData = verificationData
    }
    
    func getTitle()->String{
        return title
    }
    func validateSignature(str : String)->Bool{
        do{
            let sigData = try JSONEncoder().encode(verificationData)
            guard let strData = String.init(data: sigData, encoding: .utf8) else { return false }
            if strData == str{
                return true
            }
            return false
        }
        catch{
            return false
        }
    }
}
