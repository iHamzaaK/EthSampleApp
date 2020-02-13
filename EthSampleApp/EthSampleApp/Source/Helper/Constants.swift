//
//  Constants.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import UIKit
class Constants {
    static let font : String = "System"
    static let navigationTitleFontSize : CGFloat = 42.0
    static let textFieldBgColor = "F1F1F2"
    static let mainStoryboard = "Main"
    static let keyStorePath = "/keystore"
    static let userKeyPath = "/userKey.json"
    static let baseUrl = "https://rinkeby.infura.io/v3/"
    static let infuraProjectKey = "e6f1721a0a85488cbb98bd126cfd6211"
    static let passwordForEthAccount = "password"
    static let messageLabel = "Message:"
}

class AlertMessage {
    static let title = "Error"
    static let okButtonTitle = "Ok"
    static let cancelButtonTitle = "Cancel"
    static let notAvailable = "N/A"
    static let textForQrNotEntered = "Enter message to sign"
    static let qrFailure = "Couldn't scan QR"
    static let signatureValid = "Signature is valid"
    static let signatureInvalid = "Signature is invalid"
    static let enterPrivateKey = "Enter private key to continue"
}

