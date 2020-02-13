//
//  Stubs.swift
//  EthSampleAppTests
//
//  Created by Hamza Khan on 11/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation
import Web3swift
@testable import EthSampleApp
let textFieldDelegateError = "ViewController does not conform to textField delegate protocol"
let textFieldNilError = "ViewController does not have a textField"
let imageViewNilError = "ViewController does not have a ImageView"
let SignatureMessageLabelNilError = "ViewController does not have a Signature Message Label"

let AccountAddressLabelNilError = "ViewController does not have a account address label"
let AccountBalanceLabelNilError = "ViewController does not have a account balance label"
let AccountSignButtonNilError = "ViewController does not have a account address label"
let AccountVerifyButtonNilError = "ViewController does not have a account address label"
let sampleEmptyMessage = ""
let sampleMessage = "Test"
let sampleBalance = "0.0 Ether"
let sampleAccount = Utility.createAccountForTesting(password: "password")
let samplePrivateKey = sampleAccount?.toHexString() ?? ""
let samplePkData = Data(hex: samplePrivateKey)
let sampleAccountAddress = "0xfe976ca39bc949def5cd2e1d7172622eb647ece9"
let sampleEthAddress = EthereumAddress(sampleAccountAddress)
let sampleWallet = Wallet(ethAddress: sampleEthAddress, pkData: samplePkData)


