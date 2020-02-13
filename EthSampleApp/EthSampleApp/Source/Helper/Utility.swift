//
//  Utility.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import UIKit
import Web3swift
class Utility{
    
    static func getStoryboard(sbName : String)-> UIStoryboard{
        return UIStoryboard.init(name: sbName, bundle: nil)
    }
    static func getUserDirectory()->String{
        guard let userDir =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return ""}
        return userDir
    }
    static func getPrivateKeyFromAddress(ksManager: KeystoreManager, password: String , ethAddress : EthereumAddress)-> Data?{
        do{
            let pkData = try ksManager.UNSAFE_getPrivateKeyData(password: password, account: ethAddress)
            return pkData
        }catch{
            print("Error")
            return nil
        }
    }
    static func generateQRCode(from data: Data) -> UIImage? {
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    static func createAccountForTesting(password : String)-> Data?{
        do{
            let userDir = Utility.getUserDirectory()
            guard let keystoreManager = KeystoreManager.managerForPath(userDir + Constants.keyStorePath) else { return nil }
            var ks: EthereumKeystoreV3?
            guard let ksManagerAddresses = keystoreManager.addresses else { return nil }
            if (ksManagerAddresses.count == 0) {
                ks = try EthereumKeystoreV3(password: password)
                let keydata = try JSONEncoder().encode(ks?.keystoreParams)
                FileManager.default.createFile(atPath: userDir + Constants.keyStorePath + Constants.userKeyPath, contents: keydata, attributes: nil)
            } else {
                guard let address = ksManagerAddresses.first else { return nil }
                guard let wallet = keystoreManager.walletForAddress(address) else { return nil}
                ks = wallet as? EthereumKeystoreV3
            }
            guard let sender = ks?.addresses?.first else {return nil}
            print(sender)
            guard let privateKeyData = Utility.getPrivateKeyFromAddress(ksManager: keystoreManager, password: password, ethAddress: sender) else { return nil }
            print(privateKeyData.toHexString())
            return privateKeyData
            
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
    static func validateMessage(message : String)->Bool{
        if message.count < 1{
            return false
        }
        return true
    }
    static func getCustomURL()->String{
        return Constants.baseUrl + Constants.infuraProjectKey
    }
    static func convertSignatureToQrData(signature : Data)->Data?{
        do{
            let sigData = try JSONEncoder().encode(signature)
            guard let strData = String.init(data: sigData, encoding: .utf8) else { return nil }
            return strData.data(using: .utf8)
        }catch{
            return nil
        }
    }
    static func convertWeiToEth(weiBalance : UInt64)->Double{
        let wei : Double = Double(weiBalance)
        let weiConversion : Double =  1000000000000000000
        let ethBalance = wei/weiConversion
        return ethBalance
    }
    static func getEthBalance(weiBalance : UInt64)->String{
        let ethBalance = convertWeiToEth(weiBalance: weiBalance)
        return "\(ethBalance) Ether"
    }
}
