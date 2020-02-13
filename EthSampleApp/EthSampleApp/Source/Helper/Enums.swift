//
//  Enums.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation

enum Storyboards {
    case main
    func getStoryboardName()->String{
        switch self {
        case .main:
            return "Main"
        }
    }
}
enum Controllers{
    case setup
    case account
    case signing
    case signature
    case verification
    case qrscanner
    func getNavigationBarTitle()->String{
        switch self {
        case .setup:
            return "Setup"
        case .account:
            return "Account"
        case .signing:
            return "Signing"
        case .signature:
            return "Signature"
        case .verification:
            return "Verification"
        case .qrscanner:
            return "QR Scanner"
        }
    }
    func getIdentifier()->String{
        switch self {
        case .setup:
            return "SetupViewController"
        case .account:
            return "AccountViewController"
        case .signing:
            return "SigningViewController"
        case .signature:
            return "SignatureViewController"
        case .verification:
            return "VerificationViewController"
        case .qrscanner:
            return "QRScannerViewController"
        }
    }
}
