//
//  QRScannerBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit
class QRScannerBuilder
{
    static func build(signature : Data, wallet : Wallet)-> QRScannerViewController{
        let sb = Utility.getStoryboard(sbName: Storyboards.main.getStoryboardName())
        let vc = sb.instantiateViewController(identifier: Controllers.qrscanner.getIdentifier()) as! QRScannerViewController
        vc.viewModel = QRScannerViewModel(Controllers.qrscanner.getNavigationBarTitle(), wallet, verificationData: signature)
        return vc
    }
}
