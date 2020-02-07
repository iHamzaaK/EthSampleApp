//
//  VerificationBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit

protocol VerificationBusinessLogic
{
  func doSomething(request: Verification.Something.Request)
}



class VerificationBuilder: VerificationBusinessLogic
{
    func build()-> UIViewController{
        
    }
}
