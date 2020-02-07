//
//  QRScannerBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit

protocol QRScannerBusinessLogic
{
  func doSomething(request: QRScanner.Something.Request)
}



class QRScannerBuilder: QRScannerBusinessLogic
{
    func build()-> UIViewController{
        
    }
}
