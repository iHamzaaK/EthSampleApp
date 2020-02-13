//
//  SigningViewModel.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.
//

import UIKit
import Web3swift
class SigningViewModel
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
    func didTapOnSign(_ message : String, completionHandler : @escaping(UIImage?)->Void){
        DispatchQueue.global().async {
            guard let signatureData = self.signTransaction(message) else {
                completionHandler(nil)
                return
            }
            guard let img = self.signTransactionQR(signature: signatureData) else {
                completionHandler(nil)
                return
            }
            completionHandler(img)
        }
    }
    
    private func signTransactionQR(signature : Data)-> UIImage?{
        guard let qrData = Utility.convertSignatureToQrData(signature: signature) else { return nil}
        print(signature)
        return Utility.generateQRCode(from: qrData)
    }
    private func signTransaction(_ message : String)-> Data?{
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
