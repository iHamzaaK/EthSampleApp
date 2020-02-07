//
//  SignatureBuilder.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 07/02/2020.
//  Copyright (c) 2020 Hamza Khan. All rights reserved.


import UIKit

protocol SignatureBusinessLogic
{
  func doSomething(request: Signature.Something.Request)
}



class SignatureBuilder: SignatureBusinessLogic
{
    func build()-> UIViewController{
        
    }
}
