//
//  SetupViewModel.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
import Web3swift
class SetupViewModel
{
    private var title : String!
    private let web3Rinkeby = Web3.InfuraRinkebyWeb3()
    private var pkKey : Data?
    init(_ title : String){
        self.title = title
//        self.testAccount()
    }
    
    func getTitle()->String{
        return title
    }
    func getPkKey()->String{
        guard let pkKey = pkKey else { return ""}
        return pkKey.toHexString()
    }
    func testAccount(){
        guard let testPkKeyData = Utility.createAccountForTesting(password: Constants.passwordForEthAccount) else { return }
        pkKey = testPkKeyData
    }
    
    func didTapOnDone(_ strPrivateKey : String , completionHandler : (_ vc : UIViewController?)->Void){
        checkPrivateKey(privateKey: strPrivateKey) { (success, wallet) in
            if success{
                guard let wallet = wallet else {
                    completionHandler(nil)
                    return
                }
                let accountVC = AccountBuilder.build(wallet: wallet)
                completionHandler(accountVC)
            }
            else{
                completionHandler(nil)
            }
        }
    }
    func checkPrivateKey(privateKey: String, completionHandler: (_ succeess : Bool , _ wallet : Wallet?)->Void){
        let formattedKey = privateKey.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let dataKey = Data.fromHex(formattedKey) else { return }
        do{
            guard let keystore = try EthereumKeystoreV3(privateKey: dataKey) else {
                completionHandler(false,nil)
                return
            }
            let keyData = try JSONEncoder().encode(keystore.keystoreParams)
            let keystoreManager = KeystoreManager([keystore])
            guard let arrAddress = keystoreManager.addresses else {
                completionHandler(false,nil)
                return
            }
            guard let address = arrAddress.first else {
                completionHandler(false,nil)
                return
            }
            print(address)
            print(keyData.toHexString())
            let wallet = Wallet(ethAddress: address, pkData: keyData)
            completionHandler(true,wallet)
        }catch{
            completionHandler(false,nil)
        }
    }
}
