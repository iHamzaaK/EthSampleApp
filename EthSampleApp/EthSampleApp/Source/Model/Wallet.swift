//
//  Wallet.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 08/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation
import Web3swift
struct Wallet{
    var ethAddress: EthereumAddress!
    var pkData: Data!
    func getKeyStoreManager()->KeystoreManager?{
        guard let keystore = EthereumKeystoreV3(self.pkData) else { return nil }
        return  KeystoreManager([keystore])
    }
    func getAddress()->String{
        return ethAddress.address.lowercased()
    }
    func getKeyStore()-> KeystoreManager?{
        guard let keystore = EthereumKeystoreV3(self.pkData) else { return nil }
        return KeystoreManager([keystore])

    }
}
